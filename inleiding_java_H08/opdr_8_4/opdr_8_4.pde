size(70,60);
background(255,255,255);

int x = 10;
int y = 10;

for(int i=0; i<2; i++){
  for(int j=0; j<5; j++){
    rect(x, y, 10, 10);
    x += 10;
    y += 5;
  }
  x -= 50;
  y -= 15;
}
