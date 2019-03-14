import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

float xPos;
float sensorVal=0;

int ellipseSize=10;

float yPos=470;

void setup() {
  size(470, 470);
  // Prints out the available serial ports.
  println(Arduino.list());  
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(0,Arduino.INPUT);
  frameRate(100);
}

void draw() {
  //background(25);
  stroke(255,25,255);
  //strokeWeight(5);
  fill(255,25,255);
  println(arduino.analogRead(0));

  float sensorVal = arduino.analogRead(0);
  sensorVal=map(sensorVal,0,1023,0,yPos);
  ellipse(xPos,yPos-sensorVal,ellipseSize,ellipseSize);
  //line(xPos,yPos,xPos,yPos-sensorVal);
  if(xPos>=width){
    background(25);
    xPos=0;
  }
  else{
    xPos=xPos+1;
  } 
}