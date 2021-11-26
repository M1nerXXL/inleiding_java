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
  textSize(50);
  fill(50,50,50);
    text("BMI Calculator",22,52);
  textSize(50);
  fill(0,0,255);
    text("BMI Calculator",20,50);

//input variables display
  strokeWeight(3);
  fill(50,50,50);
    rect(23,83,300,50,10);
    rect(23,153,300,50,10);
  fill(200,200,200);
    rect(20,80,300,50,10);
    rect(20,150,300,50,10);
  fill(0,0,0);
  textSize(25);
    text("Height: " + height_cm + "cm",30,113);
    text("Weight: " + weight_kg + "kg",30,183);
    
//formula
  textSize(20);
    text("weight(kg) / height(m)    = BMI",20,250);
    text(weight_kg + " / " + height_m + "    = " + bmi,20,280);
  textSize(15);
    text("2",207,243);
    text("2",105,273);
    
//BMI bar
  noStroke();
  fill(255,0,0);
    rect(450,20,50,50,10,10,0,0);
  fill(255,150,0);
    rect(450,70,50,50);
