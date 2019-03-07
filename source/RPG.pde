
//Variable de location
PVector location = new PVector(900/2, 900/2);
PVector location2 = new PVector(900/2, 900/2);
PVector mouse;
PVector dir;
PImage salle;

//detection du click
boolean click = false;

//Variable calcul utile
float m;
float p;
float s = 500;
float t;
float d;
float T;
float a;
float incr;

//variable de temps
float startTime;
float stopTime;

void setup() {
  size(900, 900);
  background(125);
  salle = loadImage("salle test.PNG");
  salle.resize(900, 900);

  //initialisation du temps
  startTime = millis();
}

void draw() {
  background(salle);
  //ellipse(location.x, location.y, 10, 10);

  //personnage  
  fill(0); 
  ellipse(location2.x, location2.y, 80, 80);

  //action click 
  if (click == true) {
    d = sqrt(pow(dir.x, 2) + pow(dir.y, 2));
    if ( d < 0) d = d*-1;
    s = 10;
    fill(0);
    //ellipse(mouse.x, mouse.y, 10, 10);
    //ellipse(location.x, location.y + dir.y, 10, 10);
    //line(location.x, location.y, location.x, location.y + dir.y);//dy
    //line(location.x, location.y, mouse.x, mouse.y);
    //line(location.x, location.y + dir.y, mouse.x, mouse.y);//dx
    //text(abs(dir.y), location.x + dir.x/2, mouse.y + 20);
    t = d/s;
    incr = dir.x/t;
    m = dir.y / dir.x;
    p = location.y - ( m * location.x);
    if (mouse.x < location.x && mouse.x != location2.x && mouse.x < location2.x) {
      location2.x += incr;
      if (location2.x <= mouse.x) {
        stopTime = millis();
        //text((stopTime - startTime)/1000, location.x + dir.x/2, mouse.y + 40);
      }
    }
    if (mouse.x > location.x && mouse.x != location2.x && mouse.x > location2.x) {
      location2.x += incr;
      if (location2.x >= mouse.x) {
        stopTime = millis();
        //text((stopTime - startTime)/1000, location.x + dir.x/2, mouse.y + 40);
      }
    }
    
    //equation de droite
    location2.y = (m * location2.x) + p;
    
    //calcul temps
    T = (stopTime - startTime)/1000;
    
    //println(degrees(a), " and ", d/T, "px/s", " and ", t);
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    startTime = millis();
    location.x = location2.x;
    location.y = location2.y;
    click = true;
    mouse = new PVector(mouseX, mouseY);
    dir = PVector.sub(mouse, location);
  }
}