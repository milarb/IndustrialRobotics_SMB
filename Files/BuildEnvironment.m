classdef BuildEnvironment < handle
    %This class handles the generation of the evrionment that the
    %simulation will take place in and the spanwing of the fence, bricks
    %and other models needed

    properties 
       bricks
    end 
    
    methods
        function self = BuildEnvironment()
    
EStop1 = PlaceObject('emergencyStopWallMounted.ply');
EStop2 = PlaceObject('emergencyStopWallMounted.ply',[-2.05,2.05,1]);
FireEx = PlaceObject('fireExtinguisher.ply',[1,1.8,0]);
FireEx2 = PlaceObject('fireExtinguisher.ply',[-4,2.2,0]);
Person = PlaceObject('PersonMaleConstruction.ply',[-3.5,2.5,0]);
surf([-1.5,-1.5;-2,-2] ,[-0.4,-0.4;-0.4,-0.4], [1.55,1.2;1.55,1.2] ,'CData',imread('DangerSign.jpg') ,'FaceColor','texturemap');
Table = PlaceObject('T22.ply',[-1.4,0,0]);
surf([-5.0,-5.0;3.0,3.0] ,[-2,3;-2,3], [0.01,0.01;0.01,0.01] ,'CData',imread('Wood.jpg') ,'FaceColor','texturemap');
axis equal
        end

    end
    %%
    methods (Static)

        function Robots = SpawnRobots()
            Robots{1} = DobotMagician(transl(-1.5,0.3, 0.7));
            Robots{2} = UR3(transl(-0.8,0.2, 0.7));
            Robots{3} = Gripper(SE3(transl(Robots{1}.model.fkine(Robots{1}.model.getpos()).t)));
            Robots{3}.OpenClaw(Robots{3})
        end

    end
end