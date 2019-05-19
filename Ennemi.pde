class Ennemi{
  private
  PVector location = new PVector(750, 600);
  int hp;
  int hpMax;
  int i = 0;
  
  public
  
  PVector coord() {
    return location;
  }
  
  Ennemi(float posX, float posY){
    location.x = posX;
    location.y = posY;
   }
  
  void display(int hpE, int hpMaxE){
    hp = hpE;
    hpMax = hpMaxE;
    fill(255, 0, 0);
    ellipse(location.x,location.y,80,80);
    textSize(10);
    noStroke();
    rect(location.x - 50, location.y - 80, hp, 12);
    stroke(0);
    noFill();
    rect(location.x - 50, location.y - 80, 100, 12);
    fill(0);
    text( hp/2,location.x - 20, location.y - 69);
    text( "/" ,location.x, location.y - 69);
    text( hpMax/2,location.x + 10, location.y - 69);
    fill(255);
  }
  
  void update(){
    if (frameCount%30==0) {
      PVector dir = PVector.sub(hero.coord(), location);
      dir.normalize();
      dir.mult(4);
      Bullet bullet = new Bullet(location, dir, 10);
      bullets.add(bullet);
    }
    
  }
}
