//boolean value Dhore korte hobe...left to right gele true opposite e false
import processing.serial.*;

import cc.arduino.*;
int i,x,y;
boolean z;

Arduino arduino;
void setup(){
  size(500,500);
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  for (int i = 0; i <= 15; i++)
    arduino.pinMode(i, Arduino.INPUT);
}
void draw(){
  background(25);
  int first=arduino.analogRead(0);
  int second=arduino.analogRead(1);
  int ref=50;
  if(first>50 && second>50){
  ellipse(x,y,50,50);
  x=450;
  y=250;
  }
  if(first<ref && second>ref){
  while(first<50){
  first=arduino.analogRead(0);
  ellipse(x,y,50,50);
  x=450-100;
  y=250;
  println("first");
  }
  while(second>50){
    second=arduino.analogRead(1);
    ellipse(x,y,50,50);
    x=450-200;
    y=250;
  }
  while(second<50){
    second=arduino.analogRead(1);
    ellipse(x,y,50,50);
    x=450-300;
    y=250;
  }
  }
  //if(first>50){
  //ellipse(100,100,50,50);
  //}
 //if(first<50){
  // ellipse(22,22,50,50);
 //}
}