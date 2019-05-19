class LifeBar {

  private
  
  int hp;
  int hpMax;
  
  public

  void display(PVector locationLb, int hpH, int hpMaxH){
    hp = hpH;
    hpMax = hpMaxH;
    textSize(10);
    noStroke();
    fill(255, 0, 0);
    rect(locationLb.x - 50, locationLb.y - 80, hp, 12);
    stroke(0);
    noFill();
    rect(locationLb.x - 50, locationLb.y - 80, 100, 12);
    fill(255);
    text( hp,locationLb.x - 20, locationLb.y - 69);
    text( "/" ,locationLb.x, locationLb.y - 69);
    text( hpMax,locationLb.x + 10, locationLb.y - 69);
    
    textSize(18);
    noStroke();
    fill(255, 0, 0);
    rect(55, 3 , hp*2, 20);
    stroke(0);
    noFill();
    rect(55, 3, 200, 20);
    fill(0);
    text( hp,90, 20);
    text( "/" ,140, 18);
    text( hpMax,170, 20);
  }

  void update(){
  }
}
