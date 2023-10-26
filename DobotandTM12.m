clear all
close all
clc



dobot = DobotMagician();                                  
hold on;

tm = TM12;

tm.model.base = transl(-1,-0.5,0);


% hold on
% tm.model.plot([0,0,0,0,0,0]);
% dobot.model.plot([0,0,0,0]);


%%%Object vertical pickup movement height
height = 0.25;

%%%Object horizontal movement length
horiz = -0.3;

%%%Steps per trajectory
steps = 50;

%%%Object starting positions
startPositions = [[0.2,0.2,0];
                [0.2,0.25,0];
                [0.2,0.3,0]; 
                [0.15,0.2,0];
                [0.15,0.25,0];
                [0.15,0.3,0];
                [0.25,0.2,0];
                [0.25,0.25,0];
                [0.25,0.3,0]];

%%%Object intermediate positions

intPositions = zeros(9,3);

for i=1:9
    intPositions(i,:) = startPositions(i,:);
    intPositions(i,3) = intPositions(i,3) + height;
end


%%%Passing point from Dobot to TM12

passPositions = zeros(9,3);

for i=1:9
    passPositions(i,:) = intPositions(i,:);
    passPositions(i,2) = passPositions(i,2) + horiz;
end


%%%First Object Movement
movement1 = getRMRCTrajectory(startPositions(1,:),intPositions(1,:));
movement2 = getRMRCTrajectory(intPositions(1,:),passPositions(1,:));
movement3 = getRMRCTrajectory(passPositions(1,:),startPositions(2,:));

%%%Second Object Movement
movement4 = getRMRCTrajectory(startPositions(2,:),intPositions(2,:));
movement5 = getRMRCTrajectory(intPositions(2,:),passPositions(2,:));
movement6 = getRMRCTrajectory(passPositions(2,:),startPositions(3,:));

%%%Third Object Movement
movement7 = getRMRCTrajectory(startPositions(3,:),intPositions(3,:));
movement8 = getRMRCTrajectory(intPositions(3,:),passPositions(3,:));
movement9 = getRMRCTrajectory(passPositions(3,:),startPositions(4,:));

%%%Fourth Object Movement
movement10 = getRMRCTrajectory(startPositions(4,:),intPositions(4,:));
movement11 = getRMRCTrajectory(intPositions(4,:),passPositions(4,:));
movement12 = getRMRCTrajectory(passPositions(4,:),startPositions(5,:));

%%%Fifth Object Movement
movement13 = getRMRCTrajectory(startPositions(5,:),intPositions(5,:));
movement14 = getRMRCTrajectory(intPositions(5,:),passPositions(5,:));
movement15 = getRMRCTrajectory(passPositions(5,:),startPositions(6,:));

%%%Sixth Object Movement
movement16 = getRMRCTrajectory(startPositions(6,:),intPositions(6,:));
movement17 = getRMRCTrajectory(intPositions(6,:),passPositions(6,:));
movement18 = getRMRCTrajectory(passPositions(6,:),startPositions(7,:));

%%%Seventh Object Movement
movement19 = getRMRCTrajectory(startPositions(7,:),intPositions(7,:));
movement20 = getRMRCTrajectory(intPositions(7,:),passPositions(7,:));
movement21 = getRMRCTrajectory(passPositions(7,:),startPositions(8,:));

%%%Eighth Object Movement
movement22 = getRMRCTrajectory(startPositions(8,:),intPositions(8,:));
movement23 = getRMRCTrajectory(intPositions(8,:),passPositions(8,:));
movement24 = getRMRCTrajectory(passPositions(8,:),startPositions(9,:));

%%%Ninth Object Movement
movement25 = getRMRCTrajectory(startPositions(9,:),intPositions(9,:));
movement26 = getRMRCTrajectory(intPositions(9,:),passPositions(9,:));
%%%BELOW LINE NEEDS TO BE REPLACED
% movement27 = getRMRCTrajectory(passPositions(5,:),startPositions(6,:)); % Need to home the robot here

%%%%Creating trajectories for the TM12

%%%First pick up q
tmPick1 = tm.model.ikcon(transl(passPositions(1,:)));
tmPlace1 = tm.model.ikcon(transl(0.2,-0.3, -0.3));
tmTraj1 = jtraj(tmPick1,tmPlace1,steps);

tmPick2 = tm.model.ikcon(transl(passPositions(2,:)));
tmPlace2 = tm.model.ikcon(transl(0.2,-0.35, -0.3));
tmTraj2 = jtraj(tmPick2,tmPlace2,steps);

tmPick3 = tm.model.ikcon(transl(passPositions(3,:)));
tmPlace3 = tm.model.ikcon(transl(0.2,-0.4, -0.3));
tmTraj3 = jtraj(tmPick3,tmPlace3,steps);

tmPick4 = tm.model.ikcon(transl(passPositions(4,:)));
tmPlace4 = tm.model.ikcon(transl(0.25,-0.3, -0.3));
tmTraj4 = jtraj(tmPick4,tmPlace4,steps);

tmPick5 = tm.model.ikcon(transl(passPositions(5,:)));
tmPlace5 = tm.model.ikcon(transl(0.25,-0.35, -0.3));
tmTraj5 = jtraj(tmPick5,tmPlace5,steps);

tmPick6 = tm.model.ikcon(transl(passPositions(6,:)));
tmPlace6 = tm.model.ikcon(transl(0.25,-0.4, -0.3));
tmTraj6 = jtraj(tmPick6,tmPlace6,steps);

tmPick7 = tm.model.ikcon(transl(passPositions(7,:)));
tmPlace7 = tm.model.ikcon(transl(0.3,-0.3, -0.3));
tmTraj7 = jtraj(tmPick7,tmPlace7,steps);

tmPick8 = tm.model.ikcon(transl(passPositions(8,:)));
tmPlace8 = tm.model.ikcon(transl(0.3,-0.35, -0.3));
tmTraj8 = jtraj(tmPick8,tmPlace8,steps);

tmPick9 = tm.model.ikcon(transl(passPositions(9,:)));
tmPlace9 = tm.model.ikcon(transl(0.3,-0.4, -0.3));
tmTraj9 = jtraj(tmPick9,tmPlace9,steps);



%%%Plotting of robot movements
%%%Needs to be updated and done more efficiently

% tm.model.plot(tmTraj1,'trail','r*');
axis([-1,1,-1,1,-1,1])
% tm.model.animate(tmTraj1);

%Move brick 1 from start to end position then from brick 1 end position to
%brick 2 start position
% for i = 1:steps
% 
%          dobot.model.plot(movement1(i,:),'trail','r-');
%          tm.model.plot(tmTraj1(i,:),'trail','b*');
%          % gripperRight.base = robot.model.fkine(qMatrixb1e1(i,:));
%          % gripperLeft.base = robot.model.fkine(qMatrixb1e1(i,:));
%          % gripperRight.animate(qRight);
%          % gripperLeft.animate(qLeft);
%          % BP1 = robot.model.fkine(robot.model.getpos()).T;
%          % updatedPoints1 = (BP1 * [brickVerts,ones(brickVertexCount,1)]')';
%          % brickMesh1_h.Vertices = updatedPoints1(:,1:3);
%          drawnow()
% 
% end

%%%Movement Sequences
dobot.model.plot(movement1,'trail','r-');
dobot.model.plot(movement2,'trail','r-');
tm.model.plot(tmTraj1,'trail','b*');

dobot.model.plot(movement4,'trail','r-');
dobot.model.plot(movement5,'trail','r-');
tm.model.plot(tmTraj2,'trail','b*');

dobot.model.plot(movement7,'trail','r-');
dobot.model.plot(movement8,'trail','r-');
tm.model.plot(tmTraj3,'trail','b*');

dobot.model.plot(movement10,'trail','r-');
dobot.model.plot(movement11,'trail','r-');
tm.model.plot(tmTraj4,'trail','b*');

dobot.model.plot(movement13,'trail','r-');
dobot.model.plot(movement14,'trail','r-');
tm.model.plot(tmTraj5,'trail','b*');

dobot.model.plot(movement16,'trail','r-');
dobot.model.plot(movement17,'trail','r-');
tm.model.plot(tmTraj6,'trail','b*');

dobot.model.plot(movement19,'trail','r-');
dobot.model.plot(movement20,'trail','r-');
tm.model.plot(tmTraj7,'trail','b*');

dobot.model.plot(movement22,'trail','r-');
dobot.model.plot(movement23,'trail','r-');
tm.model.plot(tmTraj8,'trail','b*');

dobot.model.plot(movement25,'trail','r-');
dobot.model.plot(movement26,'trail','r-');
tm.model.plot(tmTraj9,'trail','b*');
%%

% dobot.model.plot(movement1,'trail','r-');
% hold on;
% dobot.model.plot(movement2,'trail','r-');
% dobot.model.plot(movement3,'trail','r-');
% dobot.model.plot(movement4,'trail','r-');
% dobot.model.plot(movement5,'trail','r-');
% dobot.model.plot(movement6,'trail','r-');
% dobot.model.plot(movement7,'trail','r-');
% dobot.model.plot(movement8,'trail','r-');
% dobot.model.plot(movement9,'trail','r-');
% dobot.model.plot(movement10,'trail','r-');
% dobot.model.plot(movement11,'trail','r-');
% dobot.model.plot(movement12,'trail','r-');
% dobot.model.plot(movement13,'trail','r-');
% dobot.model.plot(movement14,'trail','r-');
% dobot.model.plot(movement15,'trail','r-');
% dobot.model.plot(movement16,'trail','r-');
% dobot.model.plot(movement17,'trail','r-');
% dobot.model.plot(movement18,'trail','r-');
% dobot.model.plot(movement19,'trail','r-');
% dobot.model.plot(movement20,'trail','r-');
% dobot.model.plot(movement21,'trail','r-');
% dobot.model.plot(movement22,'trail','r-');
% dobot.model.plot(movement23,'trail','r-');
% dobot.model.plot(movement24,'trail','r-');
% dobot.model.plot(movement25,'trail','r-');
% dobot.model.plot(movement26,'trail','r-');
% % dobot.model.plot(movement27,'trail','r-');
% 
