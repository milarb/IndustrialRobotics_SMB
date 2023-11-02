clear;

a = arduino('COM3'); % Replace 'COM3' with your Arduino's port
is_estop_on = false;

while true
    EbuttonState = readDigitalPin(a,"D2"); % Assuming you connected the button to digital pin 2 on the Arduino
    RSbuttonState = readDigitalPin(a,"D3");
    reStart = true;
    emergencyStop = false;
    
    
    if (EbuttonState == 1 && is_estop_on == false)
        fprintf('Emergency Stop Button Pressed\n');
        emergencyStop = true;
        reStart = false;
        is_estop_on = true;
    end

    if (RSbuttonState == 1 && is_estop_on == true)
        fprintf('Restart ready\n');
        emergencyStop = false;
        reStart = true;
        is_estop_on = false;
    end

    pause(0.1); % Add a small delay to avoid excessive polling
end
