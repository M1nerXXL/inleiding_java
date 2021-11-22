size(1000,1000);
background(0,0,100);

//head
strokeWeight(3);
ellipse(500,500,800,800); //ellipse 1

//ears
arc(875,400,100,150,PI*1.4,PI*2.5); //arc 1
arc(125,400,100,150,PI*0.5,PI*1.6); //arc 2

//eyes
ellipse(350,400,100,100); //ellipse 2
ellipse(650,400,100,100); //ellipse 3

//mouth
fill(255,255,255);
arc(500,650,300,200,PI*0.1,PI*0.9); //arc 3
