classdef RobotUI
    %ROBOTUI Summary of this class goes here
    %   Detailed explanation goes here

%     The GUI should have
% advanced “teach” functionality that allows jogging the robot. It should include both individual joint
% movements (like the Toolbox’s “teach”) plus enable [x,y,z] Cartesian movements. A valid addition is to use
% a joystick or gamepad to augment and replace mouse GUI button presses
    
    properties
        QSliders = {};
        AssignedRobot;
    end
    
    methods
        function self = RobotUI()
            self.AssignedRobot = UR3();

            fig = uifigure
            UI = uipanel(fig,"Title", "Repalce me with Robot.model.name" +" Controls","BackgroundColor",[31 180 255]/255);

            for i = 1:self.AssignedRobot.model.n
                QSliders{i,1} = uislider(fig,@(src,event)ChangeRobotQJoint(src,event,self.AssignedRobot,QSliders{i}));
                QSliders{i,1}.Limits = [rad2deg(self.AssignedRobot.model.qlim(i,1)),rad2deg(self.AssignedRobot.model.qlim(i,2))];
                QSliders{i,1}.Position(3) = 80;
                QSliders{i,1}.Position(2) = 100 + 75 * i;
                QSliders{i,2} = i;
            end

            pause;


            
            % QSliders
            % Enter XYZ pos
            % XYZ Slider


        end
    end

    methods (Static)

        function ChangeRobotQJoint(src,event,Robot,QSliders)
%Fkine to assinged pos
        end

        function SendEndEffectorToo(X,Y,Z)
           %calculate and animate jtraj to pos

        end

        function CartesianSlider
     %ikine to assinged pos       
        end

        function UpdateRobotTransform

        end

    end
end

