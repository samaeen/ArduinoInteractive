import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
int ledPin = 13;
void setup()
{
  //println(Arduino.list());
  arduino = new Arduino(this, "COM3", 9600);
  arduino.pinMode(ledPin, Arduino.OUTPUT);
}

void draw()
{
  
  arduino.digitalWrite(ledPin, Arduino.HIGH);
  delay(1000);
  arduino.digitalWrite(ledPin, Arduino.LOW);
  delay(1000);
}