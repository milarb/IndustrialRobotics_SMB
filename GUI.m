classdef GUI
    %This class creates the UI elements to control the robots

    properties
        Figure;
        StatsBox;
        SystemStatusUI;
        System
    end

    methods
        function self = GUI(System)

            %Creation of UI elements
            bgcol = [31 180 255]/255;
            
           self.Figure = uifigure("Name","Grocery Packer UI");
           self.Figure.Position(3:4) = [560 420]
            self.Figure.Color = [255,255,255]/255;

            DoBotUI = uipanel(self.Figure,"Title","DoBot Controls","BackgroundColor",bgcol);
            DoBotUI.Position = [0 -100 160 400];

            %TM12UI = RobotUI(self.Figure,[675 -100 160 40]);

            TM12UI = uipanel(self.Figure,"Title","TM12 Controls","BackgroundColor",bgcol);
            TM12UI.Position = [200 -100 160 400];

            ColliderUI = uipanel(self.Figure,"Title","Collider UI","BackgroundColor",bgcol);
            ColliderUI.Position = [0 -200 320 200];

            self.StatsBox =  uipanel(self.Figure,"BackgroundColor",[0,225,0]/255);
            self.StatsBox.Position = [0,400,400,100];
            self.SystemStatusUI = uilabel(self.StatsBox);
            self.SystemStatusUI.Interpreter = "html";
            self.SystemStatusUI.FontSize = 32;
            self.SystemStatusUI.Position = [100,25, 400, 44];



            StartUI = uicontrol(self.Figure);
            StartUI.String = 'Start';
            StartUI.Position = [0 340 160 40];
            StartUI.Callback = @Start;

            EStopUI = uicontrol(self.Figure);
            EStopUI.String = 'E-STOP';
            EStopUI.Position = [200 340 160 40];
            EStopUI.Callback = @EStop;

            %%
            %Functions called when UI button is hit
            function EStop(src,event)
                input('E-STOP pushed, hit enter to continue'); % -DELETE THIS LINE -
                % - ADD - Function for EStop - ADD -
            end

            function Start(src,event)
                System.SystemRunning = false;
                Items = SpawnItems(transl(-2,-0.25,0));
                PlaceLocation = PlaceLocations(transl(-0.5,-0.25,0));
                % - ADD - Function to being movement - ADD -
            end

            
        end
    end

    methods (Static)

        function UpdateSystemStatus(TextContainer,ColourContainer,Message,Colour) 
            TextContainer.Text = "<font style='color:white;'><b>" + Message + " </font>";
            ColourContainer.BackgroundColor = Colour/255;

        end

        function UpdateUI(UR3q,LinUR3)
            Nextpos = LinUR3.model.fkine(UR3q).t;
            GoalX = uicontrol('style','text','String',{'Goal X: ',Nextpos(1)},'Position',[20 210 80 30]);
            GoalY = uicontrol('style','text','String',{'Goal Y: ',Nextpos(2)},'Position',[20 240 80 30]);
            GoalZ = uicontrol('style','text','String',{'Goal Z: ',Nextpos(3)},'Position',[20 270 80 30]);
        end


    end
end