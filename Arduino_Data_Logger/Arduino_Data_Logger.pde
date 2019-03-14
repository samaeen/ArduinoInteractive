import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
int numReadings = 500;
int readingCounter = 0;

Table table;

void setup() {
  size(500,500);
   println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  for (int i = 0; i <= 53; i++){
    arduino.pinMode(i, Arduino.INPUT);
  }
  table = new Table(); 
  table.addColumn("id");
  table.addColumn("hour");
  table.addColumn("minute");
  table.addColumn("second");
  table.addColumn("Sensor Value");
}
void draw(){
  background(25);
  fill(255,255,0);
  String val1=str(arduino.analogRead(0));
  delay(500);
  text("data is loading",width/2-20,height/2,50);
  TableRow newRow = table.addRow();
  newRow.setInt("id", table.getRowCount() - 1);
  newRow.setString("hour",str(hour()));
  newRow.setString("minitue",str(minute()));
  newRow.setString("second",str(second()));
  newRow.setString("Sensor Value",val1);
  println(val1);
  saveTable(table, "data/new.csv");
}