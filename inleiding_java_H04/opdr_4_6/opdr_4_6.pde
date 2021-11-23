float cijfer1 = 4.3;
float cijfer2 = 8.1;
float cijfer3 = 6.4;

float gemiddelde = (cijfer1+cijfer2+cijfer3)/3;

gemiddelde *= 10;
gemiddelde = round(gemiddelde);
gemiddelde /= 10;

print("Gemiddelde: ");
println(gemiddelde);

//Onafgerond is het resultaat 6.266666666
