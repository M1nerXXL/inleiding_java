size(200,300);
background(0,0,0);

int number = 7;
int y = 30;

textSize(20);

for(int i=1; i<11; i++){
  text(i + " x " + number + " = " + i*number, 20, y);
  y += 25;
}
