/*
 This code is modified from a publicly available example by Tom Igoe, found here:
 
 http://www.arduino.cc/en/Tutorial/SwitchCase2
 
 To control from a remote computer/tablet/phone via Blutetooth, use a terminal
 program like Putty to send any character to the BlueSMiRF module, which should
 be connected to the serial I/O pins of the Arduino.
 The characters a, b, c, d, and e, will turn on digital output pins
 2, 3, 4, 5, and 6, respectively.  Any other character will turn all output pins
 off.  Change the characters and pins as desired.
 
 The circuit:
 * 5 transistors (base pins) attached to Arduino digital pins 2 through 6 through
 4.7 Kilo ohm resistors
 
 (Modified from example code by Gavin Philips)
 */

void setup() {
  // initialize serial communication:
  Serial.begin(115200); 
  // initialize the output pins:
  for (int thisPin = 2; thisPin < 7; thisPin++) {
    pinMode(thisPin, OUTPUT);
  } 
}

void loop() {
  // read the input:
  if (Serial.available() > 0) {
    int inByte = Serial.read();
    // do something different depending on the character received.  
    // The switch statement expects single number values for each case;
    // in this exmaple, though, you're using single quotes to tell
    // the controller to get the ASCII value for the character.  For 
    // example 'a' = 97, 'b' = 98, and so forth:

    switch (inByte) {
    case 'a':    
      digitalWrite(2, HIGH);
      break;
    case 'b':    
      digitalWrite(3, HIGH);
      break;
    case 'c':    
      digitalWrite(4, HIGH);
      break;
    case 'd':    
      digitalWrite(5, HIGH);
      break;
    case 'e':    
      digitalWrite(6, HIGH);
      break;
    default:
      // turn all the outputs off:
      for (int thisPin = 2; thisPin < 7; thisPin++) {
        digitalWrite(thisPin, LOW);
      }
    } 
  }
}

