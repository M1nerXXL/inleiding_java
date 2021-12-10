import controlP5.*;
import processing.sound.*;

ControlP5 cp;
Button button;
SoundFile ps1;
SoundFile ps2;
SoundFile ps4;

void setup(){
  cp = new ControlP5(this);
  size(500,500);
  
  ps1 = new SoundFile(this, "sounds/ps1.wav");
  ps2 = new SoundFile(this, "sounds/ps2.wav");
  ps4 = new SoundFile(this, "sounds/ps4.wav");
  
  makeButton("PS1",75);
  makeButton("PS2",200);
  makeButton("PS4",325);
}

void draw(){
  background(0);
}

void makeButton(String name, int y){
  button = cp.addButton(name)
             .setPosition(100,y)
             .setSize(300,100)
             .setColorBackground(color(100))
             .setColorForeground(color(150))
             .setColorActive(color(50));
}

void PS1(){
  ps1.play();
}

void PS2(){
  ps2.play();
}

void PS4(){
  ps4.play();
}
