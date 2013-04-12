import controlP5.*;

import processing.serial.*;
Serial myPort;      // The serial port


ControlP5 controlP5;

public int myColorRect = 200;

public int myColorBackground = 100;

//variable global
int slide1;

void setup() {
  size(400,400);
  frameRate(25);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("sliderA",63,115,100,100,260,100,14).setId(4);
  controlP5.addTextfield("textA",100,290,100,20).setId(5);
  println(Serial.list());

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(myColorBackground);
  fill(myColorRect);
  rect(0,0,width,100);
  myPort.write(slide1);
}


// a slider event will change the value of textfield textA
public void sliderA(int theValue) {
  ((Textfield)controlP5.controller("textA")).setValue(""+theValue);
}

// for every change in textfield textA, this function will be called
public void textA(String theValue) {

  println("### got an event from textA : "+theValue);
  slide1=int(theValue);
  println("slide 1 : "+slide1);
  
}

public void controlEvent(ControlEvent theEvent) {
  println("got a control event from controller with id "+theEvent.controller().id());
}
