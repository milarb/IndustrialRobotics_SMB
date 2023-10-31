classdef BensRMCR
    %BENSRMCR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ScannedPos = [-1.2,0,0.9];
        NumberOfItems = 9;
        Steps = 150;
    end
    
    methods
        function self = BensRMCR(DoBot,TM12,Items,EndPositions)
            
            DoBotFectQG = [0.4642576,-0.2513274,0.628319,-2.00713,-1.633628,0]
            DoBotPlaceQG = [-3.76991,-0.122173,0.628319,-1.88496,1.633628,0]

            TM12GrabQG = [-1.6057,0.942478,-1.95477,0.942478,1.382301,0]
            TM12PlaceQG = [-1.036726,0.942478, -1.95477,0.942478,1.382301,0]
            for x = 1:self.NumberOfItems
                %Dobot fetch Item
                ItemPos = Items.ItemPos{x}.base.T
                FetchItemQ = DoBot.model.ikcon(ItemPos * trotx(pi),DoBotFectQG);
                FetchItem = jtraj(DoBot.model.getpos,FetchItemQ,self.Steps)

                %Animate Dobot getting Item
                for i = 1:self.Steps
                    DoBot.model.animate(FetchItem(i,:));
                    drawnow()
                end

                %DobotScan
                %DoBot move item to TM12 collection point
                ScannedSE2 = SE3(transl(self.ScannedPos) * trotx(pi) * transl(0.2,0,0))
                ScannedSE1 = SE3(transl(self.ScannedPos))

                ScannedQDo = DoBot.model.ikcon(ScannedSE1,DoBotPlaceQG);
                ScanItem = jtraj(DoBot.model.getpos,ScannedQDo,self.Steps)

                %TM12 move to collection point
                ScannedQTM = TM12.model.ikcon(ScannedSE2,TM12GrabQG);
                TMCollect = jtraj(TM12.model.getpos,ScannedQTM,self.Steps)

                for i = 1:self.Steps
                    Items.ItemPos{x}.base = DoBot.model.fkine(DoBot.model.getpos());
                    Items.ItemPos{x}.animate(0);
                    DoBot.model.animate(ScanItem(i,:));
                    TM12.model.animate(TMCollect(i,:));
                    drawnow()
                end

                %TM12 to EndPoint
                EndPosLocation = EndPositions.EndPos{x}.base.T
                EndPosq = TM12.model.ikcon((EndPosLocation * trotx(pi)) ,TM12PlaceQG);
                PackItem = jtraj(TM12.model.getpos,EndPosq,self.Steps)

                %Animate Dobot getting Item
                for i = 1:self.Steps
                    Items.ItemPos{x}.base = TM12.model.fkine(TM12.model.getpos());
                    Items.ItemPos{x}.animate(0);
                    TM12.model.animate(PackItem(i,:));
                    drawnow()
                end


            end


        end
        
    end
end

