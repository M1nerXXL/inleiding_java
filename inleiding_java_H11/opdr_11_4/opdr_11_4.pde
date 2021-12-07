int[] variable = new int[10];

void setup(){
  for(int i=0; i<variable.length; i++){
    variable[i] = i*12+12;
    println(variable[i]);
  }
}
