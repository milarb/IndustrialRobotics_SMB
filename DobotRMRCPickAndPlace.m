clear all
close all
clc


dobot = DobotMagician();                                  


dobot.model.teach()

hold on;

%%%Object pickup height
height = 0.4;

%%%%Object starting positions
startPositions = [[0.2,0.2,0];
                [0.2,0.25,0];
                [0.2,0.3,0]; 
                [0.15,0.2,0];
                [0.15,0.25,0];
                [0.15,0.3,0];
                [0.25,0.2,0];
                [0.25,0.25,0];
                [0.25,0.3,0]]; 

%%%%%%%%%Converting to transform

startTform = zeros(4,4,9);

for i = 1:9
    startTform(:,:,i) = transl(startPositions(i,:));
end

T1 = transl(0.2,0.2,0);
T2 = transl(0.2,0.25,0);
T3 = transl(0.2,0.3,0);
T4 = transl(0.15,0.2,0);
T5 = transl(0.15,0.25,0);
T6 = transl(0.15,0.3,0);
T7 = transl(0.25,0.2,0);
T8 = transl(0.25,0.25,0);
T9 = transl(0.25,0.3,0);


%%%%%%%%Object second position/transform

secondPositions = zeros(9,3);

for i = 1:9
    secondPositions(i,:)=startPositions(i,:);
    secondPositions(i,3) = secondPositions(i,3) + height;
end

secondTform = zeros(4,4,9);

for i = 1:9
   secondTform(:,:,i) = startTform(:,:,i);
   secondTform(3,4,i) = startTform(3,4,i) + height;
end
S1 = transl(0.2,0.2,0.4);
S2 = transl(0.2,0.25,0.4);
S3 = transl(0.2,0.3,0.4);
S4 = transl(0.15,0.2,0.4);
S5 = transl(0.15,0.25,0.4);
S6 = transl(0.15,0.3,0.4);
S7 = transl(0.25,0.2,0.4);
S8 = transl(0.25,0.25,0.4);
S9 = transl(0.25,0.3,0.4);


%%%%%%Starting qvalues
startQ = zeros(1,4,9);
for i = 1:9
    startQ(:,:,i)= dobot.model.ikcon(startTform(:,:,i));
end

%%%%%%Second q values

secondQ = zeros(1,4,9);
for i = 1:9
    secondQ(:,:,i)= dobot.model.ikcon(secondTform(:,:,i));
end

T1 = transl(0.2,0.2,0.1);
T2 = transl(0.2,0.2,0.3);

x1 = dobot.model.ikcon(T1);
x2 = dobot.model.ikcon(T2);

x1 = [0.2,0.2,0.1,0];
x2 = [0.2,0.2,0.3,0];

x1 = x1';
x2 = x2';

%%Steps in trajectory
steps = 50;


%%Timestep
deltaT = 0.05;

%%%%%%%Code above here is good

%%%Creating scalars
x = zeros(4,steps);
s = lspb(0,1,steps);


%%%%%Creating trajectory 
for i = 1:steps
        x(:,i) = x1*(1-s(i)) + s(i)*x2;                  
end

qMatrix = nan(steps,4);

%%%%Starting position joint angles
 qMatrix(1,:) = dobot.model.ikcon(T1);                 


%%%RMRC qmatrix population
for i = 1:steps-1
    xdot = (x(:,i+1) - x(:,i))/deltaT;                             
    J = dobot.model.jacob0(qMatrix(i,:));            
    J = J(1:4,:)                           
    qdot = inv(J)*xdot;                             
    qMatrix(i+1,:) =  qMatrix(i,:) + deltaT*qdot';                   
end

%%Plotting qmatrix
dobot.model.plot(qMatrix,'trail','r-');