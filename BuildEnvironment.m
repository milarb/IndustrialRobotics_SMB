classdef BuildEnvironment < handle
    %This class handles the generation of the evrionment that the
    %simulation will take place in and the spanwing of the fence, bricks
    %and other models needed
    properties

    end
    
    methods
        function self = BuildEnvironment()
            EStop1 = PlaceObject('emergencyStopWallMounted.ply');
             EStop2 = PlaceObject('emergencyStopWallMounted.ply',[-2.05,2.05,1]);
             FireEx = PlaceObject('fireExtinguisher.ply',[1,1.8,0]);
             FireEx2 = PlaceObject('fireExtinguisher.ply',[-4,2.2,0]);
             surf([-1.5,-1.5;-2,-2] ,[-0.4,-0.4;-0.4,-0.4],  [1.55,1.2;1.55,1.2],'CData',imread('DangerSign.jpg') ,'FaceColor','texturemap');
             surf([1,1;-4,-4] ,[2.5,2.5;2.5,2.5], [2,0;2,0] ,'CData',imread('Background.jpg') ,'FaceColor','texturemap');
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
        end

    end
end