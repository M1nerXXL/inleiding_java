boolean start = true;
boolean finish = true;
int presses = 0;

void draw(){
  if(millis() >= 3000 && start == true){
    println("Go!");
    start = false;
  }
  if(millis() >= 13000 && finish == true){
    println("Stop! You managed to press the space bar " + presses + " times in 10 seconds.");
    finish = false;
  }
}

void keyPressed(){
  if(millis() > 3000 && millis() < 13000){
    if(keyCode == 32){
      presses++;
    }
  }
}
