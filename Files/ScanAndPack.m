classdef ScanAndPack
    %This class builds the brick wall, controling animations and trajectories
    %of the robots
    methods
        function self = ScanAndPack(LinUR3,LinUR5, Items,PackLocations,Claw)
            steps = 100;
            brick = bricks;
            ScanPos = [] %Pos of scan itme
            qPick = [-1.53589,1.27409,0.3944444,0,1.507964,0]; %To pick item up
            qScan = [] %q values to scan item
            qPlace = [] %q vlaues to place item
            for x = 1 : 9
                %% Fetch Item to Scan And Item to Pack
                %Update UI
                CreateUI.UpdateStatus('Fetching Item')

                %DoBotGet
                BrickPosUR3 = brick.brickModel{x}.base.T;
                UR3q = LinUR3.model.ikcon(BrickPosUR3* trotx(pi));
                FetchBrickUR3 = jtraj(LinUR3.model.getpos,UR3q,steps);
                CreateUI.UpdateUI(UR3q,LinUR3);

                %Animate Movemnet

                %DoBotScanItem

                %Animate Movemnet

                %Loop for rest
                if brick.brickCount > 9

                    %DoBotGet

                    %OtherBotGetScannedItem + 1

                    %Anaimate Movements

                    


                    %UR5 Traj to Brick
                    BrickPosUR5 = brick.brickModel{x + 8}.base.T;
                    UR5q = LinUR5.model.ikcon(BrickPosUR5 * trotx(pi),[-0.176,0.541052,0.715585,-1.81514,-0.750492,1.69297,0]);
                    FetchBrickUR5 = jtraj(LinUR5.model.getpos,UR5q,steps);

                    for i = 1:steps
                        %Animate UR3 and UR5
                        LinUR5.model.animate(FetchBrickUR5(i,:));
                        LinUR3.model.animate(FetchBrickUR3(i,:));
                        LinUR3.model.fkine(LinUR3.model.getpos()).t;
                        Claw.ClawBase(Claw,SE3(transl(4,4,4)))
                        CreateUI.UpdateCurrent(UR3q,LinUR3);
                        drawnow()
                    end
                else
                    for i = 1:steps
                        %Animate only UR3
                        LinUR3.model.animate(FetchBrickUR3(i,:));
                        CreateUI.UpdateCurrent(UR3q,LinUR3);
                        Claw.ClawBase(Claw,SE3(transl(2,2,2)))
                        drawnow()
                    end
                    Claw.ClawBase(Claw,SE3(transl(LinUR3.model.fkine(LinUR3.model.getpos()))))
                    Claw.CloseClaw(Claw);

                    %Move UR3 to "home" position
                    home = jtraj(LinUR3.model.getpos,[-0.6,0,0,0,pi/2,pi/2,pi/2],steps);
                    for i = 1:steps
                        brick.brickModel{x}.base = LinUR3.model.fkine(LinUR3.model.getpos());
                        brick.brickModel{x}.animate(0);
                        LinUR3.model.animate(home(i,:));
                        drawnow()
                    end
                end

                %% Place Brick
                %Update UI
                CreateUI.UpdateStatus('Placing Brick')

                if brick.brickCount > 9
                    UR3WallSpot = Wall.Wallpos{1 + 2*x -2}.base.T
                    UR5WallSpot = Wall.Wallpos{x * 2}.base.T;

                    %UR3 Traj to Wall   
                    UR3Goalq = LinUR3.model.ikcon(UR3WallSpot* trotx(pi),q0);
                    PlaceBrickUR3 = jtraj(LinUR3.model.getpos,UR3Goalq,steps);
                    CreateUI.UpdateUI(UR3Goalq,LinUR3);

                    %UR5 Traj to Wall          
                    UR5Goalq = LinUR5.model.ikcon(UR5WallSpot * trotx(pi),[0,1.53589,1.11701,-1.0472,-0.628319,1.50098,0]);
                    PlaceBrickUR5 = jtraj(LinUR5.model.getpos,UR5Goalq,steps);

                    for i = 1:steps
                        %Animate UR5 & UR3
                        brick.brickModel{x + 8}.base = LinUR5.model.fkine(LinUR5.model.getpos());
                        brick.brickModel{x + 8}.animate(0);
                        LinUR5.model.animate(PlaceBrickUR5(i,:));

                        brick.brickModel{x}.base = LinUR3.model.fkine(LinUR3.model.getpos());
                        brick.brickModel{x}.animate(0);
                        LinUR3.model.animate(PlaceBrickUR3(i,:));
                        CreateUI.UpdateCurrent(UR3Goalq,LinUR3);
                        drawnow()
                    end

                else
                    %UR3 Traj to Wall
                    UR3WallSpot = Wall.Wallpos{x}.base.T
                    UR3Goalq = LinUR3.model.ikcon(UR3WallSpot* trotx(pi),q0);
                    PlaceBrickUR3 = jtraj(LinUR3.model.getpos,UR3Goalq,steps);
                    CreateUI.UpdateUI(UR3Goalq,LinUR3);
                    for i = 1:steps
                        %Animate only UR3

                        brick.brickModel{x}.base = LinUR3.model.fkine(LinUR3.model.getpos());
                        brick.brickModel{x}.animate(0);
                        LinUR3.model.animate(PlaceBrickUR3(i,:));
                        CreateUI.UpdateCurrent(UR3Goalq,LinUR3);
                        drawnow()
                    end


                end

                Claw.ClawBase(Claw,SE3(transl(LinUR3.model.fkine(LinUR3.model.getpos()))))
                Claw.OpenClaw(Claw);

                %Move UR3 to "home" position
                home = jtraj(LinUR3.model.getpos,[-0.6,0,0,0,pi/2,pi/2,pi/2],steps);
                for i = 1:steps
                    CreateUI.UpdateUI([-0.6,0,0,0,pi/2,pi/2,pi/2],LinUR3);
                    LinUR3.model.animate(home(i,:));
                    drawnow()
                end
            end
            %Move UR3 to "home" position
            CreateUI.UpdateStatus('Home')
            home = jtraj(LinUR3.model.getpos,[-0.6,0,0,0,pi/2,pi/2,pi/2],steps);
            for i = 1:steps
                CreateUI.UpdateUI([-0.6,0,0,0,pi/2,pi/2,pi/2],LinUR3);
                LinUR3.model.animate(home(i,:));
                drawnow()
            end
        end
    end
end

