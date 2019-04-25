
PImage[] SallesD = new PImage[8];
PImage[] SallesG = new PImage[8];
PImage[] SallesH = new PImage[8];
PImage[] SallesB = new PImage[8];
PImage[] Salles ;//= {SallesD,SallesG,SallesH,SallesB};

void genereSalles(){
  //background(Salles[nb]);
  
  SallesD[0] = loadImage("1porteG.PNG");
  SallesD[1] = loadImage("2portesBG.png");
  SallesD[2] = loadImage("2portesGD.png");
  SallesD[3] = loadImage("2portesHG.png");
  SallesD[4] = loadImage("3portesB.png");
  SallesD[5] = loadImage("3portesG.png");
  SallesD[6] = loadImage("3portesH.png");
  SallesD[7] = loadImage("4portes.png");
  
  SallesG[0] = loadImage("1porteD.PNG");
  SallesG[1] = loadImage("2portesBG.png");
  SallesG[2] = loadImage("2portesBG.png");
  SallesG[3] = loadImage("2portesBG.png");
  SallesG[4] = loadImage("3portesB.png");
  SallesG[5] = loadImage("3portesB.png");
  SallesG[6] = loadImage("3portesB.png");
  SallesG[7] = loadImage("4portes.png");
  
  SallesH[0] = loadImage("1porteB.PNG");
  SallesH[1] = loadImage("2portesBG.png");
  SallesH[2] = loadImage("2portesBG.png");
  SallesH[3] = loadImage("2portesBG.png");
  SallesH[4] = loadImage("3portesB.png");
  SallesH[5] = loadImage("3portesB.png");
  SallesH[6] = loadImage("3portesB.png");
  SallesH[7] = loadImage("4portes.png");
  
  SallesB[0] = loadImage("1porteH.PNG");
  SallesB[1] = loadImage("2portesBG.png");
  SallesB[2] = loadImage("2portesBG.png");
  SallesB[3] = loadImage("2portesBG.png");
  SallesB[4] = loadImage("3portesB.png");
  SallesB[5] = loadImage("3portesB.png");
  SallesB[6] = loadImage("3portesB.png");
  SallesB[7] = loadImage("4portes.png");
}

int sortie=3;
//PImage salles=Salles[sortie];
int nb=(int)random(8);

class Salle {
  
  private

  PVector locationH = new PVector(900/2, 900/2);//point actuel
  boolean teleport = false;
  boolean D = false;
  boolean G = false;
  boolean H = false;
  boolean B = false;
  int h = 240;
  int l = 10;
  
  public
  
  boolean tp(){
    return teleport;
  }

  void display(){
    fill(0, 0, 255);
    rect(890, 330, l, h);
    rect(0, 330, l, h);
    rect(330, 0, h, l);
    rect(330, 890, h, l);
  }
  
  void update(PVector hero){
    
    //importation de la position du hero
    locationH.x=hero.x;
    locationH.y=hero.y;
    
    //test zone de tp
    if(locationH.x > 860 && (locationH.y > 330 && locationH.y < 570)){
      D = true;
      teleport = true;
      print("D");
    }
    
    if(locationH.x < 40 && (locationH.y > 330 && locationH.y < 570)){
      G = true;
      //teleport = true;
      print("G");
    }
    
    if(locationH.y < 40 && (locationH.x > 330 && locationH.x < 570)){
      H = true;
      //teleport = true;
      print("H");
    }
    
    if(locationH.y > 860 && (locationH.x > 330 && locationH.x < 570)){
      B = true;
      //teleport = true;
      print("B");
    }
    
    //Au click le personnage peut se deplacer de nouveau
    if (mousePressed == true)if(mouseButton == RIGHT)teleport = false;
  }
  
}