clear all
close all
clc


tm = TM12;                                  


x1 = [1.5,1,0];
x2 = [1.5,1,1];




qtraj = getTMRMRCTrajectory(x1,x2);

axis([-4 4 -4 4 -4 4]);
view(3);
hold on;
tm.model.plot(qtraj,'trail','r-');

