classdef Main
    
    methods
        function self = Main()
            close all; clear all; clc
            hold on

            Robots = BuildEnvironment.SpawnRobots();
            BuildEnvironment();
            CreateUI(Robots{1},Robots{2},Robots{3});

            axis equal
            pause;
        end
        
    end
end

