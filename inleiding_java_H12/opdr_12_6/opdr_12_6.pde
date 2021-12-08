int x = 350;
int y = 350;

void setup(){
  size(800,800);
}

void draw(){
  background(0);
  rect(x,y,100,100);
}

void keyPressed(){
  if(keyCode == 37 && x >= 10){
    x -= 10;
  }
  if(keyCode == 38 && y >= 10){
    y -= 10;
  }
  if(keyCode == 39 && x <= 690){
    x += 10;
  }
  if(keyCode == 40 && y <= 690){
    y += 10;
  }
}
