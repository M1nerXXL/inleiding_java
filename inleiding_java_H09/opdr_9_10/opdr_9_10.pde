void setup(){
  size(1280,720);
  noLoop();
}

void draw(){
  background(200,255,255);
  fill(0,150,0);
  noStroke();
    ellipse(640,720,1500,400);
  trees(440,650);
  trees(840,650);
  trees(240,680);
  trees(1040,680);
  trees(640,700);
}

//trees (coordinates at bottom middle)
void trees(int x,int y){
  fill(150,0,0);
  noStroke();
    triangle(x,y-100,x-80,y,x+80,y);
    rect(x-40,y-450,80,450);
  fill(0,255,0);
  stroke(0,0,0);
    leaves(x,y-500);
    leaves(x-100,y-400);
    leaves(x+100,y-400);
}

//leaves
void leaves(int x,int y){
  ellipse(x,y,250,250);
}
