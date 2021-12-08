float sec = 0;
int minDisplay = 0;
float secDisplay = 0;
int timeStop = 0;
int recentPause = 0;
int pauses = 0;
boolean active = false;
float savedSec = 0;
int savedMin = 0;
String saveTime = "";
String[] savedTimeList = {"","","","",""};
String[] savedTimeListCopy = {"","","","",""};
float differenceSec = 0;
int differenceMin = 0;
String saveDifference = "";
String[] savedDifferenceList = {"","","","",""};
String[] savedDifferenceListCopy = {"","","","",""};


void setup(){
  size(500,500);
  frameRate(120);
}

void draw(){
  background(0);
  //Passing of time
  if(active){
    if(sec*1000 <= millis() - pauses){
      sec += 0.01;
    }
  }
  //Display time
  minDisplay = floor(sec/60);
  secDisplay = sec%60;
  textAlign(CENTER);
  textSize(80);
  for(int i=0; i<5; i++){
    fill(i*50);
    text(nf(minDisplay,1,0) + ":" + nf(secDisplay,2,2),247 + i*1,117 + i*1);
  }
  fill(255);
  text(nf(minDisplay,1,0) + ":" + nf(secDisplay,2,2),252,122);
  //Laps
  textSize(25);
  text("Laps",150,200);
  text("Difference",350,200);
  textSize(20);
  for(int i=0; i<5; i++){
    text(savedTimeList[i],150,250+i*30);
  }
  for(int i=0; i<5; i++){
    text(savedDifferenceList[i],350,250+i*30);
  }
  textSize(15);
  //Controls
  text("SPACE - Pause",250,460);
  text("L - Lap",250,475);
  text("R - Reset",250,490);
}

void keyPressed(){
  if(keyCode == 32){
    //Start
    if(!active){
      recentPause = millis() - timeStop;
      pauses = pauses + recentPause;
      active = true;
      println("Stopwatch started.");
    //Stop
    }else{
      timeStop = millis();
      active = false;
      println("Stopwatch paused.");
    }
  }
  //Reset
  if(key == 'r'){
    timeStop = 0;
    pauses = 0;
    active = false;
    sec = 0;
    for(int i=0; i<savedTimeList.length; i++){
      savedTimeList[i] = "";
    }
    for(int i=0; i<savedDifferenceList.length; i++){
      savedDifferenceList[i] = "";
    }
    savedMin = 0;
    savedSec = 0;
    println("Stopwatch reset.");
  }
  //Lap
  if(key == 'l'){
    differenceMin = minDisplay - savedMin;
    differenceSec = secDisplay - savedSec;
    saveDifference = nf(differenceMin,1,0) + ":" + nf(differenceSec,2,2);
    for(int i=0; i<5; i++){
      savedDifferenceListCopy[i] = savedDifferenceList[i];
    }
    for(int i=0; i<4; i++){
      savedDifferenceList[i+1] = savedDifferenceListCopy[i];
    }
    savedDifferenceList[0] = saveDifference;
    
    savedMin = minDisplay;
    savedSec = secDisplay;
    saveTime = nf(savedMin,1,0) + ":" + nf(savedSec,2,2);
    for(int i=0; i<5; i++){
      savedTimeListCopy[i] = savedTimeList[i];
    }
    for(int i=0; i<4; i++){
      savedTimeList[i+1] = savedTimeListCopy[i];
    }
    savedTimeList[0] = saveTime;
    
    println("Lap saved.");
  }
}
