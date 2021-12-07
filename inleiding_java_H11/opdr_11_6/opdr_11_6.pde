int[] numbers = {3,5,7,1,4,8,3,2,5,8,5,3,6,8,0,6,4,0,3,1,6,9,8,2,5,5,8};
int count = 0;

void setup(){
  for(int i=0; i<numbers.length; i++){
    if(numbers[i] == 8){
      count++;
    }
  }
  println("Aantal achten: " + count);
}
