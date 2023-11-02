const int emergencyButtonPin = 2; // Pin for the emergency stop button
const int restartButtonPin = 3;   // Pin for the restart button
boolean emergencyStop = false;     // Flag to indicate emergency stop
boolean reStart = true;

void setup() {
  pinMode(emergencyButtonPin, INPUT); // Use internal pull-up resistor
  pinMode(restartButtonPin, INPUT);   // Use internal pull-up resistor
  Serial.begin(9600);
}

void loop() {
  if (digitalRead(emergencyButtonPin) == HIGH && reStart) {
    // Emergency stop button is pressed
    emergencyStop = true;
    reStart = false;
    Serial.println("Emergency Stop Button Pressed");
    // Add any necessary actions to stop processes here
  }

  if (digitalRead(restartButtonPin) == HIGH && emergencyStop) {
    // Restart button is pressed after emergency stop
    emergencyStop = false;
    reStart = true;
    Serial.println("Restart Button Pressed");
    // Add any necessary actions to restart processes here
  }
}

