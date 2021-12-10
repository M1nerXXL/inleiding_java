PImage dancer;

void setup(){
  size(1000,100);
  dancer = loadImage("images/dancer.png");
}

void draw(){
  background(255);
  for(int i=0; i<20; i++){
    image(dancer,0+50*i,0,50,100);
  }
}
