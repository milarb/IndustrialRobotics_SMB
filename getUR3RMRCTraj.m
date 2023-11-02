function UR3RMRCTrajectory = getUR3RMRCTraj(xStart,xEnd,yStart,yEnd,zStart,zEnd,qGuess)

    % Setting RMRC Parameters
    ur3 = UR3();        % Load robot model
    t = 10;             % Total time (s)
    deltaT = 0.1;      % Control frequency
    steps = t/deltaT;   % No. of steps for simulation
    delta = 2*pi/steps; % Small angle change
    epsilon = 0.1;      % Threshold value for manipulability/Damped Least Squares
    W = diag([1 1 1 0.1 0.1 0.1]);    % Weighting matrix for the velocity vector
  
    
   % Allocating array data
    m = zeros(steps,1);             % Array for Measure of Manipulability
    UR3RMRCTrajectory = zeros(steps,6);       % Array for joint anglesR
    qdot = zeros(steps,6);          % Array for joint velocities
    theta = zeros(3,steps);         % Array for roll-pitch-yaw angles
    x = zeros(3,steps);             % Array for x-y-z trajectory
    positionError = zeros(3,steps); % For plotting trajectory error
    angleError = zeros(3,steps);    % For plotting trajectory error
    
    % Trajectory set up
    s = lspb(0,1,steps);                % Trapezoidal trajectory scalar
    for i=1:steps
        x(1,i) = (1-s(i))*xStart + s(i)*xEnd;; % Points in x
        x(2,i) = (1-s(i))*yStart + s(i)*yEnd; % Points in y
        x(3,i) = (1-s(i))*zStart + s(i)*zEnd; % Points in z   
    end
    
    % Initial pose set up
    T = transl(zStart,yStart,zStart);          % Create transformation of first point and angle
    q0 = qGuess;                                                            % Initial guess for joint angles
    UR3RMRCTrajectory(1,:) = ur3.model.ikcon(T,q0);                                            % Solve joint angles to achieve first waypoint
    
    % RMRC trajectory generation
    for i = 1:steps-1
        T = ur3.model.fkine(UR3RMRCTrajectory(i,:)).T;                                           % Get forward transformation at current joint state
        deltaX = x(:,i+1) - T(1:3,4);                                         	% Get position error from next waypoint
        linear_velocity = (1/deltaT)*deltaX;
        xdot = W*[linear_velocity;0;0;0];                          	% Calculate end-effector velocity to reach next waypoint.
        J = ur3.model.jacob0(UR3RMRCTrajectory(i,:));                 % Get Jacobian at current joint state
        
        % Singularity avoidance
        m(i) = sqrt(det(J*J'));
        if m(i) < epsilon  % If manipulability is less than given threshold
            lambda = (1 - m(i)/epsilon)*5E-2;
        else
            lambda = 0;
        end
        invJ = inv(J'*J + lambda *eye(6))*J';                                   % DLS Inverse
        qdot(i,:) = (invJ*xdot)';                                                % Solve the RMRC equation (you may need to transpose the         vector)
        for j = 1:6                                                             % Loop through joints 1 to 6
            if UR3RMRCTrajectory(i,j) + deltaT*qdot(i,j) < ur3.model.qlim(j,1)                     % If next joint angle is lower than joint limit...
                qdot(i,j) = 0; % Stop the motor
            elseif UR3RMRCTrajectory(i,j) + deltaT*qdot(i,j) > ur3.model.qlim(j,2)                 % If next joint angle is greater than joint limit ...
                qdot(i,j) = 0; % Stop the motor
            end
        end
        UR3RMRCTrajectory(i+1,:) = UR3RMRCTrajectory(i,:) + deltaT*qdot(i,:);                       % Update next joint state based on joint velocities
     
        
    end
    
    % Orienting end effector downwards
    for i = 1:100
        UR3RMRCTrajectory(i,5) = UR3RMRCTrajectory(i,5) + pi;
    end
    
end
