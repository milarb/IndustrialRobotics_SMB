classdef Gripper
    %GRIPPER Summary of this class goes here
    %   Detailed explanation goes here
    properties (Constant)
        OpenValue = pi/9;
        ClosedValue = pi/4;
        steps = 30
    end

    properties
        Left
        UpperLeft
        Right
        
    end

    methods
        function self = Gripper(basetr)


            [faceData,vertexData] = plyread('cow.ply','tri');
            left1 = Link('d',0,'a',0.1,'alpha',0,'qlim',[-pi pi],'offset', -pi/4);
            left2 = Link('d',0,'a',0.1,'alpha',0,'qlim',[-pi pi],'offset', self.OpenValue);
            self.Left = SerialLink([left1 left2],'name','L');
            %
            % Left.faces = {[], faceData};
            % Left.points = {[], vertexData};

            hold on
            Upperleft1 = Link('d',0.1,'a',0.1,'alpha',0,'qlim',[-pi pi],'offset', -pi/4);
            Upperleft2 = Link('d',0,'a',0.1,'alpha',0,'qlim',[-pi pi],'offset', self.OpenValue);
            self.UpperLeft = SerialLink([Upperleft1 Upperleft2],'name','C')

            right1 = Link('d',0.05,'a',0.1,'alpha',0,'qlim',[-pi pi],'offset', pi/4);
            right2 = Link('d',0,'a',0.1,'alpha',0,'qlim',[-pi pi],'offset', -self.OpenValue);
            self.Right = SerialLink([right1 right2],'name','R');

            workspace = [-2 2 -2 2 0 2];
            scale = 0.5;
            q = zeros(1:2);

            self.Left.plot(q,'workspace',workspace,'scale',scale,'noarrow','nowrist','fps',200);
            self.UpperLeft.plot(q,'workspace',workspace,'scale',scale,'noarrow','nowrist','fps',200);
            self.Right.plot(q,'workspace',workspace,'scale',scale,'noarrow','nowrist','fps',200);

             self.Left.base = basetr;
             self.UpperLeft.base = basetr;
             self.Right.base = basetr;
            axis equal
        end

    end

    methods (Static)
        function ClawBase(Claw,basetr)
            Claw.Left.base = basetr;
            Claw.UpperLeft.base = basetr;
            Claw.Right.base =  basetr;
            CloseLeft = jtraj(Claw.Left.getpos,[0,Gripper.ClosedValue],2);
            CloseRight = jtraj(Claw.Right.getpos,[0,-Gripper.ClosedValue],2);
            for i = 1:2
                Claw.Left.animate(CloseLeft(i,:));
                Claw.UpperLeft.animate(CloseLeft(i,:));
                Claw.Right.animate(CloseRight(i,:));
            end
        end

        function CloseClaw(Claw)

            CloseLeft = jtraj(Claw.Left.getpos,[0,Gripper.ClosedValue],Gripper.steps);
            CloseRight = jtraj(Claw.Right.getpos,[0,-Gripper.ClosedValue],Gripper.steps);

            for i = 1:Gripper.steps
                Claw.Left.animate(CloseLeft(i,:));
                Claw.UpperLeft.animate(CloseLeft(i,:));
                Claw.Right.animate(CloseRight(i,:));
            end
        end

        function OpenClaw(Claw)
            OpenLeft = jtraj(Claw.Left.getpos,[0,Gripper.OpenValue],Gripper.steps);
            OpenRight = jtraj(Claw.Right.getpos,[0,-Gripper.OpenValue],Gripper.steps);
            for i = 1:Gripper.steps

                Claw.Left.animate(OpenLeft(i,:));
                Claw.UpperLeft.animate(OpenLeft(i,:));
                Claw.Right.animate(OpenRight(i,:));
            end
        end
    end
end

