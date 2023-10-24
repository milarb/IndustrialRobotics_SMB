function RMRCTrajectory = getRMRCTrajectory(x1,x2)

    %%%Creating dobot here because ikcon is used
    dobot = DobotMagician(); 
    
    %%%Starting joint angles before transpose occurs
    T1 = transl(x1(:,1:3));
    
    %%%Transposing cartesian coordinates
    x1 = x1';
    x2 = x2';
    
    
    %%Steps in trajectory
    steps = 10;
    
    
    %%Timestep
    deltaT = 0.05;
    
    %%%Creating scalars
    x = zeros(4,steps);
    s = lspb(0,1,steps);
    
    %%%%%Creating trajectory 
    for i = 1:steps
            x(:,i) = x1*(1-s(i)) + s(i)*x2;                  
    end
    
    %%%Creating joint matrix
    RMRCTrajectory = nan(steps,4);
    
    %%%%Starting position joint angles
    
    RMRCTrajectory(1,:) = dobot.model.ikcon(T1);
    
    %%%RMRC qmatrix population
    for i = 1:steps-1
        xdot = (x(:,i+1) - x(:,i))/deltaT;                             
        J = dobot.model.jacob0(RMRCTrajectory(i,:));            
        J = J(1:4,:);                           
        qdot = inv(J)*xdot;                             
        RMRCTrajectory(i+1,:) =  RMRCTrajectory(i,:) + deltaT*qdot';                   
    end

end
