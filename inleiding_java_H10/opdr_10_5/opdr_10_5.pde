import controlP5.*;

ControlP5 cp;
Textfield textfield1;
Textfield textfield2;
Button button;

float input1 = 0;
float input2 = 0;
int buttonPressed = 0;
boolean run = false;
float output;

void setup(){
  size(360,170);
  cp = new ControlP5(this);
  
 textfield1 = cp.addTextfield("Input1")
                .setPosition(20,20)
                .setSize(150,30)
                .setColorBackground(color(0))
                .setColorForeground(color(255))
                .setAutoClear(false);
 textfield2 = cp.addTextfield("Input2")
                .setPosition(190,20)
                .setSize(150,30)
                .setColorBackground(color(0))
                .setColorForeground(color(255))
                .setAutoClear(false);
  makeButton("add",20,"+");
  makeButton("subtract",105,"-");
  makeButton("multiply",190,"*");
  makeButton("divide",275,"/");
}

void draw(){
  background(0);
  stroke(255);
  fill(255);
    rect(20,110,320,40);
  if(run == true){
    input1 = float(textfield1.getText());
    input2 = float(textfield2.getText());
    run = false;
  }
  textSize(20);
  fill(0);
  if(buttonPressed==1){
    text(nf(input1 + input2,0,0),25,135);
  }else if(buttonPressed==2){
    text(nf(input1 - input2,0,0),25,135);
  }else if(buttonPressed==3){
    text(nf(input1 * input2,0,0),25,135);
  }else if(buttonPressed==4){
    text(nf(input1 / input2,0,0),25,135);
  }
}

void makeButton(String name, int x, String label){
  button = cp.addButton(name)
             .setPosition(x,70)
             .setSize(65,30)
             .setColorBackground(color(100))
             .setColorForeground(color(150))
             .setColorActive(color(50))
             .setLabel(label);
}

void add(){
  buttonPressed = 1;
  run = true;
}

void subtract(){
  buttonPressed = 2;
  run = true;
}

void multiply(){
  buttonPressed = 3;
  run = true;
}

void divide(){
  buttonPressed = 4;
  run = true;
}
