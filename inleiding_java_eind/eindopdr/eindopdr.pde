import controlP5.*;
ControlP5 cp;

Button retryButton;
Button toTitleButton;
Button normalButton;
Button portalButton;
Button redButton;
Button greenButton;
Button blueButton;
Button playButton;

PFont arial;
PFont bebasNeue;
PImage[] redButtonImages = new PImage[3];
PImage[] greenButtonImages = new PImage[3];
PImage[] blueButtonImages = new PImage[3];
PImage title;
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
int greenAppleX;
int greenAppleY;
int goldenAppleX;
int goldenAppleY;
int greenApples = 0;
int goldenApples = 0;
int goldenAppleTime;
int goldenAppleDuration;
int score = 0;
int highScoreNormal = 0;
int highScorePortal = 0;
int timeStart = 0;
int timePlaying = 0;
int timeGameOver;
int gameOverTimer;
int shortening;
int snakeColor = 0; //0 red, 1 green, 2 blue
float direction = 1.5;  //0 down, 0.5 left, 1 up, 1.5 right
float input = 1.5;
String[] savedInfo = new String[2];
boolean newHighScore = false;
boolean newGreenApple = true;
boolean newGoldenApple = true;
boolean newAppleTimer = true;
boolean playing = false;
boolean titleScreen = true;
boolean gameOver = false;
boolean portal = false;

void setup(){
  cp = new ControlP5(this);
  size(850,950);
  
  arial = createFont("arial",30);
  bebasNeue = createFont("fonts/BebasNeue-Regular.ttf",30);
  
  title = loadImage("images/title.png");
  greenApple = loadImage("images/greenApple.png");
  goldenApple = loadImage("images/goldenApple.png");
  crown = loadImage("images/crown.png");
  star = loadImage("images/star.png");
  
  retryButton = cp.addButton("retry")
                  .setPosition(100,600)
                  .setSize(300,150)
                  .setColorBackground(color(100))
                  .setColorForeground(color(150))
                  .setColorActive(color(50))
                  .setFont(arial)
                  .setLabel("Retry (R)");
  toTitleButton = cp.addButton("toTitle")
                    .setPosition(450,600)
                    .setSize(300,150)
                    .setColorBackground(color(100))
                    .setColorForeground(color(150))
                    .setColorActive(color(50))
                    .setFont(arial)
                    .setLabel("Back to title (T)");
  normalButton = cp.addButton("normal")
                   .setPosition(75,490)
                   .setSize(145,90)
                   .setFont(arial)
                   .setLabel("Normal");
  portalButton = cp.addButton("portal")
                   .setPosition(230,490)
                   .setSize(145,90)
                   .setFont(arial)
                   .setLabel("Portal");
  redButton = cp.addButton("red")
                .setPosition(450,490)
                .setSize(90,90)
                .setColorBackground(color(100))
                .setColorForeground(color(150))
                .setColorActive(color(50))
                .setFont(arial);
  greenButton = cp.addButton("green")
                   .setPosition(550,490)
                   .setSize(90,90)
                   .setColorBackground(color(100))
                   .setColorForeground(color(150))
                   .setColorActive(color(50))
                   .setFont(arial);
  blueButton = cp.addButton("blue")
                 .setPosition(650,490)
                 .setSize(90,90)
                 .setColorBackground(color(100))
                 .setColorForeground(color(150))
                 .setColorActive(color(50))
                 .setFont(arial);
  playButton = cp.addButton("play")
                  .setPosition(75,675)
                  .setSize(700,200)
                  .setColorBackground(color(200,0,0))
                  .setColorForeground(color(250,0,0))
                  .setColorActive(color(150,0,0))
                  .setFont(arial)
                  .setLabel("Start");
}

void draw(){
  background(0);
  direction = input;
  
  savedInfo = loadStrings("saveData/highScores.txt");
  highScoreNormal = int(savedInfo[0]);
  highScorePortal = int(savedInfo[1]);
  
  if(playing){
    frameRate(10);
  }else{
    frameRate(60);
  }
  
  //Button color and images
  if(portal){
  normalButton.setColorBackground(color(100))
              .setColorForeground(color(150))
              .setColorActive(color(50));
  portalButton.setColorBackground(color(0,0,255))
              .setColorForeground(color(0,0,255))
              .setColorActive(color(0,0,255));
  }else{
  normalButton.setColorBackground(color(0,0,255))
              .setColorForeground(color(0,0,255))
              .setColorActive(color(0,0,255));
  portalButton.setColorBackground(color(100))
              .setColorForeground(color(150))
              .setColorActive(color(50));
  }
  
  if(snakeColor == 0){
    redButtonImages[0] = loadImage("images/buttons/redOn.png");
    redButtonImages[1] = loadImage("images/buttons/redOn.png");
    redButtonImages[2] = loadImage("images/buttons/redOn.png");
  }else{
    redButtonImages[0] = loadImage("images/buttons/redOff.png");
    redButtonImages[1] = loadImage("images/buttons/redOn.png");
    redButtonImages[2] = loadImage("images/buttons/redOff.png");
  }
  redButton.setImages(redButtonImages);
  
  if(snakeColor == 1){
    greenButtonImages[0] = loadImage("images/buttons/greenOn.png");
    greenButtonImages[1] = loadImage("images/buttons/greenOn.png");
    greenButtonImages[2] = loadImage("images/buttons/greenOn.png");
  }else{
    greenButtonImages[0] = loadImage("images/buttons/greenOff.png");
    greenButtonImages[1] = loadImage("images/buttons/greenOn.png");
    greenButtonImages[2] = loadImage("images/buttons/greenOff.png");
  }
  greenButton.setImages(greenButtonImages);
  
  if(snakeColor == 2){
    blueButtonImages[0] = loadImage("images/buttons/blueOn.png");
    blueButtonImages[1] = loadImage("images/buttons/blueOn.png");
    blueButtonImages[2] = loadImage("images/buttons/blueOn.png");
  }else{
    blueButtonImages[0] = loadImage("images/buttons/blueOff.png");
    blueButtonImages[1] = loadImage("images/buttons/blueOn.png");
    blueButtonImages[2] = loadImage("images/buttons/blueOff.png");
  }
  blueButton.setImages(blueButtonImages);
  
  //Snake color
  if(snakeColor == 0){
    body = loadImage("images/redBody.png");
    head = loadImage("images/redHead.png");
    headX = loadImage("images/redHeadX.png");
  }else if(snakeColor == 1){
    body = loadImage("images/greenBody.png");
    head = loadImage("images/greenHead.png");
    headX = loadImage("images/greenHeadX.png");
  }else{
    body = loadImage("images/blueBody.png");
    head = loadImage("images/blueHead.png");
    headX = loadImage("images/blueHeadX.png");
  }
  
  //Buttons
  if(titleScreen){
    retryButton.hide();
    toTitleButton.hide();
    normalButton.show();
    portalButton.show();
    redButton.show();
    greenButton.show();
    blueButton.show();
    playButton.show();
  }
  if(gameOver){
    retryButton.show();
    toTitleButton.show();
    normalButton.hide();
    portalButton.hide();
    redButton.hide();
    greenButton.hide();
    blueButton.hide();
    playButton.hide();
  }
  if(playing){
    retryButton.hide();
    toTitleButton.hide();
    normalButton.hide();
    portalButton.hide();
    redButton.hide();
    greenButton.hide();
    blueButton.hide();
    playButton.hide();
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
  if(portal){
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
  if(!portal){
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
  if(portal){
    stroke(100,100,255);
  }
  line(25,25,825,25);
  line(25,825,825,825);
  if(portal){
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
  if(score > highScoreNormal && !portal){
    highScoreNormal = score;
    newHighScore = true;
  }
  if(score > highScorePortal && portal){
    highScorePortal = score;
    newHighScore = true;
  }
  savedInfo[0] = String.valueOf(highScoreNormal);
  savedInfo[1] = String.valueOf(highScorePortal);
  saveStrings("saveData/highScores.txt",savedInfo);
  textFont(bebasNeue);
  if(playing){
    textSize(30);
    textAlign(LEFT);
    image(star,50,865);
    text(" " + score,90,900);
    image(crown,200,865);
    if(portal){
      text(" " + highScorePortal,240,900);
    }else{
      text(" " + highScoreNormal,240,900);
    }
    textAlign(RIGHT);
    image(greenApple,610,865);
    text(greenApples + "x ",610,900);
    image(goldenApple,760,865);
    text(goldenApples + "x ",760,900);
  }
  
  //Game Over
  if(gameOver){
    goldenAppleX = 1000;
    fill(0,0,0,200);
    rect(0,0,850,950);
    fill(255);
    textSize(100);
    textAlign(CENTER);
    text("GAME",400,170);
    text("OVER",450,245);
    textSize(50);
    if(newHighScore){
      fill(255,100,0);
      text("New high score!",426,311);
      fill(255,200,0);
      text("New high score!",425,310);
    }
    fill(255);
    textSize(30);
    textAlign(LEFT);
    image(star,200,350);
    text(" " + score,240,385);
    image(crown,200,420);
    if(portal){
      text(" " + highScorePortal,240,455);
    }else{
      text(" " + highScoreNormal,240,455);
    }
    textAlign(RIGHT);
    image(greenApple,610,350);
    text(greenApples + "x ",610,385);
    image(goldenApple,610,420);
    text(goldenApples + "x ",610,455);
  }
  
  //Title
  if(titleScreen){
    goldenAppleX = 1000;
    fill(0);
    rect(0,0,850,950);
    image(title,125,170,600,200);
    textAlign(LEFT);
    fill(200);
    textSize(35);
    text("Low budget",315,240); 
    fill(255);
    textSize(25);
    text("Gamemode:",75,480);
    text("Color:",450,480);
    textFont(arial);
    textSize(15);
    text("version 1.1.1",5,945);
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
  if(gameOver){
    if(key == 'r'){
      reset();
      gameOver = false;
      playing = true;
    }
    if(key == 't'){
      reset();
      gameOver = false;
      titleScreen = true;
    }
  }
}

void retry(){
  reset();
  gameOver = false;
  playing = true;
}

void toTitle(){
  reset();
  gameOver = false;
  titleScreen = true;
}

void reset(){
  shortening = bodyX.length-3;
  for(int i=0; i<shortening; i++){
    bodyX = shorten(bodyX);
    bodyX2 = shorten(bodyX2);
    bodyY = shorten(bodyY);
    bodyY2 = shorten(bodyY2);
  }
  input = 1.5;
  bodyX[0] = 200;
  bodyX[1] = 150;
  bodyX[2] = 100;
  bodyY[0] = 100;
  bodyY[1] = 100;
  bodyY[2] = 100;
  score = 0;
  greenApples = 0;
  goldenApples = 0;
  newHighScore = false;
}

void normal(){
  portal = false;
}

void portal(){
  portal = true;
}

void red(){
  snakeColor = 0;
}

void green(){
  snakeColor = 1;
}

void blue(){
  snakeColor = 2;
}

void play(){
  titleScreen = false;
  playing = true;
}
