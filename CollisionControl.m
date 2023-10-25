classdef CollisionControl
    %COLLISIONCONTROL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Dobot
        TM12
        gui
        SafeZoneSize = [0.2,0.2,0.2];
    end
    
    methods
        function self = CollisionControl(DoBot,TM12,gui)
            self.Dobot = DoBot;
            self.TM12 = TM12;
            self.gui = gui;
            % c1 = CollisionControl.CreateRobotColider(self.Dobot)
            % c2 = CollisionControl.CreateRobotColider(self.TM12)
            [TableMesh,TableMeshPoints] = CollisionControl.CreateMeshPlain(-1.5,0,1.5,0.3,true);
            [TableMesh2,TableMeshPoints] = CollisionControl.CreateMeshPlain(-1.5,0,1.5,0.3,false);
            pos = self.TM12.model.fkine( self.TM12.model.getpos).t;
            [ellip,elippoints] = CollisionControl.CreateEllipsoid(pos(1),pos(2),pos(3),self.SafeZoneSize);
        end
        
    end

    methods (Static)

        function Test1
            [a,b] = CollisionControl.CreateMeshPlain(-1.5,0,1.5,0.3,true); 
        end



        function RobotColider = CreateRobotColider(robot)
centerPoint = [0,0,0];
radii = [0.2,0.1,0.1];
[X,Y,Z] = ellipsoid( centerPoint(1), centerPoint(2), centerPoint(3), radii(1), radii(2), radii(3) );
for i = 1:robot.model.n + 1
    robot.model.points{i} = [X(:),Y(:),Z(:)];
    warning off
    robot.model.faces{i} = delaunay(robot.model.points{i});    
    warning on;
end
robot.model.plot3d(zeros(robot.model.n));
axis equal
camlight
 robot.model.teach(zeros(robot.model.n))
 RobotColider = robot;
end

%Function to create a ellipsoid. Takes in ellipsoid size and an option to take in a
%ellipsoid to delete and creates a new ellipsoid sending back ellipsoid mesh and ellipsoid
%points
function [Ellipsoid,centerPoint] = CreateEllipsoid(x,y,z,radii,delElips)
try delete(delElips); end;
centerPoint = [x,y,z];
[X,Y,Z] = ellipsoid( centerPoint(1), centerPoint(2), centerPoint(3), radii(1), radii(2), radii(3) );
view(3);
hold on;
Ellipsoid = surf(X,Y,Z);
alpha(0.1);
end

function [CubeMesh,CubePoints] = CreateMeshPlain(CenterX,CenterY,LengthX,LengthY,isFlat)
[Y,Z] = meshgrid((CenterY - LengthY):0.1:(CenterY + LengthY),(CenterX - LengthX):0.1:(CenterX + LengthX));
sizeMat = size(Y);
X = repmat(LengthX,sizeMat(1),sizeMat(2));

if isFlat == true
    CubeMesh = surf(Z,Y,X);
    cubePoints = [Z(:),Y(:),X(:)];
else
    CubeMesh = surf(X,Y,Z);
    cubePoints = [X(:),Y(:),Z(:)];
end

cube_h = plot3(cubePoints(:,1),cubePoints(:,2),cubePoints(:,3),'b.');
CubePoints = cubePoints;
end

%Checks for collsion between points of a cube and center of an ellipsoid
%and the ellipsoid radii to return if there is a collision or not
function CheckForCollision = CheckForCollision(points, centerPoint, radii)
algebraicDist = ((points(:,1)-centerPoint(1))/radii(1)).^2 + ((points(:,2)-centerPoint(2))/radii(2)).^2 + ((points(:,3)-centerPoint(3))/radii(3)).^2;
pointsInside = find(algebraicDist < 1);
if pointsInside > 0
CheckForCollision = true;
disp("Collision")
else
CheckForCollision = false;
disp("No Collision")
end
end
    end
end


