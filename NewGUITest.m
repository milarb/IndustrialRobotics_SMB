classdef NewGUITest

    %GUI Properties
    properties (Access = public)

        UR3POS
        System

        UIFigure               matlab.ui.Figure
        ShowCollidersButton_2  matlab.ui.control.Button
        HomeRobotsButton       matlab.ui.control.Button
        TabGroup               matlab.ui.container.TabGroup
        UR3Tab                 matlab.ui.container.Tab
        StatusLamp             matlab.ui.control.Lamp
        TabGroup2              matlab.ui.container.TabGroup
        XYZTab                 matlab.ui.container.Tab
        EnterButton            matlab.ui.control.Button
        Button_12              matlab.ui.control.Button
        Button_11              matlab.ui.control.Button
        Button_10              matlab.ui.control.Button
        Button_9               matlab.ui.control.Button
        Button_8               matlab.ui.control.Button
        Button_7               matlab.ui.control.Button
        Label2_6               matlab.ui.control.Label
        Label2_5               matlab.ui.control.Label
        Label2_4               matlab.ui.control.Label
        Label2_3               matlab.ui.control.Label
        Label2_2               matlab.ui.control.Label
        Label2                 matlab.ui.control.Label
        Button_6               matlab.ui.control.Button
        Button_5               matlab.ui.control.Button
        Button_4               matlab.ui.control.Button
        Button_3               matlab.ui.control.Button
        Button_2               matlab.ui.control.Button
        Button                 matlab.ui.control.Button
        YawEditField           matlab.ui.control.NumericEditField
        YawEditFieldLabel      matlab.ui.control.Label
        PitchEditField         matlab.ui.control.NumericEditField
        PitchEditFieldLabel    matlab.ui.control.Label
        RollEditField          matlab.ui.control.NumericEditField
        RollEditFieldLabel     matlab.ui.control.Label
        ZEditField             matlab.ui.control.NumericEditField
        ZEditFieldLabel        matlab.ui.control.Label
        YEditField             matlab.ui.control.NumericEditField
        YEditFieldLabel        matlab.ui.control.Label
        XEditField             matlab.ui.control.NumericEditField
        XEditFieldLabel        matlab.ui.control.Label
        QTab                   matlab.ui.container.Tab
        Label_6                matlab.ui.control.Label
        Label_5                matlab.ui.control.Label
        Label_4                matlab.ui.control.Label
        Label_3                matlab.ui.control.Label
        Label_2                matlab.ui.control.Label
        Label                  matlab.ui.control.Label
        Q6Slider               matlab.ui.control.Slider
        Q6SliderLabel          matlab.ui.control.Label
        Q3Slider               matlab.ui.control.Slider
        Q3SliderLabel          matlab.ui.control.Label
        Q2Slider               matlab.ui.control.Slider
        Q2SliderLabel          matlab.ui.control.Label
        Q5Slider               matlab.ui.control.Slider
        Q5SliderLabel          matlab.ui.control.Label
        Q4Slider               matlab.ui.control.Slider
        Q4SliderLabel          matlab.ui.control.Label
        Q1Slider               matlab.ui.control.Slider
        Q1SliderLabel          matlab.ui.control.Label
        UR3Label               matlab.ui.control.Label
        Image_2                matlab.ui.control.Image
        TM12Tab                matlab.ui.container.Tab
        StatusLamp_2           matlab.ui.control.Lamp
        TabGroup2_2            matlab.ui.container.TabGroup
        XYZTab_2               matlab.ui.container.Tab
        EnterButton_2          matlab.ui.control.Button
        Button_24              matlab.ui.control.Button
        Button_23              matlab.ui.control.Button
        Button_22              matlab.ui.control.Button
        Button_21              matlab.ui.control.Button
        Button_20              matlab.ui.control.Button
        Button_19              matlab.ui.control.Button
        Label2_12              matlab.ui.control.Label
        Label2_11              matlab.ui.control.Label
        Label2_10              matlab.ui.control.Label
        Label2_9               matlab.ui.control.Label
        Label2_8               matlab.ui.control.Label
        Label2_7               matlab.ui.control.Label
        Button_18              matlab.ui.control.Button
        Button_17              matlab.ui.control.Button
        Button_16              matlab.ui.control.Button
        Button_15              matlab.ui.control.Button
        Button_14              matlab.ui.control.Button
        Button_13              matlab.ui.control.Button
        YawEditField_2         matlab.ui.control.NumericEditField
        YawEditField_2Label    matlab.ui.control.Label
        PitchEditField_2       matlab.ui.control.NumericEditField
        PitchEditField_2Label  matlab.ui.control.Label
        RollEditField_2        matlab.ui.control.NumericEditField
        RollEditField_2Label   matlab.ui.control.Label
        ZEditField_2           matlab.ui.control.NumericEditField
        ZEditField_2Label      matlab.ui.control.Label
        YEditField_2           matlab.ui.control.NumericEditField
        YEditField_2Label      matlab.ui.control.Label
        XEditField_2           matlab.ui.control.NumericEditField
        XEditField_2Label      matlab.ui.control.Label
        QTab_2                 matlab.ui.container.Tab
        Label_12               matlab.ui.control.Label
        Label_11               matlab.ui.control.Label
        Label_10               matlab.ui.control.Label
        Label_9                matlab.ui.control.Label
        Label_8                matlab.ui.control.Label
        Label_7                matlab.ui.control.Label
        Q6Slider_2             matlab.ui.control.Slider
        Q6Slider_2Label        matlab.ui.control.Label
        Q3Slider_2             matlab.ui.control.Slider
        Q3Slider_2Label        matlab.ui.control.Label
        Q2Slider_2             matlab.ui.control.Slider
        Q2Slider_2Label        matlab.ui.control.Label
        Q5Slider_2             matlab.ui.control.Slider
        Q5Slider_2Label        matlab.ui.control.Label
        Q4Slider_2             matlab.ui.control.Slider
        Q4Slider_2Label        matlab.ui.control.Label
        Q1Slider_2             matlab.ui.control.Slider
        Q1Slider_2Label        matlab.ui.control.Label
        TM12Label              matlab.ui.control.Label
        Image_3                matlab.ui.control.Image
        LogTab                 matlab.ui.container.Tab
        Switch                 matlab.ui.control.RockerSwitch
        ESTOPButton_2          matlab.ui.control.StateButton
        Panel                  matlab.ui.container.Panel
        OFFLabel               matlab.ui.control.Label
        CoGrocerLabel          matlab.ui.control.Label
        ScanPackButton         matlab.ui.control.Button
        TestSystem
    end

    %% Functions for GUI elements
    methods (Access = private)

        function TurnOn(app)
            % Main();
            % app.OFFLabel.Text = 'Booting...';
            % app.OFFLabel.BackgroundColor = [0.8 0.8 0];
            % % BuildEnvironment;
            % % Items = SpawnItems(transl(-2,-0.25,0));
            % % System.PlaceLocation = PlaceLocations(transl(-0.5,-0.25,0));
            % % [app.UR3, System.TM12, System.ExtraUR3] = BuildEnvironment.SpawnRobots;
            % % col = CollisionControl(System);
            % app.OFFLabel.BackgroundColor = [0 1 0];
            % app.OFFLabel.Text = 'System Ready';
            % disp("HELLO WORLD");
        end

%Estop callback function
        function EStop(app)
            app.OFFLabel.BackgroundColor = [1 0 0];
            app.OFFLabel.Text = "STOPPED"
            input('E-STOP pushed, hit enter to continue');
            app.OFFLabel.BackgroundColor = [0 1 0];
            app.OFFLabel.Text = "System Ready"
        end

        %Calls Robot Movment script for packing items
        function ScanNPack(app)
            app.OFFLabel.BackgroundColor = [0 0 1];
            app.OFFLabel.Text = "Operating..."
            BensRMCR(app.System.UR3,app.System.TM12,app.System.Items,app.System.PlaceLocation,app.System.Colliders);
            app.OFFLabel.BackgroundColor = [0 1 0];
            app.OFFLabel.Text = "System Ready"
        end

        function ShowColliders(app)
            input('ShowColliders');
        end

        %Sends robots to home joint state
        function HomeRobots(app)
            app.OFFLabel.BackgroundColor = [0 0.5 0];
            app.OFFLabel.Text = "Robots Going Home"
            Goalq = [0,0,0,0,0,0];
            Movement1 = jtraj(app.System.UR3.model.getpos,Goalq,100);
            Movement2 = jtraj(app.System.TM12.model.getpos,Goalq,100);
            for i = 1:100
                app.System.UR3.model.animate(Movement1(i,:));
                app.System.TM12.model.animate(Movement2(i,:));
                drawnow()
            end
            app.OFFLabel.BackgroundColor = [0 1 0];
            app.OFFLabel.Text = "System Ready"
        end

        %Callback function to send XYZRPY to robot 
        function SendPos(app,Robot)
            %UR3POS is array of ui edit fields
           values = app.UR3POS
           %Get values from array
            XYZ = [values(1).Value,values(2).Value,values(3).Value]
            RPY = [values(4).Value,values(5).Value,values(6).Value]
            %convert values into se3
            trans = SE3(transl(XYZ) * trotz(RPY(3))* troty(RPY(2))* trotx(RPY(1)))

            %Move robot
             Goalq = Robot.model.ikcon(trans);
                Movement = jtraj(Robot.model.getpos,Goalq,100);

                for i = 1:100
                    Robot.model.animate(Movement(i,:));
                    drawnow()
                end
        end

        % Callback function for incramental movement
        function AdjustCartasian(app,index,incrament,Robot)
            switch index %Index = XYZRPY = 1-6
                case 1
                    trans = SE3(transl(incrament,0,0))
                case 2
                    trans = SE3(transl(0,incrament,0))
                case 3
                    trans = SE3(transl(0,0,incrament))
                case 4
                    trans = SE3(trotx(incrament))
                case 5
                    trans = SE3(troty(incrament))
                case 6
                    trans = SE3(trotz(incrament))
            end
            Goalq = Robot.model.ikcon(trans);
                Movement = jtraj(Robot.model.getpos,Goalq,2);

                for i = 1:2
                    shouldsStop = CollisionControl.RobotCollisionCheck(Robot,app.System.Colliders)
                    if shouldsStop == false
                    Robot.model.animate(Movement(i,:));
                    drawnow()
                    end
                end
        end

        function SendJoints(app,Slider,index,Robot)
            q = Robot.model.getpos;
            q(index) = Slider.Value;

            Movement = jtraj(Robot.model.getpos,q,5);

            for i = 1:5
                shouldsStop = CollisionControl.RobotCollisionCheck(Robot,app.System.Colliders)
                if shouldsStop == false
                    Robot.model.animate(Movement(i,:));
                    drawnow()
                end
            end
            %input(num2str(Slider.Value));
        end
    end


%%
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [0 0 400 678];
            app.UIFigure.Name = 'MATLAB App';



            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.BorderColor = [0.902 0.902 0.902];
            app.Panel.BackgroundColor = [0.902 0.902 0.902];
            app.Panel.Position = [1 584 402 114];

            % Create CoGrocerLabel
            app.CoGrocerLabel = uilabel(app.Panel);
            app.CoGrocerLabel.HorizontalAlignment = 'center';
            app.CoGrocerLabel.FontName = 'Bookman';
            app.CoGrocerLabel.FontSize = 24;
            app.CoGrocerLabel.FontWeight = 'bold';
            app.CoGrocerLabel.FontColor = [0 1 0];
            app.CoGrocerLabel.Position = [114 55 173 59];
            app.CoGrocerLabel.Text = 'Co-Grocer';

            % Create OFFLabel
            app.OFFLabel = uilabel(app.Panel);
            app.OFFLabel.BackgroundColor = [0 1 0];
            app.OFFLabel.HorizontalAlignment = 'center';
            app.OFFLabel.FontSize = 24;
            app.OFFLabel.FontWeight = 'bold';
            app.OFFLabel.FontColor = [1 1 1];
            app.OFFLabel.Position = [80 28 239 34];
            app.OFFLabel.Text = 'System Ready';

            % Create ScanPackButton
            app.ScanPackButton = uibutton(app.UIFigure, 'push');
            app.ScanPackButton.Position = [22 487 100 23];
            app.ScanPackButton.ButtonPushedFcn = @(src,event) ScanNPack(app)
            app.ScanPackButton.Text = 'Scan & Pack';

            % Create ESTOPButton_2
            app.ESTOPButton_2 = uibutton(app.UIFigure, 'state');
            app.ESTOPButton_2.Text = 'E-STOP';
            % app.ESTOPButton_2.ButtonPushedFcn = @(src,event) EStop(app)
            app.ESTOPButton_2.BackgroundColor = [1 0 0];
            app.ESTOPButton_2.FontName = 'BolsterBold';
            app.ESTOPButton_2.FontSize = 24;
            app.ESTOPButton_2.FontColor = [1 1 1];
            app.ESTOPButton_2.Position = [122 534 143 40];

            % Create Switch
            app.Switch = uiswitch(app.UIFigure, 'rocker');
            app.Switch.Position = [47 607 20 45];
            app.Switch.ValueChangedFcn = @(src,event) TurnOn(app)

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [9 24 384 441];

            % Create UR3Tab
            app.UR3Tab = uitab(app.TabGroup);
            app.UR3Tab.Title = 'UR3';

            % Create Image_2
            app.Image_2 = uiimage(app.UR3Tab);
            app.Image_2.ImageSource = "UR3.png";
            app.Image_2.Position = [16 310 94 107];

            % Create UR3Label
            app.UR3Label = uilabel(app.UR3Tab);
            app.UR3Label.HorizontalAlignment = 'center';
            app.UR3Label.FontSize = 24;
            app.UR3Label.FontWeight = 'bold';
            app.UR3Label.Position = [166 340 77 47];
            app.UR3Label.Text = 'UR3';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.UR3Tab);
            app.TabGroup2.Position = [14 14 356 297];

            %% Creating XYZ Buttons

            % Create XYZTab
            app.XYZTab = uitab(app.TabGroup2);
            app.XYZTab.Title = 'XYZ';

            % Create XEditFieldLabel
            app.XEditFieldLabel = uilabel(app.XYZTab);
            app.XEditFieldLabel.HorizontalAlignment = 'right';
            app.XEditFieldLabel.Position = [43 241 25 22];
            app.XEditFieldLabel.Text = 'X';

            % Create XEditField
            app.XEditField = uieditfield(app.XYZTab, 'numeric');
            app.XEditField.Position = [132 239 100 22];

            % Create YEditFieldLabel
            app.YEditFieldLabel = uilabel(app.XYZTab);
            app.YEditFieldLabel.HorizontalAlignment = 'right';
            app.YEditFieldLabel.Position = [43 209 25 22];
            app.YEditFieldLabel.Text = 'Y';

            % Create YEditField
            app.YEditField = uieditfield(app.XYZTab, 'numeric');
            app.YEditField.Position = [132 209 100 22];

            % Create ZEditFieldLabel
            app.ZEditFieldLabel = uilabel(app.XYZTab);
            app.ZEditFieldLabel.HorizontalAlignment = 'right';
            app.ZEditFieldLabel.Position = [43 178 25 22];
            app.ZEditFieldLabel.Text = 'Z';

            % Create ZEditField
            app.ZEditField = uieditfield(app.XYZTab, 'numeric');
            app.ZEditField.Position = [132 178 100 22];

            % Create RollEditFieldLabel
            app.RollEditFieldLabel = uilabel(app.XYZTab);
            app.RollEditFieldLabel.HorizontalAlignment = 'right';
            app.RollEditFieldLabel.Position = [43 156 26 22];
            app.RollEditFieldLabel.Text = 'Roll';

            % Create RollEditField
            app.RollEditField = uieditfield(app.XYZTab, 'numeric');
            app.RollEditField.Position = [132 150 100 22];

            % Create PitchEditFieldLabel
            app.PitchEditFieldLabel = uilabel(app.XYZTab);
            app.PitchEditFieldLabel.HorizontalAlignment = 'right';
            app.PitchEditFieldLabel.Position = [40 125 32 22];
            app.PitchEditFieldLabel.Text = 'Pitch';

            % Create PitchEditField
            app.PitchEditField = uieditfield(app.XYZTab, 'numeric');
            app.PitchEditField.Position = [132 120 100 22];

            % Create YawEditFieldLabel
            app.YawEditFieldLabel = uilabel(app.XYZTab);
            app.YawEditFieldLabel.HorizontalAlignment = 'right';
            app.YawEditFieldLabel.Position = [45 92 27 22];
            app.YawEditFieldLabel.Text = 'Yaw';

            % Create YawEditField
            app.YawEditField = uieditfield(app.XYZTab, 'numeric');
            app.YawEditField.Position = [132 89 100 22];

            app.UR3POS = [app.XEditField, app.YEditField, app.ZEditField,app.RollEditField,app.PitchEditField, app.YawEditField];

            %% Creating + Buttons UR3

            % Create Button
            app.Button = uibutton(app.XYZTab, 'push');
            app.Button.Position = [234 238 25 23];
            app.Button.ButtonPushedFcn = @(src,event) AdjustCartasian(app,1,0.1,app.System.UR3);
            app.Button.Text = '+';

            % Create Button_2
            app.Button_2 = uibutton(app.XYZTab, 'push');
            app.Button_2.ButtonPushedFcn = @(src,event) AdjustCartasian(app,2,0.1,app.System.UR3);
            app.Button_2.Position = [234 209 25 23];
            app.Button_2.Text = '+';

            % Create Button_3
            app.Button_3 = uibutton(app.XYZTab, 'push');
            app.Button_3.ButtonPushedFcn = @(src,event) AdjustCartasian(app,3,0.1,app.System.UR3);
            app.Button_3.Position = [234 178 25 23];
            app.Button_3.Text = '+';

            % Create Button_4
            app.Button_4 = uibutton(app.XYZTab, 'push');
            app.Button_4.Position = [234 150 25 23];
            app.Button_4.ButtonPushedFcn = @(src,event) AdjustCartasian(app,4,0.1,app.System.UR3);
            app.Button_4.Text = '+';

            % Create Button_5
            app.Button_5 = uibutton(app.XYZTab, 'push');
            app.Button_5.Position = [234 118 25 23];
            app.Button_5.ButtonPushedFcn = @(src,event) AdjustCartasian(app,5,0.1,app.System.UR3);
            app.Button_5.Text = '+';

            % Create Button_6
            app.Button_6 = uibutton(app.XYZTab, 'push');
            app.Button_6.ButtonPushedFcn = @(src,event) AdjustCartasian(app,6,0.1,app.System.UR3);
            app.Button_6.Position = [234 89 25 23];
            app.Button_6.Text = '+';


            %% Lables for XYZ for UR3

            % Create Label2
            app.Label2 = uilabel(app.XYZTab);
            app.Label2.Position = [281 241 41 22];
            app.Label2.Text = 'Label2';

            % Create Label2_2
            app.Label2_2 = uilabel(app.XYZTab);
            app.Label2_2.Position = [281 209 41 22];
            app.Label2_2.Text = 'Label2';

            % Create Label2_3
            app.Label2_3 = uilabel(app.XYZTab);
            app.Label2_3.Position = [281 178 41 22];
            app.Label2_3.Text = 'Label2';

            % Create Label2_4
            app.Label2_4 = uilabel(app.XYZTab);
            app.Label2_4.Position = [281 150 41 22];
            app.Label2_4.Text = 'Label2';

            % Create Label2_5
            app.Label2_5 = uilabel(app.XYZTab);
            app.Label2_5.Position = [282 120 41 22];
            app.Label2_5.Text = 'Label2';

            % Create Label2_6
            app.Label2_6 = uilabel(app.XYZTab);
            app.Label2_6.Position = [281 91 41 22];
            app.Label2_6.Text = 'Label2';

            %% Creating - Buttons for UR3
            % Create Button_7
            app.Button_7 = uibutton(app.XYZTab, 'push');
            app.Button_7.Position = [106 238 25 23];
            app.Button_7.ButtonPushedFcn = @(src,event) AdjustCartasian(app,1,-0.1,app.System.UR3);
            app.Button_7.Text = '-';

            % Create Button_8
            app.Button_8 = uibutton(app.XYZTab, 'push');
            app.Button_8.Position = [106 209 25 23];
            app.Button_8.ButtonPushedFcn = @(src,event) AdjustCartasian(app,2,-10.,app.System.UR3);
            app.Button_8.Text = '-';

            % Create Button_9
            app.Button_9 = uibutton(app.XYZTab, 'push');
            app.Button_9.Position = [106 178 25 23];
            app.Button_9.ButtonPushedFcn = @(src,event) AdjustCartasian(app,3,-0.1,app.System.UR3);
            app.Button_9.Text = '-';

            % Create Button_10
            app.Button_10 = uibutton(app.XYZTab, 'push');
            app.Button_10.Position = [106 150 25 23];
            app.Button_10.ButtonPushedFcn = @(src,event) AdjustCartasian(app,4,-0.1,app.System.UR3);
            app.Button_10.Text = '-';

            % Create Button_11
            app.Button_11 = uibutton(app.XYZTab, 'push');
            app.Button_11.Position = [106 118 25 23];
            app.Button_11.ButtonPushedFcn = @(src,event) AdjustCartasian(app,5,-0.1,app.System.UR3);
            app.Button_11.Text = '-';

            % Create Button_12
            app.Button_12 = uibutton(app.XYZTab, 'push');
            app.Button_12.Position = [106 89 25 23];
            app.Button_12.ButtonPushedFcn = @(src,event) AdjustCartasian(app,6,-0.1,app.System.UR3);
            app.Button_12.Text = '-';

            % Create EnterButton
            app.EnterButton = uibutton(app.XYZTab, 'push');
            app.EnterButton.Position = [132 59 100 23];
            app.EnterButton.ButtonPushedFcn = @(src,event) SendPos(app,app.System.UR3)
            app.EnterButton.Text = 'Enter';

            %% Q Tab
            % Create QTab
            app.QTab = uitab(app.TabGroup2);
            app.QTab.Title = 'Q';

            %% Q Sliders for UR3
            % Create Q1SliderLabel
            app.Q1SliderLabel = uilabel(app.QTab);
            app.Q1SliderLabel.HorizontalAlignment = 'right';
            app.Q1SliderLabel.Position = [23 248 25 22];
            app.Q1SliderLabel.Text = 'Q1';

            % Create Q1Slider
            app.Q1Slider = uislider(app.QTab);
            app.Q1Slider.Limits = [-6.28318530717959 6.28318530717959];
            app.Q1Slider.ValueChangingFcn = @(src,event) SendJoints(app,app.Q1Slider,1,app.System.UR3);
            app.Q1Slider.Position = [79 261 180 3];

            % Create Q4SliderLabel
            app.Q4SliderLabel = uilabel(app.QTab);
            app.Q4SliderLabel.HorizontalAlignment = 'right';
            app.Q4SliderLabel.Position = [21 111 25 22];
            app.Q4SliderLabel.Text = 'Q4';

            % Create Q4Slider
            app.Q4Slider = uislider(app.QTab);
            app.Q4Slider.Limits = [-6.28319 6.28319];
            app.Q4Slider.ValueChangingFcn = @(src,event) SendJoints(app,app.Q4Slider,4,app.System.UR3);
            app.Q4Slider.Position = [77 133 180 3];

            % Create Q5SliderLabel
            app.Q5SliderLabel = uilabel(app.QTab);
            app.Q5SliderLabel.HorizontalAlignment = 'right';
            app.Q5SliderLabel.Position = [21 68 25 22];
            
            app.Q5SliderLabel.Text = 'Q5';

            % Create Q5Slider
            app.Q5Slider = uislider(app.QTab);
            app.Q5Slider.ValueChangingFcn = @(src,event) SendJoints(app,app.Q5Slider,5,app.System.UR3);
            app.Q5Slider.Limits = [-6.28319 6.28319];
            app.Q5Slider.Position = [77 90 180 3];

            % Create Q2SliderLabel
            app.Q2SliderLabel = uilabel(app.QTab);
            app.Q2SliderLabel.HorizontalAlignment = 'right';
            app.Q2SliderLabel.Position = [21 198 25 22];
            app.Q2SliderLabel.Text = 'Q2';

            % Create Q2Slider
            app.Q2Slider = uislider(app.QTab);
            app.Q2Slider.ValueChangingFcn = @(src,event) SendJoints(app,app.Q2Slider,2,app.System.UR3);
            app.Q2Slider.Limits = [-6.28319 6.28319];
            app.Q2Slider.Position = [77 220 180 3];

            % Create Q3SliderLabel
            app.Q3SliderLabel = uilabel(app.QTab);
            app.Q3SliderLabel.HorizontalAlignment = 'right';
            app.Q3SliderLabel.Position = [21 157 25 22];
            app.Q3SliderLabel.Text = 'Q3';

            % Create Q3Slider
            app.Q3Slider = uislider(app.QTab);
            app.Q3Slider.ValueChangingFcn = @(src,event) SendJoints(app,app.Q3Slider,3,app.System.UR3);
            app.Q3Slider.Limits = [-6.28319 6.28319];
            app.Q3Slider.Position = [77 179 180 3];

            % Create Q6SliderLabel
            app.Q6SliderLabel = uilabel(app.QTab);
            app.Q6SliderLabel.HorizontalAlignment = 'right';
            app.Q6SliderLabel.Position = [21 21 25 22];
            app.Q6SliderLabel.Text = 'Q6';

            % Create Q6Slider
            app.Q6Slider = uislider(app.QTab);
            app.Q6Slider.Limits = [-6.28319 6.28319];
            app.Q6Slider.ValueChangingFcn = @(src,event) SendJoints(app,app.Q6Slider,6,app.System.UR3);
            app.Q6Slider.Position = [77 43 180 3];


            %% Q values lable
            % Create Label
            app.Label = uilabel(app.QTab);
            app.Label.Position = [286 251 34 22];

            % Create Label_2
            app.Label_2 = uilabel(app.QTab);
            app.Label_2.Position = [286 210 34 22];

            % Create Label_3
            app.Label_3 = uilabel(app.QTab);
            app.Label_3.Position = [286 169 34 22];

            % Create Label_4
            app.Label_4 = uilabel(app.QTab);
            app.Label_4.Position = [286 121 34 22];

            % Create Label_5
            app.Label_5 = uilabel(app.QTab);
            app.Label_5.Position = [286 80 34 22];

            % Create Label_6
            app.Label_6 = uilabel(app.QTab);
            app.Label_6.Position = [286 33 34 22];


            % Create StatusLamp
            app.StatusLamp = uilamp(app.UR3Tab);
            app.StatusLamp.Position = [301 332 62 62];

            %% TM12
            % Create TM12Tab
            app.TM12Tab = uitab(app.TabGroup);
            app.TM12Tab.Title = 'TM12';

            % Create Image_3
            app.Image_3 = uiimage(app.TM12Tab);
            app.Image_3.ImageSource = "TM12.png"
            app.Image_3.Position = [16 310 94 107];

            % Create TM12Label
            app.TM12Label = uilabel(app.TM12Tab);
            app.TM12Label.HorizontalAlignment = 'center';
            app.TM12Label.FontSize = 24;
            app.TM12Label.FontWeight = 'bold';
            app.TM12Label.Position = [166 340 77 47];
            app.TM12Label.Text = 'TM12';

            % Create TabGroup2_2
            app.TabGroup2_2 = uitabgroup(app.TM12Tab);
            app.TabGroup2_2.Position = [14 14 356 297];

            % Create XYZTab_2
            app.XYZTab_2 = uitab(app.TabGroup2_2);
            app.XYZTab_2.Title = 'XYZ';

            % Create XEditField_2Label
            app.XEditField_2Label = uilabel(app.XYZTab_2);
            app.XEditField_2Label.HorizontalAlignment = 'right';
            app.XEditField_2Label.Position = [43 241 25 22];
            app.XEditField_2Label.Text = 'X';

            % Create XEditField_2
            app.XEditField_2 = uieditfield(app.XYZTab_2, 'numeric');
            app.XEditField_2.Position = [132 239 100 22];

            % Create YEditField_2Label
            app.YEditField_2Label = uilabel(app.XYZTab_2);
            app.YEditField_2Label.HorizontalAlignment = 'right';
            app.YEditField_2Label.Position = [43 209 25 22];
            app.YEditField_2Label.Text = 'Y';

            % Create YEditField_2
            app.YEditField_2 = uieditfield(app.XYZTab_2, 'numeric');
            app.YEditField_2.Position = [132 209 100 22];

            % Create ZEditField_2Label
            app.ZEditField_2Label = uilabel(app.XYZTab_2);
            app.ZEditField_2Label.HorizontalAlignment = 'right';
            app.ZEditField_2Label.Position = [43 178 25 22];
            app.ZEditField_2Label.Text = 'Z';

            % Create ZEditField_2
            app.ZEditField_2 = uieditfield(app.XYZTab_2, 'numeric');
            app.ZEditField_2.Position = [132 178 100 22];

            % Create RollEditField_2Label
            app.RollEditField_2Label = uilabel(app.XYZTab_2);
            app.RollEditField_2Label.HorizontalAlignment = 'right';
            app.RollEditField_2Label.Position = [43 156 26 22];
            app.RollEditField_2Label.Text = 'Roll';

            % Create RollEditField_2
            app.RollEditField_2 = uieditfield(app.XYZTab_2, 'numeric');
            app.RollEditField_2.Position = [132 150 100 22];

            % Create PitchEditField_2Label
            app.PitchEditField_2Label = uilabel(app.XYZTab_2);
            app.PitchEditField_2Label.HorizontalAlignment = 'right';
            app.PitchEditField_2Label.Position = [40 125 32 22];
            app.PitchEditField_2Label.Text = 'Pitch';

            % Create PitchEditField_2
            app.PitchEditField_2 = uieditfield(app.XYZTab_2, 'numeric');
            app.PitchEditField_2.Position = [132 120 100 22];

            % Create YawEditField_2Label
            app.YawEditField_2Label = uilabel(app.XYZTab_2);
            app.YawEditField_2Label.HorizontalAlignment = 'right';
            app.YawEditField_2Label.Position = [45 92 27 22];
            app.YawEditField_2Label.Text = 'Yaw';

            % Create YawEditField_2
            app.YawEditField_2 = uieditfield(app.XYZTab_2, 'numeric');
            app.YawEditField_2.Position = [132 89 100 22];

            % Create Button_13
            app.Button_13 = uibutton(app.XYZTab_2, 'push');
            app.Button_13.Position = [234 238 25 23];
            app.Button_13.ButtonPushedFcn = @(src,event) AdjustCartasian(app,1,0.1,app.System.TM12);
            app.Button_13.Text = '+';

            % Create Button_14
            app.Button_14 = uibutton(app.XYZTab_2, 'push');
            app.Button_14.Position = [234 209 25 23];
            app.Button_14.ButtonPushedFcn = @(src,event) AdjustCartasian(app,2,0.1,app.System.TM12);
            app.Button_14.Text = '+';

            % Create Button_15
            app.Button_15 = uibutton(app.XYZTab_2, 'push');
            app.Button_15.Position = [234 178 25 23];
            app.Button_15.ButtonPushedFcn = @(src,event) AdjustCartasian(app,3,0.1,app.System.TM12);
            app.Button_15.Text = '+';

            % Create Button_16
            app.Button_16 = uibutton(app.XYZTab_2, 'push');
            app.Button_16.Position = [234 150 25 23];
            app.Button_16.ButtonPushedFcn = @(src,event) AdjustCartasian(app,4,0.1,app.System.TM12);
            app.Button_16.Text = '+';

            % Create Button_17
            app.Button_17 = uibutton(app.XYZTab_2, 'push');
            app.Button_17.Position = [234 118 25 23];
            app.Button_17.ButtonPushedFcn = @(src,event) AdjustCartasian(app,5,0.1,app.System.TM12);
            app.Button_17.Text = '+';

            % Create Button_18
            app.Button_18 = uibutton(app.XYZTab_2, 'push');
            app.Button_18.Position = [234 89 25 23];
            app.Button_18.ButtonPushedFcn = @(src,event) AdjustCartasian(app,6,0.1,app.System.TM12);
            app.Button_18.Text = '+';

            % Create Label2_7
            app.Label2_7 = uilabel(app.XYZTab_2);
            app.Label2_7.Position = [281 241 41 22];
            app.Label2_7.Text = 'Label2';

            % Create Label2_8
            app.Label2_8 = uilabel(app.XYZTab_2);
            app.Label2_8.Position = [281 209 41 22];
            app.Label2_8.Text = 'Label2';

            % Create Label2_9
            app.Label2_9 = uilabel(app.XYZTab_2);
            app.Label2_9.Position = [281 178 41 22];
            app.Label2_9.Text = 'Label2';

            % Create Label2_10
            app.Label2_10 = uilabel(app.XYZTab_2);
            app.Label2_10.Position = [281 150 41 22];
            app.Label2_10.Text = 'Label2';

            % Create Label2_11
            app.Label2_11 = uilabel(app.XYZTab_2);
            app.Label2_11.Position = [282 120 41 22];
            app.Label2_11.Text = 'Label2';

            % Create Label2_12
            app.Label2_12 = uilabel(app.XYZTab_2);
            app.Label2_12.Position = [281 91 41 22];
            app.Label2_12.Text = 'Label2';

            % Create Button_19
            app.Button_19 = uibutton(app.XYZTab_2, 'push');
            app.Button_19.Position = [106 238 25 23];
            app.Button_19.ButtonPushedFcn = @(src,event) AdjustCartasian(app,1,-0.1,app.System.TM12);
            app.Button_19.Text = '-';

            % Create Button_20
            app.Button_20 = uibutton(app.XYZTab_2, 'push');
            app.Button_20.Position = [106 209 25 23];
            app.Button_20.ButtonPushedFcn = @(src,event) AdjustCartasian(app,2,-0.1,app.System.TM12);
            app.Button_20.Text = '-';

            % Create Button_21
            app.Button_21 = uibutton(app.XYZTab_2, 'push');
            app.Button_21.Position = [106 178 25 23];
            app.Button_21.ButtonPushedFcn = @(src,event) AdjustCartasian(app,3,-0.1,app.System.TM12);
            app.Button_21.Text = '-';

            % Create Button_22
            app.Button_22 = uibutton(app.XYZTab_2, 'push');
            app.Button_22.Position = [106 150 25 23];
            app.Button_22.ButtonPushedFcn = @(src,event) AdjustCartasian(app,4,-0.1,app.System.TM12);
            app.Button_22.Text = '-';

            % Create Button_23
            app.Button_23 = uibutton(app.XYZTab_2, 'push');
            app.Button_23.Position = [106 118 25 23];
            app.Button_23.ButtonPushedFcn = @(src,event) AdjustCartasian(app,5,-0.1,app.System.TM12);
            app.Button_23.Text = '-';

            % Create Button_24
            app.Button_24 = uibutton(app.XYZTab_2, 'push');
            app.Button_24.Position = [106 89 25 23];
            app.Button_20.ButtonPushedFcn = @(src,event) AdjustCartasian(app,6,-0.1,app.System.TM12);
            app.Button_24.Text = '-';

            % Create EnterButton_2
            app.EnterButton_2 = uibutton(app.XYZTab_2, 'push');
            app.EnterButton_2.Position = [132 59 100 23];
            app.EnterButton_2.ButtonPushedFcn = @(src,event) SendPos(app,app.System.TM12)
            app.EnterButton_2.Text = 'Enter';

            % Create QTab_2
            app.QTab_2 = uitab(app.TabGroup2_2);
            app.QTab_2.Title = 'Q';

            % Create Q1Slider_2Label
            app.Q1Slider_2Label = uilabel(app.QTab_2);
            app.Q1Slider_2Label.HorizontalAlignment = 'right';
            app.Q1Slider_2Label.Position = [23 248 25 22];
            app.Q1Slider_2Label.Text = 'Q1';

            % Create Q1Slider_2
            app.Q1Slider_2 = uislider(app.QTab_2);
            app.Q1Slider_2.Position = [79 261 150 3];
            app.Q1Slider_2.Limits = [-6.28319 6.28319];
            app.Q1Slider_2.ValueChangingFcn = @(src,event) SendJoints(app,app.Q1Slider_2,1,app.System.TM12);

            % Create Q4Slider_2Label
            app.Q4Slider_2Label = uilabel(app.QTab_2);
            app.Q4Slider_2Label.HorizontalAlignment = 'right';
            app.Q4Slider_2Label.Position = [21 111 25 22];
            app.Q4Slider_2Label.Text = 'Q4';

            % Create Q4Slider_2
            app.Q4Slider_2 = uislider(app.QTab_2);
            app.Q4Slider_2.Limits = [-6.28319 6.28319];
            app.Q4Slider_2.ValueChangingFcn = @(src,event) SendJoints(app,app.Q4Slider_2,4,app.System.TM12);
            app.Q4Slider_2.Position = [77 133 150 3];

            % Create Q5Slider_2Label
            app.Q5Slider_2Label = uilabel(app.QTab_2);
            app.Q5Slider_2Label.HorizontalAlignment = 'right';
            app.Q5Slider_2Label.Position = [21 68 25 22];
            app.Q5Slider_2Label.Text = 'Q5';

            % Create Q5Slider_2
            app.Q5Slider_2 = uislider(app.QTab_2);
            app.Q5Slider_2.Limits = [-6.28319 6.28319];
            app.Q5Slider_2.ValueChangingFcn = @(src,event) SendJoints(app,app.Q5Slider_2,5,app.System.TM12);
            app.Q5Slider_2.Position = [77 90 150 3];

            % Create Q2Slider_2Label
            app.Q2Slider_2Label = uilabel(app.QTab_2);
            app.Q2Slider_2Label.HorizontalAlignment = 'right';
            app.Q2Slider_2Label.Position = [21 198 25 22];
            app.Q2Slider_2Label.Text = 'Q2';

            % Create Q2Slider_2
            app.Q2Slider_2 = uislider(app.QTab_2);
            app.Q2Slider_2.Limits = [-6.28319 6.28319];
            app.Q2Slider_2.ValueChangingFcn = @(src,event) SendJoints(app,app.Q2Slider_2,2,app.System.TM12);
            app.Q2Slider_2.Position = [77 220 150 3];

            % Create Q3Slider_2Label
            app.Q3Slider_2Label = uilabel(app.QTab_2);
            app.Q3Slider_2Label.HorizontalAlignment = 'right';
            app.Q3Slider_2Label.Position = [21 157 25 22];
            app.Q3Slider_2Label.Text = 'Q3';

            % Create Q3Slider_2
            app.Q3Slider_2 = uislider(app.QTab_2);
            app.Q3Slider_2.Limits = [-6.28319 6.28319];
            app.Q3Slider_2.ValueChangingFcn = @(src,event) SendJoints(app,app.Q3Slider_2,3,app.System.TM12);
            app.Q3Slider_2.Position = [77 179 150 3];

            % Create Q6Slider_2Label
            app.Q6Slider_2Label = uilabel(app.QTab_2);
            app.Q6Slider_2Label.HorizontalAlignment = 'right';
            app.Q6Slider_2Label.Position = [21 21 25 22];
            app.Q6Slider_2Label.Text = 'Q6';

            % Create Q6Slider_2
            app.Q6Slider_2 = uislider(app.QTab_2);
            app.Q6Slider_2.Limits = [-6.28319 6.28319];
            app.Q6Slider_2.ValueChangingFcn = @(src,event) SendJoints(app,app.Q6Slider_2,6,app.System.TM12);
            app.Q6Slider_2.Position = [77 43 150 3];

            % Create Label_7
            app.Label_7 = uilabel(app.QTab_2);
            app.Label_7.Position = [286 251 34 22];

            % Create Label_8
            app.Label_8 = uilabel(app.QTab_2);
            app.Label_8.Position = [286 210 34 22];

            % Create Label_9
            app.Label_9 = uilabel(app.QTab_2);
            app.Label_9.Position = [286 169 34 22];

            % Create Label_10
            app.Label_10 = uilabel(app.QTab_2);
            app.Label_10.Position = [286 121 34 22];

            % Create Label_11
            app.Label_11 = uilabel(app.QTab_2);
            app.Label_11.Position = [286 80 34 22];

            % Create Label_12
            app.Label_12 = uilabel(app.QTab_2);
            app.Label_12.Position = [286 33 34 22];

            % Create StatusLamp_2
            app.StatusLamp_2 = uilamp(app.TM12Tab);
            app.StatusLamp_2.Position = [301 332 62 62];

            % Create LogTab
            app.LogTab = uitab(app.TabGroup);
            app.LogTab.Title = 'Log';

            % Create HomeRobotsButton
            app.HomeRobotsButton = uibutton(app.UIFigure, 'push');
            %app.HomeRobotsButton.ButtonPushedFcn = createCallbackFcn(app, @HomeRobotsButtonPushed, true);
            app.HomeRobotsButton.Position = [272 487 100 23];
            app.HomeRobotsButton.ButtonPushedFcn = @(src,event) HomeRobots(app)
            app.HomeRobotsButton.Text = 'Home Robots';

            % Create ShowCollidersButton_2
            % app.ShowCollidersButton_2 = uibutton(app.UIFigure, 'push');
            % app.ShowCollidersButton_2.Position = [144 487 100 23];
            % app.ShowCollidersButton_2.ButtonPushedFcn = @(src,event) ShowColliders(app)
            % app.ShowCollidersButton_2.Text = 'Show Colliders';
            

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = NewGUITest(System)
            app.System = System;
            % Create UIFigure and components
            createComponents(app);


            if nargout == 0
                clear app
            end
        end
    end
end