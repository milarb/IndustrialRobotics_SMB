classdef DobotMagic < RobotBaseClass
    %% DobotMagician Universal Robot 3kg payload robot model
    % WARNING: This model has been created by UTS students in the subject
    % 41013. No guarentee is made about the accuracy or correctness of the
    % of the DH parameters of the accompanying ply files. Do not assume
    % that this matches the real robot!

    properties(Access = public)   
        plyFileNameStem = 'DobotMagic';
    end
    
    methods
        
        %% Constructor
        function self = DobotMagic(baseTr,useTool,toolFilename)
            if nargin < 3
                if nargin == 2
                    error('If you set useTool you must pass in the toolFilename as well');
                elseif nargin == 0 % Nothing passed
                    baseTr = transl(0,0,0);  
                end             
            else % All passed in 
                self.useTool = useTool;
                toolTrData = load([toolFilename,'.mat']);
                self.toolTr = toolTrData.tool;
                self.toolFilename = [toolFilename,'.ply'];
            end

            self.CreateModel();
			self.model.base = self.model.base.T * baseTr;
            self.model.tool = self.toolTr;
            self.PlotAndColourRobot();

            drawnow
        end

%% CreateModel
        function CreateModel(self)       
            link(1) = Link('d',0.103+0.0362, 'a',0,      'alpha',-pi/2,  'offset',0, 'qlim',[deg2rad(-135),deg2rad(135)]);
            link(2) = Link('d',0,        'a',0.135,  'alpha',0,      'offset', -pi/2, 'qlim',[deg2rad(0),deg2rad(85)]);
            link(3) = Link('d',0,        'a',0.147,  'alpha',0,      'offset', pi/2, 'qlim',[deg2rad(-10),deg2rad(90)]);
            link(4) = Link('d',0,        'a',0.06,      'alpha',-pi/2,  'offset',0, 'qlim',[deg2rad(-90),deg2rad(90)]);
            % link(5) = Link('d',-0.05,      'a',0,      'alpha',0,      'offset',pi, 'qlim',[deg2rad(-85),deg2rad(85)]);

            self.model = SerialLink(link,'name',self.name); 
        end
    end
end
