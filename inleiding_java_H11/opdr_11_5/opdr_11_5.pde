boolean nameFound = false;
String[] names = {"Bert", "Emily", "Jan", "Paul", "Rick", "Anne"};

void setup(){
  for(int i=0; i<names.length; i++){
    if(names[i] == "Jan"){
      nameFound = true;
    }
  }
  println("Jan gevonden: " + nameFound);
}
