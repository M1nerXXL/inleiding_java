import controlP5.*;
ControlP5 cp;
Textfield textfield;
Button button;

int index = 0;
String[] names = new String[10];

void setup(){
  size(410,300);
  background(0);
  cp = new ControlP5(this);
  
  textfield = cp.addTextfield("Enter your name.")
                .setPosition(20,20)
                .setSize(250,30)
                .setColorBackground(color(0))
                .setColorForeground(color(255))
                .setAutoClear(false);
  button = cp.addButton("submit")
             .setPosition(290,20)
             .setSize(100,30)
             .setColorBackground(color(100))
             .setColorForeground(color(150))
             .setColorActive(color(50));
}

void draw(){
  fill(0);
  rect(0,0,410,70);
  if(index >= 10){
    button.hide();
    textfield.hide();
  }
}

void submit(){
  names[index] = textfield.getText();
  textSize(20);
  fill(255);
    text(names[index],20,index*20+90);
  index++;
}
