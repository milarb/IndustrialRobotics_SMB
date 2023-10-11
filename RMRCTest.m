clear all
close all
clc


mdl_planar2;                                  


%%%Starting and ending positions
T1 = [eye(3) [1.5 1 0]'; zeros(1,3) 1];       
T2 = [eye(3) [1.5 -1 0]'; zeros(1,3) 1];      


hold on
axis equal



%%%%Mask matrix
M = [1 1 zeros(1,4)];                      


%%%Steps taken
steps = 50;

%%%Starting and ending
x1 = [1.5 1]';
x2 = [1.5 -1]';

%%%Timestep
deltaT = 0.05;                                       

%%%%Creating scalars
x = zeros(2,steps);
s = lspb(0,1,steps);

%%%%Creating tajectory
for i = 1:steps
    x(:,i) = x1*(1-s(i)) + s(i)*x2;                  
end

% 3.8
qMatrix = nan(steps,2);

%%%%Starting position joint angles
qMatrix(1,:) = p2.ikine(T1, 'q0', [0 0], 'mask', M);                 

%%%RMRC qmatrix population
for i = 1:steps-1
    xdot = (x(:,i+1) - x(:,i))/deltaT;                             
    J = p2.jacob0(qMatrix(i,:));            
    J = J(1:2,:);                           
    qdot = inv(J)*xdot;                             
    qMatrix(i+1,:) =  qMatrix(i,:) + deltaT*qdot';                   
end

%%%Plotting qmatrix
p2.plot(qMatrix,'trail','r-');