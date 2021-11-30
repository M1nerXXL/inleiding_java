int x;
int y = 40;

void setup(){
  size(300,300);
  noLoop();
}

void draw(){
  background(200,200,255);
  fill(150,0,0);
  for(int i=0; i<25; i++){
    y += 10;
    x = 15;
    if(y/10 % 2 == 0){
      x += 15;
    }
    if(x/15 % 2 == 0){
      brick(8);
    }else{
      brick(9);
    }
  }
}

//amount of bricks drawn
void brick(int amount){
  for(int j=0; j<amount; j++){
    rect(x,y,30,10);
    x += 30;
  }
}
