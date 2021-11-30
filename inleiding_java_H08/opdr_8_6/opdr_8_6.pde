size(250,250);
background(255,255,255);

int d = 250;
int center = 125;

for(int i=0; i<5; i++){
  ellipse(center,125,d,d);
  d -= 30;
  center += 15;
}
