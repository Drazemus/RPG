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


//Variable de location

PImage salle;
Hero toto=new Hero();
//detection du click
boolean click = false;



float incr;

public void setup() {
  
  background(125);
  salle = loadImage("salle test.PNG");
  salle.resize(900, 900);
}

public void draw() {
   background(salle);
  //personnage  
   toto.display();
   toto.update(click);
   if (mouseButton == RIGHT) click=toto.onclick();
}

public void mousePressed() {
  //if (mouseButton == RIGHT) click=toto.onclick();
}
class Hero
{
  private
  PVector location = new PVector(900/2, 900/2);//point d\u00e9part
  PVector location2 = new PVector(900/2, 900/2);//point actuel
  PVector mouse;// point d'arriv\u00e9e
  
  PVector dir;//point d'arriv\u00e9e - point depart
  
  //Variable calcul utile
  float m;
  float p;
  float s;
  float t;
  float d;
  float T;
  boolean etat=false;
  
  public
  
  void display()
  {
    fill(0);
    ellipse((int)location2.x, (int)location2.y, 80, 80);
    println((int)location2.x);
  }

  public void update(boolean clicky)
  {
    //action click 
    if (clicky == true) {
      d = sqrt(pow(dir.x, 2) + pow(dir.y, 2));
      
      if ( d < 0) d = d*-1;
      
      s=5;

      t = d/s;
      incr = dir.x/t;
      m = dir.y / dir.x;
      p = location.y - ( m * location.x);
      
      if (mouse.x < location.x && mouse.x != location2.x && mouse.x < location2.x) {
        location2.x += incr;
        if ((location2.x + incr) > mouse.x) incr = 0;
      }
      if (mouse.x > location.x && mouse.x != location2.x && mouse.x > location2.x) {
        location2.x += incr;
        if ((location2.x - incr) < mouse.x) incr = 0;
      }

      //equation de droite
      location2.y = (m * location2.x) + p;
    }
  }
  
  public boolean onclick()
  {
    location.x = location2.x;
    location.y = location2.y;
    mouse = new PVector(mouseX, mouseY);
    println((int)mouse.x);
    dir = PVector.sub(mouse, location);
    return true;
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
