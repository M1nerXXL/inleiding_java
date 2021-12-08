PImage image;

void setup(){
  size(1500,300);
  image = loadImage("images/image.jpg");
}

void draw(){
  image(image,0,0,width,height);
}
