size(1280,720);
background(255,255,255);

//line
strokeWeight(2);
fill(0,0,0);
line(20,30,400,30);
text("Lijn",40,50);

//rectangle
noFill();
rect(20,100,380,200);
fill(0,0,0);
text("Rechthoek",40,320);

//smooth rectangle
noFill();
rect(20,400,380,200,30);
fill(0,0,0);
text("Afgeronde Rechthoek",50,620);

//filled rectangle with ellipse
fill(255,0,255);
rect(450,100,380,200);
noFill();
ellipse(640,200,380,200);
fill(0,0,0);
text("Gevulde rechthoek met ovaal",470,320);

//filled ellipse
fill(255,0,255);
ellipse(640,500,380,200);
fill(0,0,0);
text("Gevulde ovaal",470,620);

//ellipse with purple slice
noStroke();
fill(255,0,255);
arc(1070,200,380,200,PI*1.75,PI*2);
stroke(0,0,0);
noFill();
ellipse(1070,200,380,200);
fill(0,0,0);
text("Taartpunt met ovaal eromheen",900,320);

//circle
noFill();
ellipse(1070,500,200,200);
fill(0,0,0);
text("Cirkel",900,620);
