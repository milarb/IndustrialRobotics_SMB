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
        function obj = RobotUI(gui,BasePos)
            fig = figure
            UIPanel = uipanel(figure.UIFigure,"Title", "Repalce me with Robot.model.name" +" Controls","BackgroundColor",[31 180 255]/255);
            UIPanel.Position = BasePos;

            for i = 1:robot.n
                QSliders{i} = uislider(fig);%ADDdetails
            end


            
            QSliders
            Enter XYZ pos
            XYZ Slider


        end
    end

    methods (Static)

        function ChangeRobotQJoint
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

