class Bullet extends PVector {

  private
  PVector vel; // contains speed for x and y...
  int size;
  boolean isOuttaBounds;
  boolean hitE;
  boolean hitH;

  public
    
    Bullet(PVector pos, PVector vel, int s){
      super(pos.x, pos.y);
      this.vel = vel.get();
      size = s;
   }

  void display() {
    ellipse(x,y,size,size);
  }

  void update() {
    add(vel);
    if(x < 35 || x > 865 || y < 35 || y > 865)isOuttaBounds = true;
  }

  boolean script() {
    return isOuttaBounds;
  }
  
  boolean checkHitE(PVector posE) {
    if(size == 5){
      float distX = posE.x - x;
      float distY = posE.y - y;
      float distance = sqrt((distX*distX) + (distY*distY));
      if (distance <= 5+40)hitE = true;
    }
    else hitE =false;
    
    return hitE;
  }
  
  boolean checkHitH(PVector posH) {
    if(size == 10){
      float distX = posH.x - x;
      float distY = posH.y - y;
      float distance = sqrt((distX*distX) + (distY*distY));
      if (distance <= 5+40)hitH = true;
    }
    else hitH =false;
    
    return hitH;
  }
}
