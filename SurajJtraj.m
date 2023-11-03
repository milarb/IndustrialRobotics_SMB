classdef SurajJtraj
    %BENSRMCR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ScannedPos = [-1.2,0,0.9];
        NumberOfItems = 9;
        Steps = 50;
    end
    
    methods
        function self = SurajJtraj(ur,tm,Items,EndPositions,Colliders)


steps = 50;

%% Gripper
leftGripper = TwoFGripper;
rightGripper = TwoFGripper;

leftGripperU = TwoFGripper;
rightGripperU = TwoFGripper;

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


                pickHeight = 0.3;

                %Intermediate Waypoint
                intermediateLocations = zeros(6,3);

                for i = 1:6 
                    intermediateLocations(i,:) = pickLocations(i,:);
                    intermediateLocations(i,3) = intermediateLocations(i,3) + pickHeight;
                end
                
                %Define horizontal trajectory 
                horizDist = 0.5;

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
                
                % Transforms in picking and passing positions for TM12 jtraj
                urPickTransforms = zeros(4,4,6);

                for i = 1:6
                    urPickTransforms(:,:,i) = transl(pickLocations(i,:));
                end

                % Transforms in passing and placing positions for TM12 jtraj
                passTransforms = zeros(4,4,6);

                for i = 1:6
                    passTransforms(:,:,i) = transl(passLocations(i,:));
                end

                placeTransforms = zeros(4,4,6);

                for i = 1:6
                    placeTransforms(:,:,i) = transl(placeLocations(i,:));
                end
                
                % Q Values for starting and ending UR3 jtraj
                qURPick = [-0.6283, -0.7540, 1.1310, -1.5080, -1.8850, 0.1257];
                qURPass = [-1.3823, -1.6336, -1.0053, -1.3823, 1.6336, 0];

                qURPick1 = ur.model.ikcon(urPickTransforms(:,:,1),qURPick);
                qURPick2 = ur.model.ikcon(urPickTransforms(:,:,2),qURPick);
                qURPick3 = ur.model.ikcon(urPickTransforms(:,:,3),qURPick);
                qURPick4 = ur.model.ikcon(urPickTransforms(:,:,4),qURPick);
                qURPick5 = ur.model.ikcon(urPickTransforms(:,:,5),qURPick);
                qURPick6 = ur.model.ikcon(urPickTransforms(:,:,6),qURPick);
                
                qURPass1 = ur.model.ikcon(passTransforms(:,:,1),qURPass);
                qURPass2 = ur.model.ikcon(passTransforms(:,:,2),qURPass);
                qURPass3 = ur.model.ikcon(passTransforms(:,:,3),qURPass);
                qURPass4 = ur.model.ikcon(passTransforms(:,:,4),qURPass);
                qURPass5 = ur.model.ikcon(passTransforms(:,:,5),qURPass);
                qURPass6 = ur.model.ikcon(passTransforms(:,:,6),qURPass);

                % Q values for starting and ending TM12 jtraj
                qPass = [0.5655, 1.6336, 1.6225, -0.2513, -1.3823, 0];
                qPlace = [2.9217, 2.0106, 1.6225, -0.2513, -1.3823, 0];

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

        
                
                %% UR3 Trajectory Generation
                % UR3 pick to pass
                urToPick1 = jtraj(ur.model.getpos,ur.model.ikcon(urPickTransforms(:,:,1)),steps);
                urPick1 = jtraj(qURPick1,qURPass1,steps);
                urPick2 = jtraj(qURPick2,qURPass2,steps);
                urPick3 = jtraj(qURPick3,qURPass3,steps);
                urPick4 = jtraj(qURPick4,qURPass4,steps);
                urPick5 = jtraj(qURPick5,qURPass5,steps);
                urPick6 = jtraj(qURPick6,qURPass6,steps);

                % UR3 pass to next object
                urNext1 = jtraj(qURPass1,qURPick2,steps);
                urNext2 = jtraj(qURPass2,qURPick3,steps);
                urNext3 = jtraj(qURPass3,qURPick4,steps);
                urNext4 = jtraj(qURPass4,qURPick5,steps);
                urNext5 = jtraj(qURPass5,qURPick6,steps);
                
                

                %% Trajectory Generation
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
                % UR to first object
                 for i = 1:steps
                 ur.model.animate(urToPick1(i,:));
                 drawnow();   
                 end

                 % Grab object 1
                %%
                % UR3 to pass and TM12 to object
                for i = 1:steps
                 ur.model.animate(urPick1(i,:));
                 tm.model.animate(tmToPlace1(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{1}.base = ur.model.fkine(ur.model.getpos());
                 Items.ItemPos{1}.animate(0);
                 drawnow();   
                end
                
                % TM12 Grabbing object
                for i = 1:steps
                    leftGripper.model.animate(grab(i,:));
                    rightGripper.model.animate(grab(i,:));
                    pause(0.01)
                end

                % TM to pass and dobot to second object
                for i = 1:steps
                 ur.model.animate(urNext1(i,:));
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
          

                % Dobot to pass and TM12 to object
                for i = 1:steps
                 ur.model.animate(urPick2(i,:));
                 tm.model.animate(tmNext1(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{2}.base = ur.model.fkine(ur.model.getpos());
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
                 ur.model.animate(urNext2(i,:));
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

        
                % Dobot side and TM12 to object
                for i = 1:steps
                 ur.model.animate(urPick3(i,:));
                 tm.model.animate(tmNext2(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{3}.base = ur.model.fkine(ur.model.getpos());
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
                 ur.model.animate(urNext3(i,:));
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

              

                % Dobot side and TM12 to object
                for i = 1:steps
                 ur.model.animate(urPick4(i,:));;
                 tm.model.animate(tmNext3(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{4}.base = ur.model.fkine(ur.model.getpos());
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
                 ur.model.animate(urNext4(i,:));
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
  

                % Dobot side and TM12 to object
                for i = 1:steps
                 ur.model.animate(urPick5(i,:));
                 tm.model.animate(tmNext4(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{5}.base = ur.model.fkine(ur.model.getpos());
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
                 ur.model.animate(urNext5(i,:));
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
                % Dobot side and TM12 to object
                for i = 1:steps
                 ur.model.animate(urPick6(i,:));
                 tm.model.animate(tmNext5(i,:));
                 leftGripper.model.base = tm.model.fkine(tm.model.getpos()).T;
                 rightGripper.model.base = tm.model.fkine(tm.model.getpos()).T * trotz(pi);
                 leftGripper.model.animate(qOpen);
                 rightGripper.model.animate(qOpen);
                 Items.ItemPos{6}.base = ur.model.fkine(ur.model.getpos());
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

