classdef CreateUI
    %This class creates the UI elements to control the robot

    methods
        function obj = CreateUI(LinUR3,LinUR5,Claw)

            %Creation of UI elements
            bgcol = [31 180 255]/255;
            fig = uifigure;
            p = uipanel(fig,"Title","LinearUR3 - CoSafe","BackgroundColor",bgcol);
            p.Position = [0,0,300,600];

            EStopUI = uicontrol(p);
            EStopUI.String = 'E-STOP';
            EStopUI.Position = [20 60 80 20];
            EStopUI.Callback = @EStop;

            StartUI = uicontrol(p);
            StartUI.String = 'Start';
            StartUI.Position = [20 120 80 20];
            StartUI.Callback = @Start;

            CP = uicontrol(p);
            CP.String = 'Spawn Person Inside Cage';
            CP.Position = [20 150 80 20];
            CP.Callback = @CagePerson;

            WS2 = uicontrol(p);
            WS2.String = 'Bake Worksapce';
            WS2.Position = [20 180 80 20];
            WS2.Callback = @BakeWorksapce;
            



            %%
            %Functions called when UI button is hit
            function CagePerson(src,event)
                EStop1 = PlaceObject('PersonMaleConstruction.ply',[0.6,1.5,0]);
                input("Auto Stopped: Detected Personel in Workspace. Press enter to ignore");
            end


            function BakeWorksapce(src,event)
                Workspace(LinUR3);
            end

            function EStop(src,event)
                input('E-STOP pushed, hit enter to continue');
            end


            function Start(src,event)
                Items = SpawnItems(transl(-2,-0.25,0));
                PlaceLocation = PlaceLocations(transl(-0.5,-0.25,0));
                %BuildWall(LinUR3,LinUR5,bricks,Wall,Claw);
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