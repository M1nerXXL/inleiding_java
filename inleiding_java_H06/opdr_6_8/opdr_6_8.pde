float cijfer = 8.7;
boolean diploma = false;
boolean cumlaude = false;

if(cijfer >= 8){
  cumlaude = true;
}else if(cijfer >= 5.5){
  diploma = true;
}

if(cumlaude){
  println("Gefeliciteerd, je bent geslaagd met cumlaude");
}else if(diploma){
  println("Gefeliciteerd");
}
