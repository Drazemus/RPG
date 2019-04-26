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

  void update(boolean clicky, boolean teleD, boolean teleG, boolean teleH, boolean teleB, int sortie, int nb) {
    print(locationH.x,"   ");
    //action click
    if(teleD == true){
      locationH.x = 50;
      locationH.y = 450;
    }
    if(teleG == true){
      locationH.x = 850;
      locationH.y = 450;
    }
    if(teleH == true){
      locationH.x = 450;
      locationH.y = 850;
    }
    if(teleB == true){
      locationH.x = 450;
      locationH.y = 50;
    }
    
    if (clicky == true && (teleD == false && teleG == false && teleH == false && teleB == false)) {
      d = sqrt(pow(dir.x, 2) + pow(dir.y, 2));

      if ( d < 0) d = d*-1;
      
      if(abs(dir.x) > abs(dir.y)){
        t = d/s;
        incr = dir.x/t;
        m = dir.y / dir.x;
        p = location.y - ( m * location.x);
       
        if (mouse.x < location.x && mouseX != locationH.x && mouse.x < locationH.x + incr){
          
          //test collision porte gauche ou mur
          if ((sortie == 0 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 3 && ( nb == 3 || nb == 4 || nb == 6)) || (sortie == 2 && ( nb == 3 || nb == 4 || nb == 6)) || (sortie == 1 && ( nb == 3 || nb == 4 || nb == 6)) || nb == 7){
            if(locationH.x > 75 || (locationH.y > 370 && locationH.y < 540))locationH.x += incr;
          }  
          else if(locationH.x > 75 && (locationH.y > 75 || locationH.y < 825))locationH.x += incr;
          
        }
          
        if (mouse.x > location.x && mouseX != locationH.x && mouse.x > locationH.x + incr){
          
          //test collision porte droite ou mur
          if ((sortie == 1 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 0 && ( nb == 2 || nb == 4 || nb == 6)) || (sortie == 3 && ( nb == 2 || nb == 4 || nb == 6)) || (sortie == 2 && ( nb == 1 || nb == 4 || nb == 5)) || nb == 7){
            if(locationH.x < 825 || (locationH.y > 370 && locationH.y < 540))locationH.x += incr;
          }
          else if(locationH.x < 825 && (locationH.y > 75 || locationH.y < 825))locationH.x += incr;
        }
        //equation de droite
        locationH.y = (m * locationH.x) + p;
      }
      
      if(abs(dir.x) < abs(dir.y)){
        t = d/s;
        incr = dir.y/t;
        m = dir.x / dir.y;
        p = location.x - ( m * location.y);
       
        if (mouse.y < location.y && mouseY != locationH.y && mouse.y < locationH.y + incr){
          
          //test collision porte haut ou mur
          if ((sortie == 3 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 2 && ( nb == 2 || nb == 5 || nb == 6)) || (sortie == 1 && ( nb == 2 || nb == 4 || nb == 5)) || (sortie == 0 && ( nb == 3 || nb == 5 || nb == 6)) || nb == 7){
            if(locationH.y > 75 || (locationH.x > 370 && locationH.x < 540))locationH.y += incr;
          }  
          else if(locationH.y > 75 && (locationH.x < 825 || locationH.x > 75))locationH.y += incr;
        }
          
        if (mouse.y > location.y && mouseY != locationH.y && mouse.y > locationH.y + incr){
          
          //test collision porte bas ou mur
          if ((sortie == 2 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 1 && ( nb == 1 || nb == 5 || nb == 6)) || (sortie == 0 && ( nb == 1 || nb == 4 || nb == 5)) || (sortie == 3 && ( nb == 1 || nb == 5 || nb == 6)) || nb == 7){
            if(locationH.y < 825 || (locationH.x > 370 && locationH.x < 540))locationH.y += incr;
          }
          else if(locationH.y < 825 && (locationH.x < 825 || locationH.x > 75))locationH.y += incr;
        }
        //equation de droite
        locationH.x = (m * locationH.y) + p;
      }
            
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
