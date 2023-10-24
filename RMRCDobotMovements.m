clear all
close all
clc


dobot = DobotMagician();                                  


%%%Object vertical pickup movement height
height = 0.25;

%%%Object horizontal movement length
horiz = -0.3;

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




%%%Plotting of robot movements
%%%Needs to be updated and done more efficiently



dobot.model.plot(movement1,'trail','r-');
hold on;
dobot.model.plot(movement2,'trail','r-');
dobot.model.plot(movement3,'trail','r-');
dobot.model.plot(movement4,'trail','r-');
dobot.model.plot(movement5,'trail','r-');
dobot.model.plot(movement6,'trail','r-');
dobot.model.plot(movement7,'trail','r-');
dobot.model.plot(movement8,'trail','r-');
dobot.model.plot(movement9,'trail','r-');
dobot.model.plot(movement10,'trail','r-');
dobot.model.plot(movement11,'trail','r-');
dobot.model.plot(movement12,'trail','r-');
dobot.model.plot(movement13,'trail','r-');
dobot.model.plot(movement14,'trail','r-');
dobot.model.plot(movement15,'trail','r-');
dobot.model.plot(movement16,'trail','r-');
dobot.model.plot(movement17,'trail','r-');
dobot.model.plot(movement18,'trail','r-');
dobot.model.plot(movement19,'trail','r-');
dobot.model.plot(movement20,'trail','r-');
dobot.model.plot(movement21,'trail','r-');
dobot.model.plot(movement22,'trail','r-');
dobot.model.plot(movement23,'trail','r-');
dobot.model.plot(movement24,'trail','r-');
dobot.model.plot(movement25,'trail','r-');
dobot.model.plot(movement26,'trail','r-');
% dobot.model.plot(movement27,'trail','r-');

