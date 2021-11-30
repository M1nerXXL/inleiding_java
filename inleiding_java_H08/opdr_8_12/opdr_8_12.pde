size(360,360);
background(255,255,255);

int x = 30;
int y = 30;

for(int i=0; i<10; i++){
  for(int j=0; j<10; j++){
    if((i+j)%2 == 0){
      fill(0,0,0);
    }else{
      fill(255,255,255);
    }
    rect(x,y,30,30);
    x += 30;
  }
  x = 30;
  y += 30;
}
