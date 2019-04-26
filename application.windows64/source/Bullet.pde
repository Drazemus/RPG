class Bullet {

  private

  PVector locationB = new PVector(900/2, 900/2);//point actuel
  PVector velocity; // contains speed for x and y...

  final float bulletFlySpeed = 4.2;
  final int fireSpeed=10;
  int lastFired=millis();
  int ammoCount = 70;

  public

    Bullet(PVector hero) {
    locationB.x=hero.x;
    locationB.y=hero.y;
  }

  void display() {   
    fill(255);
    ellipse(locationB.x, locationB.y, 10, 10);
  }

  void update() {
  }
}