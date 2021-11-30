void setup(){
  size(500,500);
  noLoop();
}

void draw(){
  tekenDriehoek(100,100,300,450,450,50);
}

void tekenDriehoek(int x1, int y1, int x2, int y2, int x3, int y3){
  line(x1,y1,x2,y2);
  line(x2,y2,x3,y3);
  line(x1,y1,x3,y3);
}
