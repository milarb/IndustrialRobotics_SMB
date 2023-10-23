classdef TwoFGripper < RobotBaseClass
    
    properties(Access = public)   
        plyFileNameStem = 'TwoFGripper';
    end
    
    methods
%% Constructor
        function self = TwoFGripper(baseTr,useTool,toolFilename)
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
    
        function CreateModel(self)   
                link(1) = Link('d',0.06506,'a',0.0127,'alpha',pi/2,'qlim',[-pi pi],'offset',0);
                link(2) = Link('d',0,'a',0.05715,'alpha',0,'qlim',[-pi pi],'offset', 0);
                link(3) = Link('d',0,'a',0,'alpha',0,'qlim',[-pi pi],'offset', 0);
    
                self.model = SerialLink(link,'name',self.name);
         end
    end
end