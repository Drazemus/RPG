
PImage[] SallesD = new PImage[8];
PImage[] SallesG = new PImage[8];
PImage[] SallesH = new PImage[8];
PImage[] SallesB = new PImage[8];
PImage[][] Salles = {SallesD,SallesG,SallesH,SallesB};

void genereSalles(){
  
  //sortie 0
  SallesD[0] = loadImage("1porteG.PNG");
  SallesD[1] = loadImage("2portesBG.png");
  SallesD[2] = loadImage("2portesGD.png");
  SallesD[3] = loadImage("2portesHG.png");
  SallesD[4] = loadImage("3portesB.png");
  SallesD[5] = loadImage("3portesG.png");
  SallesD[6] = loadImage("3portesH.png");
  SallesD[7] = loadImage("4portes.png");
  
  //sortie 1
  SallesG[0] = loadImage("1porteD.PNG");
  SallesG[1] = loadImage("2portesBD.png");
  SallesG[2] = loadImage("2portesHD.png");
  SallesG[3] = loadImage("2portesGD.png");
  SallesG[4] = loadImage("3portesH.png");
  SallesG[5] = loadImage("3portesD.png");
  SallesG[6] = loadImage("3portesB.png");
  SallesG[7] = loadImage("4portes.png");
  
  //sortie 2
  SallesH[0] = loadImage("1porteB.PNG");
  SallesH[1] = loadImage("2portesBD.png");
  SallesH[2] = loadImage("2portesHB.png");
  SallesH[3] = loadImage("2portesBG.png");
  SallesH[4] = loadImage("3portesB.png");
  SallesH[5] = loadImage("3portesD.png");
  SallesH[6] = loadImage("3portesG.png");
  SallesH[7] = loadImage("4portes.png");
  
  //sortie 3
  SallesB[0] = loadImage("1porteH.PNG");
  SallesB[1] = loadImage("2portesHB.png");
  SallesB[2] = loadImage("2portesHD.png");
  SallesB[3] = loadImage("2portesHG.png");
  SallesB[4] = loadImage("3portesH.png");
  SallesB[5] = loadImage("3portesD.png");
  SallesB[6] = loadImage("3portesG.png");
  SallesB[7] = loadImage("4portes.png");

}

class Salle {
  
  private

  PVector locationH = new PVector(900/2, 900/2);//point actuel
  boolean D = false;
  boolean G = false;
  boolean H = false;
  boolean B = false;
  int h = 240;
  int l = 10;
  int nb = 0;
  int sortie = 1;
  
  public
  
  boolean tpD(){
    return D;
  }
  boolean tpG(){
    return G;
  }
  boolean tpH(){
    return H;
  }
  boolean tpB(){
    return B;
  }
  
  int nombre(){
    return nb;
  }
  
  int sortieH(){
    return sortie;
  }

  void display(){
    
    fill(0,0,255);
    
    if ((sortie == 0 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 3 && ( nb == 3 || nb == 4 || nb == 6)) || (sortie == 2 && ( nb == 3 || nb == 4 || nb == 6)) || (sortie == 1 && ( nb == 3 || nb == 4 || nb == 6)) || nb == 7)rect(0, 330, l, h);  //portail G 0
    if ((sortie == 1 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 0 && ( nb == 2 || nb == 4 || nb == 6)) || (sortie == 3 && ( nb == 2 || nb == 4 || nb == 6)) || (sortie == 2 && ( nb == 1 || nb == 4 || nb == 5)) || nb == 7)rect(890, 330, l, h);//portail D 1
    if ((sortie == 2 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 1 && ( nb == 1 || nb == 5 || nb == 6)) || (sortie == 0 && ( nb == 1 || nb == 4 || nb == 5)) || (sortie == 3 && ( nb == 1 || nb == 5 || nb == 6)) || nb == 7)rect(330, 890, h, l);//portail B 2
    if ((sortie == 3 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 2 && ( nb == 2 || nb == 5 || nb == 6)) || (sortie == 1 && ( nb == 2 || nb == 4 || nb == 5)) || (sortie == 0 && ( nb == 3 || nb == 5 || nb == 6)) || nb == 7)rect(330, 0, h, l);  //portail H 3
  }
  
  void update(PVector hero){
    
    //importation de la position du hero
    locationH.x=hero.x;
    locationH.y=hero.y;
    
    //test zone de tp
    if ((sortie == 1 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 0 && ( nb == 2 || nb == 4 || nb == 6)) || (sortie == 3 && ( nb == 2 || nb == 4 || nb == 6)) || (sortie == 2 && ( nb == 1 || nb == 4 || nb == 5)) || nb == 7){
      
      if(locationH.x > 860 && (locationH.y > 330 && locationH.y < 570)){
        D = true;
        nb=(int)random(8);
        print("D");
        sortie = 0;
      }
    }
    if ((sortie == 0 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 3 && ( nb == 3 || nb == 4 || nb == 6)) || (sortie == 2 && ( nb == 3 || nb == 4 || nb == 6)) || (sortie == 1 && ( nb == 3 || nb == 4 || nb == 6)) || nb == 7){
      if(locationH.x < 40 && (locationH.y > 330 && locationH.y < 570)){
        G = true;
        nb=(int)random(8);
        print("G");
        sortie = 1;
      }
  }
  if ((sortie == 3 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 2 && ( nb == 2 || nb == 5 || nb == 6)) || (sortie == 1 && ( nb == 2 || nb == 4 || nb == 5)) || (sortie == 0 && ( nb == 3 || nb == 5 || nb == 6)) || nb == 7){  
      if(locationH.y < 40 && (locationH.x > 330 && locationH.x < 570)){
        H = true;
        nb=(int)random(8);
        print("H");
        sortie = 2;
      }
  }
  if ((sortie == 2 && ( nb == 0 || nb == 1 || nb == 2 || nb == 3 || nb == 4 || nb == 5 || nb == 6)) || (sortie == 1 && ( nb == 1 || nb == 5 || nb == 6)) || (sortie == 0 && ( nb == 1 || nb == 4 || nb == 5)) || (sortie == 3 && ( nb == 1 || nb == 5 || nb == 6)) || nb == 7){  
      if(locationH.y > 860 && (locationH.x > 330 && locationH.x < 570)){
        B = true;
        nb=(int)random(8);
        print("B");
        sortie = 3;
      }
  }
    
    //Au click le personnage peut se deplacer de nouveau
    if (mousePressed == true)if(mouseButton == RIGHT){
      D = false;
      G = false;
      H = false;
      B = false;
    }
  }
}
