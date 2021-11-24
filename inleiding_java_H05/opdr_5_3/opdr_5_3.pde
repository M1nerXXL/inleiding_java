String part1 = "Met een gewicht van ";
String part2 = "kg en een lengte van ";
String part3 = "cm, is jouw BMI ";

float length_cm = 180;
float weight = 110;

float length_m = length_cm/100;
float bmi = round(weight/(length_m*length_m));

print(part1 + int(length_cm) + part2 + int(weight) + part3 + int(bmi) + "."); 
