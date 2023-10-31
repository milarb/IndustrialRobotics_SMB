clear all
close all
clc


dobot = DobotMagician();                                  


% dobot.model.teach()


% q1  -0.3770    1.0036    1.2566    0.6283         0
% T1
%  -0.9002   -0.3681   -0.2328     0.277
%     0.3564   -0.9298    0.0922   -0.1097
%    -0.2504         0    0.9681   0.08485
%          0         0         0         1

T1 = dobot.model.fkine([-0.3770    1.0036    1.2566    0.6283         0]).T;

%q2 0.2827    1.0036    1.2566    0.6283         0
% T2
 % -0.9297    0.2790   -0.2404    0.2861
 %   -0.2701   -0.9603   -0.0699   0.08311
 %   -0.2504         0    0.9681   0.08485
 %         0         0         0         1

T2 = dobot.model.fkine([0.2827    1.0036    1.2566    0.6283         0]).T; 


hold on
axis equal



% %%%%Mask matrix
% M = [1 1 zeros(1,4)];                      
% 
% 
%%%Steps taken
steps = 50;
% 
%%%Starting and ending
x1 = [0.277 -0.1097 0.08485 0 0]';
x2 = [0.2861 0.08311 0.08485 0 0]';
% 
%%%Timestep
deltaT = 0.05;                                       
% 
%%%%Creating scalars
x = zeros(5,steps);
s = lspb(0,1,steps);
% 
%%%%Creating tajectory
for i = 1:steps
    x(:,i) = x1*(1-s(i)) + s(i)*x2;                  
end

% 3.8
qMatrix = nan(steps,5);
% 
% %%%%Starting position joint angles
 qMatrix(1,:) = dobot.model.ikcon(T1);                 
% 
%%%RMRC qmatrix population

for i = 1:steps-1
    xdot = (x(:,i+1) - x(:,i))/deltaT;                             
    J = dobot.model.jacob0(qMatrix(i,:));            
    J = J(1:5,:);                           
    qdot = inv(J)*xdot;                             
    qMatrix(i+1,:) =  qMatrix(i,:) + deltaT*qdot';                   
end


%%%Plotting qmatrix
dobot.model.plot(qMatrix,'trail','r-');