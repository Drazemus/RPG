class Hero {
  private
  PVector location = new PVector(900/2, 900/2);//point départ
  PVector locationH = new PVector(900/2, 900/2);//point actuel
  PVector mouse;// point d'arrivée

  PVector dir;//point d'arrivée - point depart

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

  void display() {
    //line(locationH.x, locationH.y, mouseX, mouseY);
    fill(0);
    ellipse((int)locationH.x, (int)locationH.y, 80, 80);
    //println((int)locationH.x);
  }

  void update(boolean clicky, boolean tele) {
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

  boolean onclickH() {
    location.x = locationH.x;
    location.y = locationH.y;
    mouse = new PVector(mouseX, mouseY);
    //println((int)mouse.x);
    dir = PVector.sub(mouse, location);
    return true;
  }
}