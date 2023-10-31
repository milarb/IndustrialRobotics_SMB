const int emergencyStopPin = 2;   // pin for the emergency stop button
boolean EbuttonState = HIGH;        // current button state
boolean RSbuttonState = HIGH; 
boolean lastButtonState = HIGH;     // previous button state
unsigned long lastDebounceTime = 0; // Last time the button state changed
unsigned long debounceDelay = 40;   // Debounce time in milliseconds

void setup() {
  pinMode(emergencyStopPin, INPUT);
  pinmode(reStartButtonPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  int eRead = digitalRead(emergencyStopPin);
  
  if (eRead != lastButtonState) {
    lastDebounceTime = millis();
  }

  if ((millis() - lastDebounceTime) > debounceDelay) {
    if (eRead != EbuttonState) {
      EbuttonState = eRead;

      if (EbuttonState == LOW) {
        // Emergency stop button pressed
        Serial.println("Emergency Stop");
      }

    }
  }

  lastButtonState = eRead;
}
