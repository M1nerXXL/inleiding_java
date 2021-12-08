int x = 0;
int y = 0;
boolean first = true;

void setup(){
  size(1000,1000);
  background(150);
}
void draw(){
}

void mouseClicked(){
  println("Mouse clicked.");
  stroke(255);
  strokeWeight(5);
  if(first){
    point(mouseX,mouseY);
    x = mouseX;
    y = mouseY;
    first = false;
    println("First line drawn.");
  }else{
    line(x,y,mouseX,mouseY);
    x = mouseX;
    y = mouseY;
    println("Line drawn.");
  }
}

//If drawing the line does not work, that means the mouse moved while the mouse button was held.
