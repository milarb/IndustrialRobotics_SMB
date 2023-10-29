classdef Main
    %MAIN Summary of this class goes here
    %   Detailed explanation goes here
    properties
        SystemRunning;
        DoBot
        TM12
        gui
    end

    methods
        function self = Main
            hold on
            SystemRunning = true;
            self.gui = GUI(self);
            self.gui.UpdateSystemStatus(self.gui.SystemStatusUI,self.gui.StatsBox, "Booting Up", [200,200,0]) 
            BuildEnvironment;
 
            [self.DoBot self.TM12] = BuildEnvironment.SpawnRobots;
            CollisionControl(self);
            self.gui.UpdateSystemStatus(self.gui.SystemStatusUI,self.gui.StatsBox,"System Ready", [0,255,0])


            % while SystemRunning
            % end

            pause;

        end
        
    end
end

