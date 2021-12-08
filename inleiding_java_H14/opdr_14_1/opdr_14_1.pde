PImage eyes;
PImage nose;
PImage mouth;

void setup(){
  size(1000,1000);
  eyes = loadImage("images/eyes.jpg");
  nose = loadImage("images/nose.jpg");
  mouth = loadImage("images/mouth.png");
}

void draw(){
  background(255);
  image(eyes,200,200,600,200);
  image(nose,350,400,300,200);
  image(mouth,250,600,500,200);
}
