classdef Main
    %MAIN 
    %Main stores global vars and is the class called when starting the
    %system
    properties

        %Properties of the system
        UR3
        TM12
        ExtraUR3
        gui
        Items
        PlaceLocation
        TablePoints
        BarrierPoints
        Colliders
    end

    methods
        function System = Main
            hold on
            
            %Build environment and assign system properties
            BuildEnvironment;
            System.Items = SpawnItems(transl(-2,-0.25,0));
            System.PlaceLocation = PlaceLocations(transl(-0.5,-0.25,0));
            [System.UR3 System.TM12, System.ExtraUR3] = BuildEnvironment.SpawnRobots;
            System.Colliders = CollisionControl(System);
            
            %Send system properties to GUI and create GUI
            NewGUITest(System);
        end
        
    end
end

