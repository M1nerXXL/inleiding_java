void setup(){
  size(500,500);
  println(long_string("Een woord","twee woorden","drie woorden","zin"));
}

String long_string(String part1,String part2,String part3,String part4){
  return part1 + ", " + part2 + ", " + part3 + ", " + part4 +".";
}
