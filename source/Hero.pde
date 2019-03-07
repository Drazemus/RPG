class Hero
{
  private
  PVector location = new PVector(900/2, 900/2);//point départ
  PVector location2 = new PVector(900/2, 900/2);//point actuel
  PVector mouse;// point d'arrivée
  
  PVector dir;//point d'arrivée - point depart
  
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

  void update(boolean clicky)
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
  
  boolean onclick()
  {
    location.x = location2.x;
    location.y = location2.y;
    mouse = new PVector(mouseX, mouseY);
    println((int)mouse.x);
    dir = PVector.sub(mouse, location);
    return true;
  }
  
}