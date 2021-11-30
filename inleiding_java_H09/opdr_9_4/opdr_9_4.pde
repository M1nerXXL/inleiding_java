void setup(){
  size(500,500);
}

void draw(){
  polygon(100,100,400,400);
}

void polygon(int x1, int y1, int x2, int y2){
  line(x1,y1,x2,y1); //top
  line(x1,y1,x1,y2); //left
  line(x1,y2,x2,y2); //bottom
  line(x2,y1,x2,y2); //right
}
