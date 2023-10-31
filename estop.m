classdef estop
    
    methods (Static) %% WHY DOES IT NEED AN INPUT ARGUEMENT
        function E_stop_1()
    
            a = arduino('COM3'); % Port the Arduino is connected to on your device
            
            is_estop_on = false;
            
            EbuttonState = readDigitalPin(a,2); 
                
            if EbuttonState == 0 && is_estop_on == false
                is_estop_on = true;
                fprintf('Emergency Stop Button Pressed\n');
            
            elseif EbuttonState == 0 && is_estop_on == true
                is_estop_on = false;
                fprintf('Emergency Stop Unlocked\n')
            end      
        end
    
    %% Another option
    
        function E_stop_2()
        arduino_signal = readSerial(a);

        is_estop_on = false;
        
            if strcmp(arduino_signal, 'Emergency Stop') % strcmp compares values and returns a logical value
                is_estop_on = ~is_estop_on;

                if is_estop_on
                    fprintf('Emergency Stop Pressed. Operations halted\n');
                else
                    fprintf('Press "Start" to resume operations'\n');
                    % Needs to do something here
                end
            end
        end

    end
end


