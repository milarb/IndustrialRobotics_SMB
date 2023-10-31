classdef GUI
    %This class creates the UI elements to control the robots

    properties
        Figure;
        StatsBox;
        SystemStatusUI;
        System
        UR3Bot;
        UR3UI;

        GUIWidth = 400;
    end

    methods
        function self = GUI(System)

            %Creation of UI elements
            bgcol = [255 255 255]/255;
            self.System = System;
            
           self.Figure = uifigure("Name","Grocery Packer UI");
           self.Figure.Position(3:4) = [560 420]
            self.Figure.Color = [255,255,255]/255;

            URUI = uipanel(self.Figure,"Title","DoBot Controls","BackgroundColor",bgcol);
            URUI.Position = [0 -150 self.GUIWidth/2 400];

            %TM12UI = RobotUI(self.Figure,[675 -100 160 40]);

            TM12UI = uipanel(self.Figure,"Title","TM12 Controls","BackgroundColor",bgcol);
            TM12UI.Position = [self.GUIWidth/2 -150 self.GUIWidth/2 400];

            ColliderUI = uipanel(self.Figure,"Title","Collider UI","BackgroundColor",bgcol);
            ColliderUI.Position = [0 -200 320 200];

            self.StatsBox =  uipanel(self.Figure,"BackgroundColor",[0,225,0]/255);
            self.StatsBox.Position = [0,self.GUIWidth,self.GUIWidth,100];
            self.SystemStatusUI = uilabel(self.StatsBox);
            self.SystemStatusUI.Interpreter = "html";
            self.SystemStatusUI.FontSize = 32;
            self.SystemStatusUI.Position = [100,25, 400, 44];

            UR3ControlUI(URUI);

            StartUI = uicontrol(self.Figure);
            StartUI.String = 'Start';
            StartUI.Position = [0 340 self.GUIWidth/2 40];
            StartUI.Callback = @Start;

            EStopUI = uicontrol(self.Figure);
            EStopUI.String = 'E-STOP';
            EStopUI.Position = [self.GUIWidth/2 340 self.GUIWidth/2 40];
            EStopUI.Callback = @EStop;

            EStopUI = uicontrol(self.Figure);
            EStopUI.String = 'Show Colliders';
            EStopUI.Position = [0 280 self.GUIWidth/2 40];
            EStopUI.Callback = @EStop;

            EStopUI = uicontrol(self.Figure);
            EStopUI.String = 'Box Collider';
            EStopUI.Position = [self.GUIWidth/2 280 self.GUIWidth/2 40];
            EStopUI.Callback = @EStop;

            % while true
            %     try
            %        self.UR3Bot = System.UR3;
            %     end
            %     if self.UR3Bot ~= []
            %         retrun
            %     end
            % end
            % 
            % disp("I have robot!")

            

          
            %%
            %Functions called when UI button is hit
            function EStop(src,event)
                GUI.UpdateSystemStatus(self.SystemStatusUI,self.StatsBox,"Stopped",[255,0,0])
                input('E-STOP pushed, hit enter to continue'); % -DELETE THIS LINE -
                % - ADD - Function for EStop - ADD -

                GUI.UpdateSystemStatus(self.SystemStatusUI,self.StatsBox,"Operating...",[0,0,200])
            end

            function Start(src,event)
                GUI.UpdateSystemStatus(self.SystemStatusUI,self.StatsBox,"Operating...",[0,0,200])
                System.SystemRunning = false;
                Items = SpawnItems(transl(-2,-0.25,0));
                PlaceLocation = PlaceLocations(transl(-0.5,-0.25,0));
                BensRMCR(System.DoBot,System.TM12,Items,PlaceLocation);
                % - ADD - Function to being movement - ADD -
            end

            function UR3ControlUI(parent)
            sliderProperties = struct('Style', 'slider', 'Value', 0, 'SliderStep', [0.01 0.2], 'Callback', @UR3QControl);
            uicontrol(parent,sliderProperties ,  'Position', [self.GUIWidth/4- 60 100 120 20], 'String', 'slider1' , 'Min', -2*pi ,  'Max', 2*pi);
            uicontrol(parent,sliderProperties ,  'Position', [self.GUIWidth/4- 60 80 120 20], 'String', 'slider2' , 'Min', -2*pi ,  'Max', 2*pi);
            uicontrol(parent,sliderProperties ,  'Position', [self.GUIWidth/4- 60 60 120 20], 'String', 'slider3' , 'Min', -2*pi ,  'Max', 2*pi);
            uicontrol(parent,sliderProperties ,  'Position', [self.GUIWidth/4- 60 40 120 20], 'String', 'slider4' , 'Min', -2*pi ,  'Max', 2*pi);
            uicontrol(parent,sliderProperties ,  'Position', [self.GUIWidth/4- 60 20 120 20], 'String', 'slider5' , 'Min', -2*pi ,  'Max', 2*pi);
            uicontrol(parent,sliderProperties ,  'Position', [self.GUIWidth/4- 60 00 120 20], 'String', 'slider6' , 'Min', -2*pi ,  'Max', 2*pi);

            SendPos = uicontrol(parent);
            SendPos.String = 'Enter';
            SendPos.Position = [self.GUIWidth/4 - 30 140 60 20];
            SendPos.Callback = @SendUR3Pos;
            xInput = uieditfield(parent,"numeric",'Position', [self.GUIWidth/4- 30 200 60 20])
            yInput = uieditfield(parent,"numeric",'Position', [self.GUIWidth/4- 30 180 60 20])
            zInput = uieditfield(parent,"numeric",'Position', [self.GUIWidth/4- 30 160 60 20])
            self.UR3UI = [xInput,yInput,zInput];
            end

            function SendUR3Pos(src,event)
                values = self.UR3UI
                pos = [values(1).Value,values(2).Value,values(3).Value];
                trans = transl(pos)
                Goalq = System.UR3.model.ikcon(trans);
                Movement = jtraj(System.UR3.model.getpos,Goalq,50);

                for i = 1:50
                    System.UR3.model.animate(Movement(i,:));
                    drawnow()
                end
            end
            

            function UR3QControl(self,source, ~)
                StringName = source.Source.String;

                switch StringName
                    case 'slider1'
                        disp(source.Source.Value);
                        % Gaolq = System.DoBot.model.getpos;
                        % Gaolq(1) = sliderValue
                    case 'slider2'
                        disp(source.Source.Value);
                        % Gaolq = System.DoBot.model.getpos;
                        % Gaolq(2) = sliderValue
                        disp(source.Source.Value);
                    case 'slider3'
                        % Gaolq = System.DoBot.model.getpos;
                        % Gaolq(3) = sliderValue
                end

                % Movement = jtraj(System.DoBot.model.getpos,Gaolq,5);
                % for i = 1:5
                %     System.DoBot.model.animate(Movement(i,:));
                %     drawnow()
                % end
               
            end

            
    end
    end
    methods (Static)
        
        %Full Load UI Here???

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