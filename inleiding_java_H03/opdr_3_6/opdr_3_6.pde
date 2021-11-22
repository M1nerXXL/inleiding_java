size(1280,720);
background(200,200,200);

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
arc(50,430,60,60,PI,PI*1.5);    //TL
line(20,430,20,570);            //L
arc(50,570,60,60,PI*0.5,PI);    //BL
line(50,600,370,600);           //B
arc(370,570,60,60,0,PI*0.5);    //BR
line(400,570,400,430);          //R
arc(370,430,60,60,PI*1.5,PI*2); //TR
line(50,400,370,400);           //T
fill(0,0,0);
text("Afgeronde Rechthoek",50,620);

//filled rectangle with ellipse
noStroke();
fill(255,0,255);
rect(470,100,380,200);
noFill();
stroke(0,0,0);
ellipse(660,200,380,200);
fill(0,0,0);
text("Gevulde rechthoek met ovaal",490,320);
