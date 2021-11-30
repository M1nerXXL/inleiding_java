void setup(){
  size(1280,720);
  noLoop();
}

void draw(){
  background(200,255,255);
  fill(0,150,0);
  noStroke();
    ellipse(640,720,1500,400);
  //tree
  fill(150,0,0);
    triangle(640,600,560,700,720,700);
    rect(600,250,80,450);
  fill(0,255,0);
  stroke(0,0,0);
    leaves(640,200);
    leaves(540,300);
    leaves(740,300);
}

//leaves
void leaves(int x,int y){
  ellipse(x,y,250,250);
}
