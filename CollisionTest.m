radii = [1,1,1];
%ellipsoid
[ellip,elippoints] = CreateEllipsoid(2,0,0,radii)

%cube
[cube,cubepoints] = CreateCube(0.5)

axis equal
[ellip,elippoints] = CreateEllipsoid(1,0,0,radii,ellip);
CheckForCollision(cubepoints, elippoints, radii);
%%
r = UR3();
bot = CreateRobotColider(r);
% New values for the ellipsoid (guessed these, need proper model to work out correctly)

% keyboard

%%
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

function [CubeMesh,CubePoints] = CreateCube(value,delCube)
try delete(delCube); end;
[Y,Z] = meshgrid(-value:0.1:value,-value:0.1:value);
sizeMat = size(Y);
X = repmat(value,sizeMat(1),sizeMat(2));
CubeMesh = surf(X,Y,Z);
cubePoints = [X(:),Y(:),Z(:)];
cubePoints = [ cubePoints; cubePoints * rotz(pi/2); cubePoints * rotz(pi); cubePoints * rotz(3*pi/2); cubePoints * roty(pi/2); cubePoints * roty(-pi/2)];               
cube_h = plot3(cubePoints(:,1),cubePoints(:,2),cubePoints(:,3),'b.');
CubePoints = cubePoints;
end

function [Ellipsoid,centerPoint] = CreateEllipsoid(x,y,z,radii,delElips)
try delete(delElips); end;
centerPoint = [x,y,z];
[X,Y,Z] = ellipsoid( centerPoint(1), centerPoint(2), centerPoint(3), radii(1), radii(2), radii(3) );
view(3);
hold on;
Ellipsoid = surf(X,Y,Z);
alpha(0.1);
end

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