class Boule
{
  private 
    int x;
    int y;
  public 
    Boule(int init_posx, int init_posy)
  {
    x=init_posx;
    y=init_posy;
  }
  int deplacement(int mx, int my)
  {
    int vx=mx-x;
    int vy=my-y;
    return x;
  }
}