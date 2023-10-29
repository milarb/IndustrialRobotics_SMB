classdef BuildEnvironment < handle
    %This class handles the generation of the evrionment that the
    %simulation will take place in and the spanwing of the fence, bricks
    %and other models needed
    properties

    end
    
    methods
        function self = BuildEnvironment()
             EStop = PlaceObject('emergencyStopWallMounted.ply',[-1.5,-0.3,0.7]);
             FireEx = PlaceObject('fireExtinguisher.ply',[-2.5,0,0]);
             Basket = PlaceObject('Basket.ply',[-0.45,0,0.65]);
             surf([-1.5,-1.5;-2,-2] ,[-0.4,-0.4;-0.4,-0.4],  [1.55,1.2;1.55,1.2],'CData',imread('DangerSign.jpg') ,'FaceColor','texturemap');
             surf([-4.5,1;-4.5,1] ,[4,4;4,4], [2.5,2.5;0,0] ,'CData',imread('Background.jpg') ,'FaceColor','texturemap');
             surf([1,1;1,1] ,[4,-1.5;4,-1.5], [2.5,2.5;0,0] ,'CData',imread('Background.jpg') ,'FaceColor','texturemap');
             Table = PlaceObject('T22.ply',[-1.4,0,0]);
             Table2 = PlaceObject('T22.ply',[-1.4,2.5,0]);
             surf([-4.5,-4.5;1,1] ,[-1.5,4;-1.5,4], [0.01,0.01;0.01,0.01] ,'CData',imread('Wood.jpg') ,'FaceColor','texturemap');
             axis equal
        end

    end
    %%
    methods (Static)

        function [DoBot TM12] = SpawnRobots
            DoBot = DobotMagician(transl(-1.5,0.3, 0.7));
            TM12 = UR3(transl(-0.8,0.2, 0.7));
        end

    end
end