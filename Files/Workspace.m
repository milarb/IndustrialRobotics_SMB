classdef Workspace


    methods
        function self = Workspace(robot)
            %Iteration value
            stepRads = deg2rad(15);

            %Get qlim vlaues from robot
            qlim = robot.model.qlim;

            %pre creating the vars for the print clouds
            pointCloudeSize = prod(floor((qlim(1:4,2)-qlim(1:4,1))/stepRads + 1));
            pointCloud = zeros(pointCloudeSize,3);
            counter = 1;
            tic
            %iterate each q value
            for q1 = qlim(1,1):stepRads:qlim(1,2)
                for q2 = qlim(2,1):stepRads:qlim(2,2)
                    for q3 = qlim(3,1):stepRads:qlim(3,2)
                        for q4 = qlim(4,1):stepRads:qlim(4,2)
                            q = [q1,q2,q3,q4,0,0,0];

                            tr = robot.model.fkineUTS(q);
                            pointCloud(counter,:) = tr(1:3,4)';

                            counter = counter + 1;
                            if mod(counter/pointCloudeSize * 100,1) == 0
                                display(['After ',num2str(toc),' seconds, completed ',num2str(counter/pointCloudeSize * 100),'% of poses']);
                            end
                        end
                    end
                end
            end
            %displaying results
            plot3(pointCloud(:,1),pointCloud(:,2),pointCloud(:,3),'r.');
                x = pointCloud(:,1)';
                y = pointCloud(:,2)';
                z = pointCloud(:,3)';
                
            triangulation = delaunayTriangulation(pointCloud(:,1), pointCloud(:,2), pointCloud(:,3));

            % Get the tetrahedra information from the triangulation
            tetrahedra = triangulation.ConnectivityList;

            % Initialize the total volume
            totalVolume = 0;

            % Iterate through each tetrahedron and calculate its volume
            for i = 1:size(tetrahedra, 1)
                vert = tetrahedra(i, :);

                tetrahedron = [x(vert); y(vert); z(vert)];

                % Calculate the volume of the current tetrahedron using the divergence theorem
                % Assuming the shape is closed (no openings)
                volume = abs(det(tetrahedron(:, 2:4) - tetrahedron(:, 1))) / 6;

                % Add the volume of the current tetrahedron to the total volume
                totalVolume = totalVolume + volume;
            end
            CreateUI.DisplayVolume(totalVolume)
        end
    end
end


