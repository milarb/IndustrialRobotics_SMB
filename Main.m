classdef Main
    %MAIN Summary of this class goes here
    %   Detailed explanation goes here
    properties
        SystemRunning;
    end

    methods
        function self = Main
            hold on
            SystemRunning = true;
            gui = GUI(self);
            gui.UpdateSystemStatus(gui.SystemStatusUI,gui.StatsBox, "Booting Up", [200,200,0]) 
            pause(2)%Give time for UI to appear
            BuildEnvironment;
 
            Robots = BuildEnvironment.SpawnRobots;
            CollisionControl(Robots{1},Robots{2},gui);
            gui.UpdateSystemStatus(gui.SystemStatusUI,gui.StatsBox,"System Ready", [0,255,0])


            % while SystemRunning
            % end

            pause;

        end
        
    end
end

