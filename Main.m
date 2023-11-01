classdef Main
    %MAIN 
    %Main stores global vars and is the class called when starting the
    %system
    properties
        UR3
        TM12
        ExtraUR3
        gui
    end

    methods
        function self = Main
            hold on
            NewGUITest;
            clc;
            %self.gui.UpdateSystemStatus(self.gui.SystemStatusUI,self.gui.StatsBox, "Booting Up", [200,200,0]) 
            BuildEnvironment;
 
            [self.UR3 self.TM12, self.ExtraUR3] = BuildEnvironment.SpawnRobots;
            Colliders = CollisionControl(self);
            % CollisionControl.RobotCollisionCheck(self.UR3,col)
            self.gui = GUI(self,Colliders);
           % self.gui.UpdateSystemStatus(self.gui.SystemStatusUI,self.gui.StatsBox,"System Ready", [0,255,0])
        end
        
    end
end

