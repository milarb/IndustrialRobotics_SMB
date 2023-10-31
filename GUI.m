classdef GUI
    %This class creates the UI elements to control the robots

    properties
        Figure;
        StatsBox;
        SystemStatusUI;
        System
        DoBotPos;
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

            DoBotControlUI(DoBotUI);

            StartUI = uicontrol(self.Figure);
            StartUI.String = 'Start';
            StartUI.Position = [0 340 160 40];
            StartUI.Callback = @Start;

            EStopUI = uicontrol(self.Figure);
            EStopUI.String = 'E-STOP';
            EStopUI.Position = [200 340 160 40];
            EStopUI.Callback = @EStop;

            EStopUI = uicontrol(self.Figure);
            EStopUI.String = 'Show Colliders';
            EStopUI.Position = [400 340 160 40];
            EStopUI.Callback = @EStop;

            

          
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

            function DoBotControlUI(parent)
            sliderProperties = struct('Style', 'slider', 'Value', 0, 'SliderStep', [0.01 0.2], 'Callback', @self.DoBotControl);
            uicontrol(parent,sliderProperties ,  'Position', [0 80 60 20], 'String', 'sliderX' , 'Min', -1 ,  'Max', 3);
            uicontrol(parent,sliderProperties ,  'Position', [0 60 60 20], 'String', 'sliderY' , 'Min', -1 ,  'Max', 3);
            uicontrol(parent,sliderProperties ,  'Position', [0 40 60 20], 'String', 'sliderZ' , 'Min', -1 ,  'Max', 3);


            SendPos = uicontrol(parent);
            SendPos.String = 'Enter';
            SendPos.Position = [0 140 60 20];
            SendPos.Callback = @SendDoBotPos;
            xInput = uieditfield(parent,"numeric",'Position', [0 200 60 20])
            yInput = uieditfield(parent,"numeric",'Position', [0 180 60 20])
            zInput = uieditfield(parent,"numeric",'Position', [0 160 60 20])
            self.DoBotPos = [xInput,yInput,zInput]
            end

            function SendDoBotPos(src,event)
                values = System.DoBotPos
                pos = [values(1).Value,values(2).Value,values(3).Value]
                transPos = transl(pos);
                Goalq = System.DoBot.model.ikcon(pos);
                Movement = jtraj(System.DoBot.model.getpos,Goalq,50);

                for i = 1:50
                    System.DoBot.model.animate(Movement(i,:));
                    drawnow()
                end
            end

            function DoBotControl(self,source, ~)
                sliderValue = get(source, 'Value');
                tr = self.camera_h.T.T;

                switch source.String
                    case 'sliderX'
                        Gaolq = System.DoBot.model.getpos;
                        Gaolq(1) = sliderValue
                    case 'sliderY'
                        Gaolq = System.DoBot.model.getpos;
                        Gaolq(2) = sliderValue
                    case 'sliderZ'
                        Gaolq = System.DoBot.model.getpos;
                        Gaolq(3) = sliderValue
                end

                Movement = jtraj(System.DoBot.model.getpos,Gaolq,10);
                for i = 1:10
                    System.DoBot.model.animate(Movement(i,:));
                    drawnow()
                end
               
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