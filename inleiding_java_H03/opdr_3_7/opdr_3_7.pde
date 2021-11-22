size(1280,720);
background(100,100,255);

//ground
fill(0,200,0);
noStroke();
rect(0,550,1280,170);
ellipse(640,550,1300,150);

//house
stroke(0,0,0);
strokeWeight(3);
fill(244,228,222);
rect(390,300,500,300);
fill(188,74,60);
triangle(370,310,910,310,640,100);

//door
fill(140,24,10);
rect(690,499,50,100);
strokeWeight(1);
fill(200,200,200);
rect(695,545,20,5,2);

//window
strokeWeight(3);
fill(200,200,255);
rect(480,450,100,100);
stroke(230,230,255);
line(500,460,490,470);
line(510,460,490,480);
line(570,530,560,540);
line(570,520,550,540);
