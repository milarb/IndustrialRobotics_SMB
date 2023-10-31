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
             Cart = PlaceObject('Cart2.ply',[0.2,0.8,0.0]);

             P1 = PlaceObject('Person.ply',[-6.7,2.3,0]);

             surf([-1.5,-1.5;-2,-2] ,[-0.4,-0.4;-0.4,-0.4],  [1.55,1.2;1.55,1.2],'CData',imread('DangerSign.jpg') ,'FaceColor','texturemap');
             surf([-2.85,1.8;-2.85,1.8] ,[5,5;5,5], [2.5,2.5;0,0] ,'CData',imread('Wall0.jpg') ,'FaceColor','texturemap');
              surf([-7.5,-2.85;;-7.5,-2.85] ,[5,5;5,5], [2.5,2.5;0,0] ,'CData',imread('Wall0.jpg') ,'FaceColor','texturemap');
             surf([1.8,1.8;1.8,1.8] ,[5,-1;5,-1], [2.5,2.5;0,0] ,'CData',imread('Wall0.jpg') ,'FaceColor','texturemap');
             Table0 = PlaceObject('T33.ply',[-1.4,0,0]);
             Table2 = PlaceObject('T22.ply',[-1.4,4.1,0]);

             surf([-7.5,-7.5;-7.5,-7.5] ,[5,-1;5,-1], [2.5,2.5;0,0] ,'CData',imread('Background.jpg') ,'FaceColor','texturemap');

             surf([-7.5,-6;-7.5,-6] ,[3,3;3,3], [2.5,2.5;0,0] ,'CData',imread('Background.jpg') ,'FaceColor','texturemap');
             surf([-7.5,-6;-7.5,-6] ,[-0.8,-0.8;-0.8,-0.8], [2.5,2.5;0,0] ,'CData',imread('Background.jpg') ,'FaceColor','texturemap');

             surf([-7.5,-7.5;1.8,1.8] ,[-1,5;-1,5], [0.01,0.01;0.01,0.01] ,'CData',imread('Wood.jpg') ,'FaceColor','texturemap');
             axis equal
        end

    end
    %%
    methods (Static)

        function [DoBot TM12Bot,ExtraDo] = SpawnRobots
            DoBot = UR3(transl(-1.5,0.3, 0.7));
            TM12Bot = TM12(transl(-0.8,0.9, 0.5));
            ExtraDo = UR3(transl(-1.5,1.3, 0.7));
        end

    end
end