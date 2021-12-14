import controlP5.*;
ControlP5 cp;

Button retry;
Button toTitle;

PFont arial;
PImage body;
PImage head;
PImage headX;
PImage greenApple;
PImage goldenApple;
PImage crown;
PImage star;
int[] bodyX = {200,150,100};
int[] bodyY = {100,100,100};
int[] bodyX2 = {0,0,0};
int[] bodyY2 = {0,0,0};
String[] savedInfo = new String[1];
int greenAppleX;
int greenAppleY;
int goldenAppleX;
int goldenAppleY;
int greenApples = 0;
int goldenApples = 0;
int goldenAppleTime;
int goldenAppleDuration;
int score = 0;
int highScore = 0;
int timeStart = 0;
int timePlaying = 0;
int timeGameOver;
int gameOverTimer;
float direction = 1.5;  //0 down, 0.5 left, 1 up, 1.5 right
float input = 1.5;
boolean newGreenApple = true;
boolean newGoldenApple = true;
boolean newAppleTimer = true;
boolean playing = true;
boolean title = false;
boolean gameOver = false;
boolean torus = false;

void setup(){
  cp = new ControlP5(this);
  frameRate(10);
  size(850,950);
  
  arial = createFont("arial",30);
  
  body = loadImage("images/body.png");
  head = loadImage("images/head.png");
  headX = loadImage("images/headX.png");
  greenApple = loadImage("images/greenApple.png");
  goldenApple = loadImage("images/goldenApple.png");
  crown = loadImage("images/crown.png");
  star = loadImage("images/star.png");
  
  retry = cp.addButton("retry")
            .setPosition(100,600)
            .setSize(275,150)
            .setColorBackground(color(100))
            .setColorForeground(color(150))
            .setColorActive(color(50))
            .setFont(arial)
            .setLabel("Retry");
  toTitle = cp.addButton("toTitle")
              .setPosition(475,600)
              .setSize(275,150)
              .setColorBackground(color(100))
              .setColorForeground(color(150))
              .setColorActive(color(50))
              .setFont(arial)
              .setLabel("Back to title");
}

void draw(){
  background(0);
  direction = input;
  savedInfo = loadStrings("data/data.txt");
  highScore = int(savedInfo[0]);
  
  //Buttons
  if(title){
    retry.hide();
    toTitle.hide();
  }
  if(gameOver){
    retry.show();
    toTitle.show();
  }
  if(playing){
    retry.hide();
    toTitle.hide();
  }
  
  //Movement
  if(playing){
    for(int i=0; i<bodyX.length; i++){
      bodyX2[i] = bodyX[i];
      bodyY2[i] = bodyY[i];
    }
    for(int i=1; i<bodyX.length; i++){
      bodyX[i] = bodyX2[i-1];
      bodyY[i] = bodyY2[i-1];
    }
    if(direction == 0.5){
      bodyX[0] -= 50;
    }else if(direction == 1){
      bodyY[0] -= 50;
    }else if(direction == 1.5){
      bodyX[0] += 50;
    }else{
      bodyY[0] += 50;
    }
  }
  
  //Bounds
  if(torus){
    for(int i=0; i<bodyX.length; i++){
      if(bodyX[i] > 825){
        bodyX[i] -= 800;
      }
      if(bodyX[i] < 25){
        bodyX[i] += 800;
      }
      if(bodyY[i] > 825){
        bodyY[i] -= 800;
      }
      if(bodyY[i] < 25){
        bodyY[i] += 800;
      }
    }
  }
  if(!torus){
    for(int i=1; i<bodyX.length; i++){
      if(bodyX[0] > 825 || bodyX[0] < 25 || bodyY[0] > 825 || bodyY[0] < 25){
        playing = false;
        gameOver = true;
      }
      if(bodyX[0] > 825){
        bodyX[0] -= 50;
        bodyX[i] -= 100;
      }
      if(bodyX[0] < 25){
        bodyX[0] += 50;
        bodyX[i] += 100;
      }
      if(bodyY[0] > 825){
        bodyY[0] -= 50;
        bodyY[i] -= 100;
      }
      if(bodyY[0] < 25){
        bodyY[0] += 50;
        bodyY[i] += 100;
      }
    }
  }
  
  //Grid
  stroke(100);
  strokeWeight(1);
  for(int i=0; i<17; i++){
    line(25+50*i,25,25+50*i,825);
    line(25,25+50*i,825,25+50*i);
  }
  strokeWeight(3);
  if(torus){
    stroke(100,100,255);
  }
  line(25,25,825,25);
  line(25,825,825,825);
  if(torus){
    stroke(255,150,0);
  }
  line(25,25,25,825);
  line(825,25,825,825);
  
  //Body
  for(int i=1; i<bodyX.length; i++){
   image(body,bodyX[i]-20,bodyY[i]-20);
  }
  
  //Head
  translate(bodyX[0],bodyY[0]);
  rotate(direction*PI);
  if(gameOver){
    image(headX,-20,-20);
  }else{
    image(head,-20,-20);
  }
  rotate(-direction*PI);
  translate(-bodyX[0],-bodyY[0]);
  
  //Bumping into self
  for(int i=1; i<bodyX.length; i++){
    if(bodyX[0] == bodyX[i] && bodyY[0] == bodyY[i]){
      playing = false;
      gameOver = true;
    }
  }
  
  //Green apple eaten
  if(bodyX[0] == greenAppleX+20 && bodyY[0] == greenAppleY+20){
    score++;
    greenApples++;
    bodyX = append(bodyX,1000);
    bodyY = append(bodyY,0);
    bodyX2 = append(bodyX2,0);
    bodyY2 = append(bodyY2,0);
    newGreenApple = true;
  }
  
  //Green apple spawn
  if(playing && newGreenApple){
    greenAppleX = int(random(16))*50+30;
    greenAppleY = int(random(16))*50+30;
    newGreenApple = false;
  }
  image(greenApple,greenAppleX,greenAppleY);
  
  //Golden apple eaten
  if(bodyX[0] == goldenAppleX+20 && bodyY[0] == goldenAppleY+20){
    score += 3;
    goldenApples++;
    bodyX = append(bodyX,1000);
    bodyY = append(bodyY,0);
    bodyX2 = append(bodyX2,0);
    bodyY2 = append(bodyY2,0);
    goldenAppleX = 1000;
    goldenAppleY = 0;
    newAppleTimer = true;
    newGoldenApple = true;
    timeStart = millis();
  }
  
  //Golden apple spawn
  timePlaying = millis()-timeStart;
  if(newAppleTimer){
    goldenAppleTime = int(random(10000,40000));
    goldenAppleDuration = int(random(3000,6000));
    newAppleTimer = false;
  }
  if(playing && timePlaying >= goldenAppleTime && timePlaying <= goldenAppleTime + goldenAppleDuration){
    if(newGoldenApple){
      goldenAppleX = int(random(16))*50+30;
      goldenAppleY = int(random(16))*50+30;
      newGoldenApple = false;
    }
    image(goldenApple,goldenAppleX,goldenAppleY);
  }
  if(goldenAppleTime + goldenAppleDuration < timePlaying){
    newAppleTimer = true;
    newGoldenApple = true;
    timeStart = millis();
  }
  //Score
  if(score > highScore){
    highScore = score;
  }
  if(playing){
    textSize(30);
    textAlign(LEFT);
    image(star,50,865);
    text(" " + score,90,900);
    image(crown,200,865);
    text(" " + highScore,240,900);
    textAlign(RIGHT);
    image(greenApple,610,865);
    text(greenApples + "x ",610,900);
    image(goldenApple,760,865);
    text(goldenApples + "x ",760,900);
  }
  savedInfo[0] = String.valueOf(highScore);
  saveStrings("data/data.txt",savedInfo);
  
  //Game Over
  if(gameOver){
    goldenAppleX = 1000;
    fill(0,0,0,200);
    rect(0,0,850,950);
    fill(255);
    textSize(100);
    textAlign(CENTER);
    text("GAME",400,200);
    text("OVER",450,270);
    textSize(30);
    textAlign(LEFT);
    image(star,200,350);
    text(" " + score,240,385);
    image(crown,200,420);
    text(" " + highScore,240,455);
    textAlign(RIGHT);
    image(greenApple,610,350);
    text(greenApples + "x ",610,385);
    image(goldenApple,610,420);
    text(goldenApples + "x ",610,455);
  }
}

void keyPressed(){
  if(playing){
    if(key == 'a' || keyCode == 37 && direction != 1.5){
      input = 0.5;
    }
    if(key == 'w' || keyCode == 38 && direction != 0){
      input = 1;
    }
    if(key == 'd' || keyCode == 39 && direction != 0.5){
      input = 1.5;
    }
    if(key == 's' || keyCode == 40 && direction != 1){
      input = 0;
    }
  }
}
