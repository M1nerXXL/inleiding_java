void setup(){
  size(1020,1020);
}

void draw(){
  background(255);
  fill(255-millis()/8%128,255-millis()/4%64,255-millis()/16%256);
  rect(mouseX-50,mouseY-50,100,100);
}
