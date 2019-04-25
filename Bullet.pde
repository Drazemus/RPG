class Bullet extends PVector {

  private

  PVector locationB = new PVector(900/2, 900/2);//point actuel
  PVector vel; // contains speed for x and y...

  public
    
    Bullet(PVector hero, PVector vel) {
      super(hero.x, hero.y);
      locationB.x=hero.x;
      locationB.y=hero.y;
      this.vel = vel.get();
   }

  void display() {   
    fill(255);
    ellipse(x, y, 10, 10);
  }

  void update() {
    add(vel);
  }
}