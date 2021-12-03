import controlP5.*;

ControlP5 cp;
Button correct;
Button incorrect;
int pressedButton = 0;

void setup(){
  size(500,500);
  cp = new ControlP5(this);
  makeButton("Correct", 100, "Click me!");
  makeButton("Incorrect", 275, "Click me!");
}

void draw(){
  background(0);
  textSize(40);
  if(pressedButton == 1){
    text("Well done!",20,50);
  }else if(pressedButton == 2){
    text("Try again!",20,50);
  }
}

void makeButton(String name, int x, String text){
    correct = cp.addButton(name)
                .setPosition(x,275)
                .setSize(125,75)
                .setColorBackground(color(0,0,255))
                .setColorForeground(color(255,125,0))
                .setColorActive(color(255,0,0)) 
                .setCaptionLabel(text);
}

void Correct(){
  pressedButton = 1;
} 

void Incorrect(){
  pressedButton = 2;
}
