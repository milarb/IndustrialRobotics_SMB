% Gripper test

close all
clear;
clc;

%% Load two sided gripper
axis([-0.5 0.5 -0.5 0.5 0 1]);
view(3)
hold on 

q0 = [0, 0.8727, 0];
q = [0 -pi/2 0 0 0 0];

robot = UR3;
robot.model.animate(q);

leftGripper = TwoFGripper;
rightGripper = TwoFGripper;

leftGripper.model.base = leftGripper.model.base.T * robot.model.fkine(robot.model.getpos()).T;
rightGripper.model.base = rightGripper.model.base.T * robot.model.fkine(robot.model.getpos()).T * trotz(pi);

leftGripper.model.animate(q0);
rightGripper.model.animate(q0);

qOpen = [0 0.5236 0.3491];
qMid = [0 0.8727 0];
qTight = [0 1.2217 -0.3491];
qFullyClosed = [0 1.6581 -0.7854];

steps = 50;

grab = jtraj(qOpen, qFullyClosed, steps);
release = jtraj(qFullyClosed, qOpen, steps);

for i = 1:steps
    leftGripper.model.animate(grab(i,:));
    rightGripper.model.animate(grab(i,:));
    pause(0.05)
end

for i = 1:steps
    leftGripper.model.animate(release(i,:));
    rightGripper.model.animate(release(i,:));
    pause(0.05)
end



