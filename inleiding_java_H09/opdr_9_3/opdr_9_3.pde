float cijfer1 = 4.5;
float cijfer2 = 8.2;
float gemiddelde = (cijfer1+cijfer2)/2;

void setup(){
  println(decimal(gemiddelde));
}

float decimal(float input){
  input *= 10;
  input = round(input);
  input /= 10;
  return input;
}
