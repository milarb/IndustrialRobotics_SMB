classdef GUIController
    %GUICONTROLLER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        System
        gui
    end
    
    methods
        function self = GUIController(System)
            self.System = System;
            %self.gui = gui;
        end
        
        function test = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end


    end

    methods (Static)
        function test2()
        end
    end
end

