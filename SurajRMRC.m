classdef SurajRMRC
    %BENSRMCR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ScannedPos = [-1.2,0,0.9];
        NumberOfItems = 9;
        Steps = 50;
    end
    
    methods
        function self = SurajRMRC(dob,tm,Items,EndPositions,Colliders)
            
            % DoBotFectQG = [0.4642576,-0.2513274,0.628319,-2.00713,-1.633628,0];
            % DoBotPlaceQG = [-3.76991,-0.122173,0.628319,-1.88496,1.633628,0];
            % 
            % TM12GrabQG = [-1.6057,0.942478,-1.95477,0.942478,1.382301,0];
            % TM12PlaceQG = [-1.036726,0.942478, -1.95477,0.942478,1.382301,0];
            % 
            % for x = 1:self.NumberOfItems
            %     %Dobot fetch Item
            % 
            %     ItemPos = Items.ItemPos{x}.base.T;
            %     FetchItemQ = DoBot.model.ikcon(ItemPos * trotx(pi),DoBotFectQG);
            %     FetchItem = jtraj(DoBot.model.getpos,FetchItemQ,self.Steps);
            % 
            %     %Animate Dobot getting Item
            %     for i = 1:self.Steps
            %         CollisionControl.RobotCollisionCheck(DoBot,Colliders);
            %         DoBot.model.animate(FetchItem(i,:));
            %         drawnow();
            %     end
            % 
            %     %DobotScan
            %     %DoBot move item to TM12 collection point
            %     ScannedSE2 = SE3(transl(self.ScannedPos) * trotx(pi) * transl(0.2,0,0));
            %     ScannedSE1 = SE3(transl(self.ScannedPos));
            % 
            %     ScannedQDo = DoBot.model.ikcon(ScannedSE1,DoBotPlaceQG);
            %     ScanItem = jtraj(DoBot.model.getpos,ScannedQDo,self.Steps);
            % 
            %     %TM12 move to collection point
            %     ScannedQTM = TM12.model.ikcon(ScannedSE2,TM12GrabQG);
            %     TMCollect = jtraj(TM12.model.getpos,ScannedQTM,self.Steps);
            % 
            %     for i = 1:self.Steps
            %         Items.ItemPos{x}.base = DoBot.model.fkine(DoBot.model.getpos());
            %         Items.ItemPos{x}.animate(0);
            %         CollisionControl.RobotCollisionCheck(DoBot,Colliders);
            %         CollisionControl.RobotCollisionCheck(TM12,Colliders);
            %         DoBot.model.animate(ScanItem(i,:));
            %         TM12.model.animate(TMCollect(i,:));
            %         drawnow()
            %     end
            % 
            %     %TM12 to EndPoint
            %     EndPosLocation = EndPositions.EndPos{x}.base.T
            %     EndPosq = TM12.model.ikcon((EndPosLocation * trotx(pi)) ,TM12PlaceQG);
            %     PackItem = jtraj(TM12.model.getpos,EndPosq,self.Steps);
            % 
            %     %Animate Dobot getting Item
            %     for i = 1:self.Steps
            %         Items.ItemPos{x}.base = TM12.model.fkine(TM12.model.getpos());
            %         Items.ItemPos{x}.animate(0);
            %         CollisionControl.RobotCollisionCheck(TM12,Colliders);
            %         TM12.model.animate(PackItem(i,:));
            %         drawnow()
            %     end
                
                % Suraj's code starts from here



steps = 50;

%% Gripper
leftGripper = TwoFGripper;
rightGripper = TwoFGripper;

% Gripper joint values
qGrip0 = [0, 0.8727, 0];
qOpen = [0 0.5236 0.3491];
qMid = [0 0.8727 0];
qTight = [0 1.2217 -0.3491];
qFullyClosed = [0 1.6581 -0.7854];

% Gripper open and close tajectories
grab = jtraj(qOpen, qMid, steps);
release = jtraj(qMid, qOpen, steps);

%%
%Starting locations in items pos

                pickLocations =[[-1.7,0.2,0.8];
                                [-1.8,0.2,0.8];
                                [-1.9,0.2,0.8];
                                [-1.7,0.1,0.8];
                                [-1.8,0.1,0.8];
                                [-1.9,0.1,0.8];
                                ];

                % Good starting points
           % self.ItemPos{1}.base =  transl(-1.7,0.2,0.8);
           % self.ItemPos{2}.base =  transl(-1.8,0.2,0.8);
           % self.ItemPos{3}.base =  transl(-1.9,0.2,0.8);
           % self.ItemPos{4}.base =  transl(-1.7,0.1,0.8);
           % self.ItemPos{5}.base =  transl(-1.8,0.1,0.8);
           % self.ItemPos{6}.base =  transl(-1.9,0.1,0.8);


                pickHeight = 0.1;

                %Intermediate Waypoint
                intermediateLocations = zeros(6,3);

                for i = 1:6 
                    intermediateLocations(i,:) = pickLocations(i,:);
                    intermediateLocations(i,3) = intermediateLocations(i,3) + pickHeight;
                end
                
                %Define horizontal trajectory 
                horizDist = 0.4;

                %Passing position of object to TM12
                passLocations = zeros(6,3);

                for i = 1:6
                    passLocations(i,:) = intermediateLocations(i,:);
                    passLocations(i,1) = passLocations(i,1) + horizDist;
                end


                %End Location of item
                placeLocations = [[0,0.8,0.6];
                                [0,0.7,0.6];
                                [0,0.6,0.6];
                                [0.1,0.8,0.6];
                                [0.1,0.7,0.6];
                                [0.1,0.6,0.6];
                                ];
           % self.ItemPos{1}.base =  transl(0,0.8,0.6);
           % self.ItemPos{2}.base =  transl(0,0.7,0.6);
           % self.ItemPos{3}.base =  transl(0,0.6,0.6);
           % self.ItemPos{4}.base =  transl(0.1,0.8,0.6);
           % self.ItemPos{5}.base =  transl(0.1,0.7,0.6);
           % self.ItemPos{6}.base =  transl(0.1,0.6,0.6);
                
    

                % Transforms in passing and placing positions for TM12 jtraj
                passTransforms = zeros(4,4,6);

                for i = 1:6
                    passTransforms(:,:,i) = transl(passLocations(i,:));
                end

                placeTransforms = zeros(4,4,6);

                for i = 1:6
                    placeTransforms(:,:,i) = transl(placeLocations(i,:));
                end

                % Q values for starting and ending TM12 jtraj
                qPass = [-0.8482, 1.5080, 0.4636, -0.1257, -1.3823, 0];
                qPlace = [1.4137, 0.8796, 1.5645, -0.8796, -1.3195, 0];

                qPass1 = tm.model.ikcon(passTransforms(:,:,1),qPass);
                qPass2 = tm.model.ikcon(passTransforms(:,:,2),qPass);
                qPass3 = tm.model.ikcon(passTransforms(:,:,3),qPass);
                qPass4 = tm.model.ikcon(passTransforms(:,:,4),qPass);
                qPass5 = tm.model.ikcon(passTransforms(:,:,5),qPass);
                qPass6 = tm.model.ikcon(passTransforms(:,:,6),qPass);

                qPlace1 = tm.model.ikcon(placeTransforms(:,:,1),qPlace);
                qPlace2 = tm.model.ikcon(placeTransforms(:,:,2),qPlace);
                qPlace3 = tm.model.ikcon(placeTransforms(:,:,3),qPlace);
                qPlace4 = tm.model.ikcon(placeTransforms(:,:,4),qPlace);
                qPlace5 = tm.model.ikcon(placeTransforms(:,:,5),qPlace);
                qPlace6 = tm.model.ikcon(placeTransforms(:,:,6),qPlace);

                % Creating movement trajectories
                
                % Dobot lifting item movement
                doPick1 = getRMRCTrajectory(pickLocations(1,:),intermediateLocations(1,:));
                doPick2 = getRMRCTrajectory(pickLocations(2,:),intermediateLocations(2,:));
                doPick3 = getRMRCTrajectory(pickLocations(3,:),intermediateLocations(3,:));
                doPick4 = getRMRCTrajectory(pickLocations(4,:),intermediateLocations(4,:));
                doPick5 = getRMRCTrajectory(pickLocations(5,:),intermediateLocations(5,:));
                doPick6 = getRMRCTrajectory(pickLocations(6,:),intermediateLocations(6,:));

                % Dobot passing item movement
                doPass1 = getRMRCTrajectory(intermediateLocations(1,:),passLocations(1,:));
                doPass2 = getRMRCTrajectory(intermediateLocations(2,:),passLocations(2,:));
                doPass3 = getRMRCTrajectory(intermediateLocations(3,:),passLocations(3,:));
                doPass4 = getRMRCTrajectory(intermediateLocations(4,:),passLocations(4,:));
                doPass5 = getRMRCTrajectory(intermediateLocations(5,:),passLocations(5,:));
                doPass6 = getRMRCTrajectory(intermediateLocations(6,:),passLocations(6,:));

                % Dobot moving from first passpoint to next item
                doNext1 = getRMRCTrajectory(passLocations(1,:),pickLocations(2,:));
                doNext2 = getRMRCTrajectory(passLocations(2,:),pickLocations(3,:));
                doNext3 = getRMRCTrajectory(passLocations(3,:),pickLocations(4,:));
                doNext4 = getRMRCTrajectory(passLocations(4,:),pickLocations(5,:));
                doNext5 = getRMRCTrajectory(passLocations(5,:),pickLocations(6,:));
                % Maybe need one more here?? 

                %Need to define a joint guess here qPass
                

                % TM12 from pass location to deposit location
                tmToPlace1 = jtraj(tm.model.getpos,tm.model.ikcon(passTransforms(:,:,1)),steps);
                tmPlace1 = jtraj(qPass1,qPlace1,steps);
                tmPlace2 = jtraj(qPass2,qPlace2,steps);
                tmPlace3 = jtraj(qPass3,qPlace3,steps);
                tmPlace4 = jtraj(qPass4,qPlace4,steps);
                tmPlace5 = jtraj(qPass5,qPlace5,steps);
                tmPlace6 = jtraj(qPass6,qPlace6,steps);

                
                %Need to define a joint guess here qPlace
                

                % TM12 from deposit to next item pickup
                tmNext1 = jtraj(qPlace1,qPass2,steps);
                tmNext2 = jtraj(qPlace2,qPass3,steps);
                tmNext3 = jtraj(qPlace3,qPass4,steps);
                tmNext4 = jtraj(qPlace4,qPass5,steps);
                tmNext5 = jtraj(qPlace5,qPass6,steps);
                % Maybe need one more point here?

            
                %% Movement 
                hold on;
                %% First object
                % Dobot to first object
                %%%NEED TO INCLUDE THIS
                % Dobot up
                 for i = 1:steps
                 dob.model.animate(doPick1(i,:));
                 Items.ItemPos{1}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{1}.animate(0);
                 drawnow();   
                 end
                %%
                % Dobot side and TM12 to object
                for i = 1:steps
                 dob.model.animate(doPass1(i,:));
                 tm.model.animate(tmToPlace1(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{1}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{1}.animate(0);
                 drawnow();   
                end
                
                % TM12 Grabbing object
                for i = 1:steps
                    leftGripper.model.animate(grab(i,:));
                    rightGripper.model.animate(grab(i,:));
                    pause(0.01)
                end

                % TM to place and dobot to second object
                for i = 1:steps
                 dob.model.animate(doNext1(i,:));
                 tm.model.animate(tmPlace1(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qMid);
                 rightGripper.model.animate(qMid);
                 Items.ItemPos{1}.base = tm.model.fkine(tm.model.getpos());
                 Items.ItemPos{1}.animate(0);
                 drawnow();   
                end

                % TM12 to release object
                for i = 1:steps
                    leftGripper.model.animate(release(i,:));
                    rightGripper.model.animate(release(i,:));
                    pause(0.01)
                end

                %% Second object
                % Dobot up
                for i = 1:steps  
                 dob.model.animate(doPick2(i,:));
                 Items.ItemPos{2}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{2}.animate(0);
                 drawnow();   
                end

                % Dobot side and TM12 to object
                for i = 1:steps
                 dob.model.animate(doPass2(i,:));
                 tm.model.animate(tmNext1(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{2}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{2}.animate(0);
                 drawnow();   
                end

                % TM12 Grabbing object
                for i = 1:steps
                    leftGripper.model.animate(grab(i,:));
                    rightGripper.model.animate(grab(i,:));
                    pause(0.01)
                end
                
                % TM to place and dobot to third object
                for i = 1:steps
                 dob.model.animate(doNext2(i,:));
                 tm.model.animate(tmPlace2(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qMid);
                 rightGripper.model.animate(qMid);
                 Items.ItemPos{2}.base = tm.model.fkine(tm.model.getpos());
                 Items.ItemPos{2}.animate(0);
                 drawnow();   
                end

                % TM12 to release object
                 for i = 1:steps
                    leftGripper.model.animate(release(i,:));
                    rightGripper.model.animate(release(i,:));
                    pause(0.01)
                end

                %% Third object

                % Dobot up
                for i = 1:steps 
                 dob.model.animate(doPick3(i,:));
                 Items.ItemPos{3}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{3}.animate(0);
                 drawnow();   
                end

                % Dobot side and TM12 to object
                for i = 1:steps
                 dob.model.animate(doPass3(i,:));
                 tm.model.animate(tmNext2(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{3}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{3}.animate(0);
                 drawnow();   
                end

                % TM12 Grabbing object
                for i = 1:steps
                    leftGripper.model.animate(grab(i,:));
                    rightGripper.model.animate(grab(i,:));
                    pause(0.01)
                end

                % TM to place and dobot to fourth object
                for i = 1:steps
                 dob.model.animate(doNext3(i,:));
                 tm.model.animate(tmPlace3(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qMid);
                 rightGripper.model.animate(qMid);
                 Items.ItemPos{3}.base = tm.model.fkine(tm.model.getpos());
                 Items.ItemPos{3}.animate(0);
                 drawnow();   
                end

                 % TM12 to release object
                for i = 1:steps
                    leftGripper.model.animate(release(i,:));
                    rightGripper.model.animate(release(i,:));
                    pause(0.01)
                end

                %% Fourth object

                % Dobot up
                for i = 1:steps    
                 dob.model.animate(doPick4(i,:)); 
                 drawnow();
                 Items.ItemPos{4}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{4}.animate(0);
                end

                % Dobot side and TM12 to object
                for i = 1:steps
                 dob.model.animate(doPass4(i,:));
                 tm.model.animate(tmNext3(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{4}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{4}.animate(0);
                 drawnow();   
                end

                % TM12 Grabbing object
                for i = 1:steps
                    leftGripper.model.animate(grab(i,:));
                    rightGripper.model.animate(grab(i,:));
                    pause(0.01)
                end

                % TM to place and dobot to fifth object
                for i = 1:steps
                 dob.model.animate(doNext4(i,:));
                 tm.model.animate(tmPlace4(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qMid);
                 rightGripper.model.animate(qMid);
                 Items.ItemPos{4}.base = tm.model.fkine(tm.model.getpos());
                 Items.ItemPos{4}.animate(0);
                 drawnow();   
                end

                 % TM12 to release object
                for i = 1:steps
                    leftGripper.model.animate(release(i,:));
                    rightGripper.model.animate(release(i,:));
                    pause(0.01)
                end
                
                %% Fifth object
                % Dobot up
                for i = 1:steps   
                 dob.model.animate(doPick5(i,:));
                 Items.ItemPos{5}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{5}.animate(0);
                 drawnow();   
                 end

                % Dobot side and TM12 to object
                for i = 1:steps
                 dob.model.animate(doPass5(i,:));
                 tm.model.animate(tmNext4(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{5}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{5}.animate(0);
                 drawnow();   
                end

                % TM12 Grabbing object
                for i = 1:steps
                    leftGripper.model.animate(grab(i,:));
                    rightGripper.model.animate(grab(i,:));
                    pause(0.01)
                end

                % TM to place and dobot to sixth object
                for i = 1:steps
                 dob.model.animate(doNext5(i,:));
                 tm.model.animate(tmPlace5(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qMid);
                 rightGripper.model.animate(qMid);
                 Items.ItemPos{5}.base = tm.model.fkine(tm.model.getpos());
                 Items.ItemPos{5}.animate(0);
                 drawnow();   
                end
                
                 % TM12 to release object
                for i = 1:steps
                    leftGripper.model.animate(release(i,:));
                    rightGripper.model.animate(release(i,:));
                    pause(0.01)
                end
                %% Sixth object
                % Dobot up
                for i = 1:steps
                 dob.model.animate(doPick6(i,:));
                 Items.ItemPos{6}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{6}.animate(0);
                 drawnow();   
                 end

                % Dobot side and TM12 to object
                for i = 1:steps
                 dob.model.animate(doPass6(i,:));
                 tm.model.animate(tmNext5(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{6}.base = dob.model.fkine(dob.model.getpos());
                 Items.ItemPos{6}.animate(0);
                 drawnow();   
                end
                
                % TM12 Grabbing object
                for i = 1:steps
                    leftGripper.model.animate(grab(i,:));
                    rightGripper.model.animate(grab(i,:));
                    pause(0.01)
                end

                % TM to place sixth object
                for i = 1:steps
                 tm.model.animate(tmPlace6(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qMid);
                 rightGripper.model.animate(qMid);
                 Items.ItemPos{6}.base = tm.model.fkine(tm.model.getpos());
                 Items.ItemPos{6}.animate(0);
                 drawnow();   
                end
             
                  % TM12 to release object
                for i = 1:steps
                    leftGripper.model.animate(release(i,:));
                    rightGripper.model.animate(release(i,:));
                    pause(0.01)
                end



            %End of function program is
            end


        end
        
    end
% end

