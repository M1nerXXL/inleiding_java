import controlP5.*;
ControlP5 cp;

Button submit;
Textfield input;

void setup(){
  size(500,500);
  cp = new ControlP5(this);
  submit = cp.addButton("Submit")
             .setPosition(200,275)
             .setSize(100,75)
             .setColorBackground(color(0,0,255))
             .setColorForeground(color(255,125,0))
             .setColorActive(color(255,0,0)) 
             .setCaptionLabel("Submit");
  input = cp.addTextfield("Input")
            .setPosition(50,100)
            .setSize(400,50)
            .setColorBackground(255)
            .setCaptionLabel("Name");
}

void draw(){
  background(0);
  
}

void Submit(){
  println("Hi, my name is " + input.getText());
} 
