import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
color off = color(25);
color on = color(0, 145, 158);

int[] values = { Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW };

void setup() {
  size(470, 400);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  println(Arduino.list());
  
  for (int i = 0; i <= 13; i++){
    arduino.pinMode(i, Arduino.OUTPUT);}

}
void draw() {
  background(off);
  stroke(on);
  
  for (int i = 0; i <= 13; i++) {
    if (values[i] == Arduino.HIGH)
      fill(on);
    else
      fill(off);
      
    rect(420 - i * 30, 30, 20, 20);
  }
    fill(0,200,0);
  for (int i = 0; i <= 8; i++) {
    rect(30, 80 + i * 30, arduino.analogRead(i) / 3, 20);
  }
}
void mousePressed()
{
  int pin = (450 - mouseX) / 30;

  if (values[pin] == Arduino.LOW) {
    arduino.digitalWrite(pin, Arduino.HIGH);
    values[pin] = Arduino.HIGH;
  } else {
    arduino.digitalWrite(pin, Arduino.LOW);
    values[pin] = Arduino.LOW;
  }
}