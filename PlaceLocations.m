classdef PlaceLocations < handle

    properties
        SlotCount = 9;

        EndPos;
    end

    methods
        %% structors
        function self = PlaceLocations(baseTr)

            workspace = [-2 2 -2 2 0 2];

            % Create wall by iterating through each column in each row
            i = 1;
            for r = 1:3
                for c = 1:3
                    self.EndPos{i} = self.GetBrickModel(['FinishSpot',num2str(i)]);
                    self.EndPos{i}.base =  baseTr * transl((c*0.1),r*0.13 - 0.05,0.8);
                    plot3d(self.EndPos{i},0,'workspace',workspace,'view',[-30,30],'delay',0,'noarrow','nowrist');
                    i = i + 1;
                end

            end
            axis equal
        end

    end

    methods (Static)
        %%Creates position in wall for brick to go
        function model = GetBrickModel(name)
            if nargin < 1
                name = 'Wall';
            end
            [faceData,vertexData] = plyread('Ghost.ply','tri');
            link1 = Link('alpha',pi,'a',0,'d',-0.1,'offset',0);
            model = SerialLink(link1,'name',name);

            % Changing order of cell array so that data is attributed to Link 1
            % in plot3d rather than Link 0 (base).
            model.faces = {[], faceData};
            model.points = {[], vertexData};
        end
    end
end