classdef GUI
    %This class creates the UI elements to control the robots
    properties
        UIFigure
    end 

    methods
        function self = GUI()

            %Creation of UI elements
            bgcol = [31 180 255]/255;
            self.UIFigure = uifigure("Name","Grocery Packer UI");
            self.UIFigure.Color = [255,255,255]/255;

            DoBotUI = uipanel(self.UIFigure,"Title","DoBot Controls","BackgroundColor",bgcol);
            DoBotUI.Position = [475 -100 160 400];

            TM12UI = RobotUI(self,[675 -100 160 40]);

            % TM12UI = uipanel(fig,"Title","TM12 Controls","BackgroundColor",bgcol);
            % TM12UI.Position = [675 -100 160 400];

            ColliderUI = uipanel(self.UIFigure,"Title","Collider UI","BackgroundColor",bgcol);
            ColliderUI.Position = [475 -200 320 200];

            TestString = "Start System";
            StatsBox =  uipanel(self.UIFigure,"BackgroundColor",[0 255 0]/255);
            StatsBox.Position = [450,400,400,100];
            SystemStatusUI = uilabel(StatsBox);
            SystemStatusUI.Text = "<font style='color:white;'><b>" + TestString + " </font>";
            SystemStatusUI.Interpreter = "html";
            SystemStatusUI.FontSize = 32;
            SystemStatusUI.Position = [100,25, 400, 44];

            StartUI = uicontrol(self.UIFigure);
            StartUI.String = 'Start';
            StartUI.Position = [475 340 160 40];
            StartUI.Callback = @Start;

            EStopUI = uicontrol(self.UIFigure);
            EStopUI.String = 'E-STOP';
            EStopUI.Position = [675 340 160 40];
            EStopUI.Callback = @EStop;


            

            %%
            %Functions called when UI button is hit
            function EStop(src,event)
                input('E-STOP pushed, hit enter to continue'); % -DELETE THIS LINE -
                % - ADD - Function for EStop - ADD -
            end

            function Start(src,event)
                Items = SpawnItems(transl(-2,-0.25,0));
                PlaceLocation = PlaceLocations(transl(-0.5,-0.25,0));
                % - ADD - Function to being movement - ADD -
            end
        end
    end

    methods (Static)

        function UpdateSystemStatus(Message,Colour)
            StatsBox.Background = Colour;
            SystemStatusUI.Text = "<font style='color:white;'><b>" + Message + " </font>";
        end

        function UpdateUI(UR3q,LinUR3)
            Nextpos = LinUR3.model.fkine(UR3q).t;
            GoalX = uicontrol('style','text','String',{'Goal X: ',Nextpos(1)},'Position',[20 210 80 30]);
            GoalY = uicontrol('style','text','String',{'Goal Y: ',Nextpos(2)},'Position',[20 240 80 30]);
            GoalZ = uicontrol('style','text','String',{'Goal Z: ',Nextpos(3)},'Position',[20 270 80 30]);
        end


    end
end