size(1280,720);
background(255,255,255);

//lines
stroke(150,150,150);
line(390,560,890,560);
line(390,460,890,460);
line(390,360,890,360);
line(390,260,890,260);
line(390,160,890,160);

//base
strokeWeight(3);
stroke(0,0,0);
line(390,660,890,660);
line(390,660,390,60);

//values
fill(0,0,0);
textSize(25);
text("0",370,667);
text("20",360,567);
text("40",360,467);
text("60",360,367);
text("80",360,267);
text("100",350,167);

//columns
strokeWeight(1);
fill(255,0,0);
rect(440,460,50,199);
fill(0,255,0);
rect(540,160,50,499);
fill(0,0,255);
rect(640,260,50,399);

//names
fill(0,0,0);
text("Valerie",440,690);
text("Jeroen",540,690);
text("Hans",640,690);
