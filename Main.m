classdef Main
    %MAIN 
    %Main stores global vars and is the class called when starting the
    %system
    properties
        SystemRunning;
        UR3
        TM12
        ExtraUR3
        gui
    end

    methods
        function self = Main
            hold on
            SystemRunning = true;
            %self.gui = GUI(self);
            %self.gui.UpdateSystemStatus(self.gui.SystemStatusUI,self.gui.StatsBox, "Booting Up", [200,200,0]) 
            BuildEnvironment;
 
            % [self.UR3 self.TM12, self.ExtraUR3] = BuildEnvironment.SpawnRobots;
            %CollisionControl(self);
            self.gui = GUI(self);
            self.gui.UpdateSystemStatus(self.gui.SystemStatusUI,self.gui.StatsBox,"System Ready", [0,255,0])

        end
        
    end
end

