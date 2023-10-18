classdef GUI
    %This class creates the UI elements to control the robot

    methods
        function obj = GUI(DoBot,TM12,Claw)

            %Creation of UI elements
            bgcol = [31 180 255]/255;
            fig = uifigure("Name","Grocery Packer UI");
            fig.Color = [255,255,255]/255;

            DoBotUI = uipanel(fig,"Title","DoBot Controls","BackgroundColor",bgcol);
            DoBotUI.Position = [475 -100 160 400];

            TM12UI = uipanel(fig,"Title","TM12 Controls","BackgroundColor",bgcol);
            TM12UI.Position = [675 -100 160 400];

            ColliderUI = uipanel(fig,"Title","Collider UI","BackgroundColor",bgcol);
            ColliderUI.Position = [475 -200 320 200];



            TestString = "Start System";
            StatsBox =  uipanel(fig,"BackgroundColor",[0 255 0]/255);
            StatsBox.Position = [450,400,400,100];
            SystemStatusUI = uilabel(StatsBox)
            SystemStatusUI.Text = "<font style='color:white;'><b>" + TestString + " </font>";
            SystemStatusUI.Interpreter = "html";
            SystemStatusUI.FontSize = 32;
            SystemStatusUI.Position = [100,25, 400, 44]

            StartUI = uicontrol(fig);
            StartUI.String = 'Start';
           StartUI.Position = [475 340 160 40];
           StartUI.Callback = @Start;

           EStopUI = uicontrol(fig);
           EStopUI.String = 'E-STOP';
           EStopUI.Position = [675 340 160 40];
           EStopUI.Callback = @EStop;


            

            %%
            %Functions called when UI button is hit
            function EStop(src,event)
                input('E-STOP pushed, hit enter to continue');
            end


            function Start(src,event)
                Items = SpawnItems(transl(-2,-0.25,0));
                PlaceLocation = PlaceLocations(transl(-0.5,-0.25,0));
                ScanAndPack(DoBot,ROBOTNAME,Items,PlaceLocation,Claw);
            end
        end
    end

    methods (Static)

        function UpdateStatus(Message)
            Status = uicontrol('style','text','String',Message,'Position',[80 300 80 30]);
        end

        function UpdateUI(UR3q,LinUR3)
            Nextpos = LinUR3.model.fkine(UR3q).t;
            GoalX = uicontrol('style','text','String',{'Goal X: ',Nextpos(1)},'Position',[20 210 80 30]);
            GoalY = uicontrol('style','text','String',{'Goal Y: ',Nextpos(2)},'Position',[20 240 80 30]);
            GoalZ = uicontrol('style','text','String',{'Goal Z: ',Nextpos(3)},'Position',[20 270 80 30]);
        end

        function DisplayVolume(Vol)
            Volume = uicontrol('style','text','String',{'Volume is: ',Vol},'Position',[80 330 80 30]);
        end

        function UpdateCurrent(UR3q,LinUR3)
            % Currentpos = LinUR3.model.fkineUTS(LinUR3.model.getpos);
            % CurrentX = uicontrol('style','text','String',{'Current X: ',Currentpos(1,4)},'Position',[120 210 80 30]);
            % CurrentY = uicontrol('style','text','String',{'Current Y: ',Currentpos(2,4)},'Position',[120 240 80 30]);
            % CurrentZ = uicontrol('style','text','String',{'Current Z: ',Currentpos(3,4)},'Position',[120 270 80 30]);
        end
    end
end