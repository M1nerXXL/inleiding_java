size(100,100);
background(255,255,255);

noStroke();
int d = 50;
int red = 255;

for(int i=0; i<5; i++){
  fill(red,0,0);
  ellipse(50,50,d,d);
  d -= 10;
  red -= 40;
}
