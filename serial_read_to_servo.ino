#include <Servo.h> 
 
Servo myservo;

int incomingByte = 0;   // for incoming serial data

void setup() {
        Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
        myservo.attach(9);  // attaches the servo on pin 9 to the servo object 
}

void loop() {
  int pos;

        // send data only when you receive data:
        if (Serial.available() > 0) {
                // read the incoming byte:
                incomingByte = Serial.read();

                // say what you got:
                Serial.print("I received: ");
                Serial.println((int)incomingByte, DEC);
                pos=int(incomingByte);
                myservo.write(pos);              // tell servo to go to position in variable 'pos' 
                delay(15); 
                
        }
}


