import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class RPG extends PApplet {

PImage test;
PImage curseur;

int controle[]=new int[7];

Hero hero = new Hero();
Salle salle = new Salle();

ArrayList<Bullet> bullets;

//detection du click
boolean click = false;

public void setup() {

  //on enl\u00e8ve la souris pour ajouter notre propre curseur
  noCursor();

  //definition propri\u00e9t\u00e9 de l'affichage
  
  background(125);

  //Creation d'une Arraylist pour bullets
  bullets = new ArrayList();

  //chargement et resize des images
  test = loadImage("1porte.PNG");
  curseur = loadImage("curseur.PNG");
  curseur.resize(75, 75);
}

public void draw() {

  background(test);
  
  //print(hero.coord());
  
  fill(0, 0, 255);
  rect(860, 330, 40, 240);

  //controle souris
  controle();
  //personnage  
  hero.display();
  hero.update(click, salle.tp());

  //salle en fond
  salle.display();
  salle.update(hero.coord());

  for (Bullet bullet : bullets) {
    bullet.update();
    bullet.display();
  }

  //affichage curseur
  imageMode(CENTER);
  image(curseur, mouseX, mouseY);
  fill(255);
  text(mouseX,mouseX-40,mouseY-40);
  text(mouseY,mouseX+20,mouseY-40);
}

public void mousePressed() {
  if (mouseButton == LEFT)controle[1]=1;
  if (mouseButton == RIGHT)controle[2]=1;
}

public void mouseReleased() {
  if (mouseButton == LEFT)controle[1]=0;
  if (mouseButton == RIGHT)controle[2]=0;
}

public void controle() {
  if (controle[1] == 1) bullets.add(new Bullet(hero.coord()));
  if (controle[2] == 1)click = hero.onclickH();
}
class Bullet {

  private

  PVector locationB = new PVector(900/2, 900/2);//point actuel
  PVector velocity; // contains speed for x and y...

  final float bulletFlySpeed = 4.2f;
  final int fireSpeed=10;
  int lastFired=millis();
  int ammoCount = 70;

  public

    Bullet(PVector hero) {
    locationB.x=hero.x;
    locationB.y=hero.y;
  }

  public void display() {   
    fill(255);
    ellipse(locationB.x, locationB.y, 10, 10);
  }

  public void update() {
  }
}
class Hero {
  private
  PVector location = new PVector(900/2, 900/2);//point d\u00e9part
  PVector locationH = new PVector(900/2, 900/2);//point actuel
  PVector mouse;// point d'arriv\u00e9e

  PVector dir;//point d'arriv\u00e9e - point depart

  //Variable calcul utile
  float m;
  float p;
  float s = 5;
  float t;
  float d;
  float incr;

  public

    PVector coord() {
    return locationH;
  }

  public void display() {
    //line(locationH.x, locationH.y, mouseX, mouseY);
    fill(0);
    ellipse((int)locationH.x, (int)locationH.y, 80, 80);
    //println((int)locationH.x);
  }

  public void update(boolean clicky, boolean tele) {
    //action click 
    if(tele == true){
      locationH.x = 45;
      locationH.y = 450;
    }
    
    if (clicky == true && tele == false) {
      d = sqrt(pow(dir.x, 2) + pow(dir.y, 2));

      if ( d < 0) d = d*-1;

      t = d/s;
      incr = dir.x/t;
      m = dir.y / dir.x;
      p = location.y - ( m * location.x);
     
      if (mouse.x < location.x && mouseX != locationH.x && mouse.x < locationH.x) {
        locationH.x += incr;
      }
      if (mouse.x > location.x && mouseX != locationH.x && mouse.x > locationH.x) {
        locationH.x += incr;
      }
      
      //equation de droite
      locationH.y = (m * locationH.x) + p;
    }
  }

  public boolean onclickH() {
    location.x = locationH.x;
    location.y = locationH.y;
    mouse = new PVector(mouseX, mouseY);
    //println((int)mouse.x);
    dir = PVector.sub(mouse, location);
    return true;
  }
}
class Salle {
  
  private

  PVector locationH = new PVector(900/2, 900/2);//point actuel
  boolean teleport = false;
  
  public
  
  boolean tp(){
    return teleport;
  }

  public void display(){

  }
  
  public void update(PVector hero){
    
    //importation de la position du hero
    locationH.x=hero.x;
    locationH.y=hero.y;
    
    //test zone de tp
    if(locationH.x > 860 && (locationH.y > 330 && locationH.y < 570)){
      teleport = true;
    }
    
    //Au click le personnage peut se deplacer de nouveau
    if (mousePressed == true)if(mouseButton == RIGHT)teleport = false;
  }
  
}
  public void settings() {  size(900, 900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RPG" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
