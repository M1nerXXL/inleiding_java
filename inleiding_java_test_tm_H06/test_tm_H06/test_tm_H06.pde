size(1280,720);
background(255,255,255);

//input variables setup
  float weight_kg = 60;
  float height_cm = 161;

//other variables setup
  float height_m = height_cm / 100;
  float bmi = weight_kg / pow(height_m,2);

//testing variables
  println("Weight: " + weight_kg + "kg");
  println("Height: " + height_cm + "cm, " + height_m + "m");
  println("BMI: " + bmi);

//title
  textSize(100);
  fill(50,50,50);
    text("BMI Calculator",23,103);
  textSize(100);
  fill(0,0,255);
    text("BMI Calculator",20,100);

//input variables display
  strokeWeight(3);
  fill(50,50,50);
    rect(23,153,200,50,10);
    rect(23,228,200,50,10);
  fill(200,200,200);
    rect(20,150,200,50,10);
    rect(20,225,200,50,10);
