size(1280,720);
background(255,255,255);

//input variables setup
  float weight_kg = 60;
  float height_cm = 165;

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
    text("weight(kg) / height(m) ^ 2 = BMI",20,250);
    text(weight_kg + " / " + height_m + " ^ 2 = " + bmi,20,280);
    
//BMI bar
  noStroke();
  fill(255,0,0);
    rect(450,20,50,70,10,10,0,0);
  fill(255,150,0);
    rect(450,90,50,50);
  fill(0,255,0);
    rect(450,140,50,65);
  fill(0,0,255);
    rect(450,205,50,75,0,0,10,10);
  noFill();
  stroke(0,0,0);
    rect(450,20,50,260,10);
    
//BMI scale
  fill(0,0,0);
  textSize(20);
    text("- 30",501,95);
    text("- 25",501,145);
    text("- 18,5",501,210);
    
//BMI arrow
  float arrow_height = 390 - bmi * 10;
  fill(255,255,255);
  strokeWeight(1);
    if(bmi <= 37 && bmi >= 11){
      triangle(442,arrow_height-5,442,arrow_height+5,456,arrow_height);
    }if(bmi > 37){
      triangle(442,15,442,25,456,20);
    }if(bmi < 11){
      triangle(442,275,442,285,456,280);
    }
