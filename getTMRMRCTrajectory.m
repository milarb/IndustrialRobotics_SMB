function RMRCTrajectory = getTMRMRCTrajectory(x1,x2)

    %%%Converting x1 and x2 coordinates into 1-by-6
    r1 = [x1,0,0,0];
    r2 = [x2,0,0,0];
    %%%Creating dobot here because ikcon is used
    tm = TM12; 
    
    %%%Starting joint angles before transpose occurs
    T1 = transl(r1(:,1:3));
    
    %%%Transposing cartesian coordinates
    r1 = r1';
    r2 = r2';
    
    
    %%Steps in trajectory
    steps = 50;
    
    
    %%Timestep
    deltaT = 0.05;
    
    %%%Creating scalars
    x = zeros(6,steps);
    s = lspb(0,1,steps);
    
    %%%%%Creating trajectory 
    for i = 1:steps
            x(:,i) = r1*(1-s(i)) + s(i)*r2;                  
    end
    
    %%%Creating joint matrix
    RMRCTrajectory = nan(steps,6);
    
    %%%%Starting position joint angles
    
    RMRCTrajectory(1,:) = tm.model.ikcon(T1);
    
    %%%RMRC qmatrix population
    for i = 1:steps-1
        xdot = (x(:,i+1) - x(:,i))/deltaT;                             
        J = tm.model.jacob0(RMRCTrajectory(i,:));            
        J = J(1:6,:);                           
        qdot = inv(J)*xdot;                             
        RMRCTrajectory(i+1,:) =  RMRCTrajectory(i,:) + deltaT*qdot';                   
    end

end
