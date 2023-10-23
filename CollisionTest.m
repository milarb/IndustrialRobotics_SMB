radii = [1,1,1];
%ellipsoid
[ellip,elippoints] = CreateEllipsoid(2,0,0,radii)

%cube
[cube,cubepoints] = CreateCube(1,0.2)

axis equal
[ellip,elippoints] = CreateEllipsoid(1,0,0,radii,ellip);
CheckForCollision(cubepoints, elippoints, radii);
%%
r = UR3();
bot = CreateRobotColider(r);
%%
hold on
[cube,cubepoints] = CreateCube(-1,0.1,cube)

%% Test

SafeZone = [0.2,0.2,0.2];
EndPos = r.model.fkine(r.model.getpos).t;
%%
CheckForCollision(cubepoints,EndPos,SafeZone);

%%

%Creates ellipsoid colliders for the robot passed in
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

%Function to create a cube. Takes in cube size and an option to take in a
%cube to delete and creates a new cube sending back cube mesh and cube
%points
function [CubeMesh,CubePoints] = CreateCube(center,sizeval,delCube)
try delete(delCube); end;
[Y,Z] = meshgrid((center - sizeval):0.1:(center + sizeval),(center - sizeval):0.1:(center + sizeval));
sizeMat = size(Y);
X = repmat(sizeval,sizeMat(1),sizeMat(2));
CubeMesh = surf(X,Y,Z);
cubePoints = [X(:),Y(:),Z(:)];
cubePoints = [ cubePoints; cubePoints * rotz(pi/2); cubePoints * rotz(pi); cubePoints * rotz(3*pi/2); cubePoints * roty(pi/2); cubePoints * roty(-pi/2)];               
cube_h = plot3(cubePoints(:,1),cubePoints(:,2),cubePoints(:,3),'b.');
CubePoints = cubePoints;
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