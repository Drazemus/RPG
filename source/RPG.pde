
//Variable de location

PImage salle;
Hero toto=new Hero();
//detection du click
boolean click = false;



float incr;

void setup() {
  size(900, 900);
  background(125);
  salle = loadImage("salle test.PNG");
  salle.resize(900, 900);
}

void draw() {
   background(salle);
  //personnage  
   toto.display();
   toto.update(click);
   if (mouseButton == RIGHT) click=toto.onclick();
}

void mousePressed() {
  //if (mouseButton == RIGHT) click=toto.onclick();
}