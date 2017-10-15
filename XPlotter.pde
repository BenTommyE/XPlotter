import processing.serial.*;

Serial myPort;      // The serial port
int serialPort = 3; // set your serial here

int x = 0;
int y = 0;

void setup() {
  printArray(Serial.list());
  String portName = Serial.list()[serialPort];              
  myPort = new Serial(this, portName, 115200);
}

void draw() {

}

void keyPressed() {

  if (keyCode == RIGHT) {
    x += 10;
    if(x>300) x = 300;
  } else if (keyCode == LEFT) {
    x -= 10;
    if(x<0) x = 0;
  } else if (keyCode == UP) {
    y += 10;
    if(x>300) x = 245;
  }else if (keyCode == DOWN) {
    y -= 10;
    if(y<0) y = 0;
  }
  
  //Make GCode
  String GCode = "G0";
  GCode += "X" + x;
  GCode += "Y" + y;
  GCode += "\n";
  
  myPort.write(GCode);    // send gcode to printer
  println(GCode);         // print gcode to screen
}

void serialEvent(Serial p) {
  
  String message = p.readStringUntil('\n'); // read aline of serial data
    
  if (message != null) {
    println(message);
  }
}