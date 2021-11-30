float cijfer1 = 4.5;
float cijfer2 = 8.2;
float gemiddelde = (cijfer1+cijfer2)/2;

void setup(){
  gemiddelde *= 10;
  gemiddelde = round(gemiddelde);
  gemiddelde /= 10;
  println(gemiddelde);
}
