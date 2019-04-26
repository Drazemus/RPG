class Salle {
  
  private

  PVector locationH = new PVector(900/2, 900/2);//point actuel
  boolean teleport = false;
  
  public
  
  boolean tp(){
    return teleport;
  }

  void display(){

  }
  
  void update(PVector hero){
    
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