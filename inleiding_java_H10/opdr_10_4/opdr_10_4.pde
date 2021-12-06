import controlP5.*;

ControlP5 cp;
Button button;

int parentCount = 0;
int studentCount = 0;

void setup(){
  size(500,500);
  cp = new ControlP5(this);
  
  makeButton("parentsUp",50,75,0,200,"+1 parent");
  makeButton("studentsUp",275,75,0,200,"+1 student");
  makeButton("parentsDown",50,125,200,0,"-1 parent");
  makeButton("studentsDown",275,125,200,0,"-1 student");
}

void draw(){
  background(0);
  if(parentCount < 0){
    parentCount = 0;
  }
  if(studentCount < 0){
    studentCount = 0;
  }
  textSize(30);
    text("Parents: " + parentCount, 50,300);
    text("Students: " + studentCount, 50,340);
  textSize(50);
    text("Total: " + (parentCount+studentCount), 50,400);
}

void makeButton(String name, int x, int y, int red, int blue, String label){
  button = cp.addButton(name)
             .setPosition(x,y)
             .setSize(175,50)
             .setColorBackground(color(red,0,blue))
             .setColorForeground(color(red+50, 0, blue+50))
             .setColorActive(color(red-50, 0, blue+50))
             .setLabel(label);
}

void parentsUp(){
  parentCount += 1;
}

void studentsUp(){
  studentCount += 1;
}

void parentsDown(){
  parentCount -= 1;
}

void studentsDown(){
  studentCount -= 1;
}
