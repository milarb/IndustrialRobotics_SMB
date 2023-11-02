function TM12RMRCTrajectory = getTM12RMRCTraj(xStart,xEnd,yStart,yEnd,zStart,zEnd,qGuess)
    

    % Loading robot model
    tech12 = TM12();       
    
    % Setting RMRC parameters
    t = 10;             % Total time (s)
    deltaT = 0.1;      % Control frequency
    steps = t/deltaT;   % No. of steps for simulation
    delta = 2*pi/steps; % Small angle change
    epsilon = 0.1;      % Threshold value for manipulability/Damped Least Squares
    W = diag([1 1 1 0.1 0.1 0.1]);    % Weighting matrix for the velocity vector
    % W = diag([1 1 1 1 1 1]);
    
    % Allocate array data
    m = zeros(steps,1);             % Array for Measure of Manipulability
    TM12RMRCTrajectory = zeros(steps,6);       % Array for joint anglesR
    qdot = zeros(steps,6);          % Array for joint velocities
    theta = zeros(3,steps);         % Array for roll-pitch-yaw angles
    x = zeros(3,steps);             % Array for x-y-z trajectory
    positionError = zeros(3,steps); % For plotting trajectory error
    angleError = zeros(3,steps);    % For plotting trajectory error
    
    % Arc Trajectory set up
    s = lspb(0,1,steps);                % Trapezoidal trajectory scalar
    for i=1:steps
        x(1,i) = (1-s(i))*xStart + s(i)*xEnd; % Points in x
        x(2,i) = (1-s(i))*-yStart + s(i)*yEnd; % Points in y
        x(3,i) =  (zStart+ 0.2) - zEnd * s(i)^2; % Points in z %always starting 0.2 less than first value given
        theta(1,i) = 0;                 % Roll angle 
        theta(2,i) = 0;   %5*pi/9;            % Pitch angle
        theta(3,i) = 0;                 % Yaw angle
    end
    
    % Initial transform and joint guess input
    T = transl(xStart,yStart,zStart);          % Create transformation of first point and angle
    q0 = qGuess;                                                            % Initial guess for joint angles
    TM12RMRCTrajectory(1,:) = tech12.model.ikcon(T,q0);                                            % Solve joint angles to achieve first waypoint
    
    % RMRC Trajectory generation
    for i = 1:steps-1
        T = tech12.model.fkine(TM12RMRCTrajectory(i,:)).T;                                           % Get forward transformation at current joint state
        deltaX = x(:,i+1) - T(1:3,4);                                         	% Get position error from next waypoint
        Rd = rpy2r(theta(1,i+1),theta(2,i+1),theta(3,i+1));                     % Get next RPY angles, convert to rotation matrix
        Ra = T(1:3,1:3);                                                        % Current end-effector rotation matrix
        Rdot = (1/deltaT)*(Rd - Ra);                                                % Calculate rotation matrix error
        S = Rdot*Ra';                                                           % Skew symmetric!
        linear_velocity = (1/deltaT)*deltaX;
        angular_velocity = [S(3,2);S(1,3);S(2,1)];                              % Check the structure of Skew Symmetric matrix!!
        deltaTheta = tr2rpy(Rd*Ra');                                            % Convert rotation matrix to RPY angles
        xdot = W*[linear_velocity;angular_velocity];                          	% Calculate end-effector velocity to reach next waypoint.
        J = tech12.model.jacob0(TM12RMRCTrajectory(i,:));                 % Get Jacobian at current joint state
        m(i) = sqrt(det(J*J'));
        if m(i) < epsilon  % If manipulability is less than given threshold
            lambda = (1 - m(i)/epsilon)*5E-2;
        else
            lambda = 0;
        end
        invJ = inv(J'*J + lambda *eye(6))*J';                                   % DLS Inverse
        qdot(i,:) = (invJ*xdot)';                                                % Solve the RMRC equation (you may need to transpose the         vector)
        for j = 1:6                                                             % Loop through joints 1 to 6
            if TM12RMRCTrajectory(i,j) + deltaT*qdot(i,j) < tech12.model.qlim(j,1)                     % If next joint angle is lower than joint limit...
                qdot(i,j) = 0; % Stop the motor
            elseif TM12RMRCTrajectory(i,j) + deltaT*qdot(i,j) > tech12.model.qlim(j,2)                 % If next joint angle is greater than joint limit ...
                qdot(i,j) = 0; % Stop the motor
            end
        end
        TM12RMRCTrajectory(i+1,:) = TM12RMRCTrajectory(i,:) + deltaT*qdot(i,:);                       % Update next joint state based on joint velocities
        positionError(:,i) = x(:,i+1) - T(1:3,4);                               % For plotting
        angleError(:,i) = deltaTheta;                                           % For plotting
    end
    
    % Orienting gripper downwards
    for i = 1:100
        TM12RMRCTrajectory(i,5) = TM12RMRCTrajectory(i,5)+pi;
    end
    
end
