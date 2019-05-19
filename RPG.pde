//import processing.sound.*;

//SoundFile music;
//SoundFile fire;

PImage curseur;
PImage playButton;
PImage playButtonClicked;
PImage fond;
PImage vines;

int controle[] = new int[7];

int hpH = 100;
int hpMaxH = 100;
int hpE = 100;
int hpMaxE = 100;

int nbE;

int[] scoreActu = new int[1];
int maxScore;

Hero hero = new Hero();
Salle salle = new Salle();
LifeBar lifeBar = new LifeBar();

ArrayList<Bullet> bullets;
ArrayList<Ennemi> ennemis;

//detection du click
boolean click = false;

boolean affichageSalle = false;

boolean play = false;
boolean spawn = true;

void setup() {

  //on enlève la souris pour ajouter notre propre curseur
  noCursor();

  genereSalles();

  //definition propriété de l'affichage
  size(900, 900);
  background(125);

  //Creation d'une Arraylist pour bullets
  bullets = new ArrayList();
  ennemis = new ArrayList();

  //chargement et resize des images
  curseur = loadImage("curseur.PNG");
  curseur.resize(75, 75);
  
  playButton = loadImage("play_button.png");
  playButton.resize(372, 115);
  
  playButtonClicked = loadImage("play_buttonClicked.png");
  playButtonClicked.resize(380, 120);
  
  fond = loadImage("fond.png");
  fond.resize(900, 354);
  
  vines = loadImage("vine.png");
  vines.resize(900, 255);
  
  //titre de la fenêtre
  surface.setTitle("Infinite Dongeon");
  
  //initialisation score
  scoreActu[0] = 0;
 
  //fire = new SoundFile(this, "161195__aleksnascimento__glock-shot-sound-effect.wav");
}

void draw() {

  if (play == false) {
    background(SallesD[7]);
    image(playButton, 450, 450);
    image(fond, 450, 723);
    image(vines, 450, 127);
    textSize(85);
    text("INFINITE DONGE   N", 40, 340);
    portal1.resize(100, 100);
    image(portal1, 750, 310);

    if (mouseX > 310 && mouseX < 590 && mouseY > 390 && mouseY < 510) {
      image(playButtonClicked, 450, 450);
      if (mousePressed == true)play = true;
    }
  }

  if (play == true) {

    if (controle[4] == 1) {

      background(0);
      rect(350, 400, 200, 100);
      if (mouseX > 310 && mouseX < 590 && mouseY > 390 && mouseY < 510) {
        if (mousePressed == true)play = false;
      }
    } else {

      if (salle.tpD() == true || salle.tpG() == true || salle.tpH() == true || salle.tpB() == true) {
        affichageSalle = true;
        bullets.clear();
        if(spawn == true){
          Ennemi ennemi = new Ennemi(random(50,850),random(50,850));
          ennemis.add(ennemi);
          spawn = false;
        }
      }

      if (affichageSalle == true) {
        background(Salles[salle.sortieH()][salle.nombre()]);
      } else background(SallesG[0]);

      nbE = ennemis.size();
      println(maxScore);
      
      for (int b = bullets.size(); b-- != 0;)
        if (bullets.get(b).script()) {
          bullets.remove(b);
      }
      
      //test si les balles touchent un ennemi et enleve des pts de vie si oui
      for (int z = ennemis.size(); z-- != 0;) {
        if(hpE <= 1){
          ennemis.remove(z);
          hpE = 100;
          scoreActu[0] = scoreActu[0] + 10;
          if(scoreActu[0] > maxScore){
            String[] score = new String[1];
            score[0] = scoreActu[0] + "\t";
            saveStrings("scores.txt", score);
          }
        }
        else for (int b = bullets.size(); b-- != 0;)
                if (bullets.get(b).checkHitE(ennemis.get(z).coord())) {
                  bullets.remove(b);
                  hpE = hpE - 3;
                  println("touché !");
                }
      }
      
      //test si les balles touchent le hero et enleve des pts de vie si oui
      for (int b = bullets.size(); b-- != 0;)
        if (bullets.get(b).checkHitH(hero.coord()) == true) {
          bullets.remove(b);
          hpH = hpH - 3;
          if(hpH < 0)hpH = hpMaxH;
          println("je suis touché !");
        }
        
      text(scoreActu[0],800,20);

      //controle souris
      controle();

      //balles
      for (Bullet bullet : bullets) {
        bullet.update();
        bullet.display();
      }
      
      for (Ennemi ennemi : ennemis) {
        ennemi.update();
        ennemi.display(hpE, hpMaxE);
      }

      //personnage  
      hero.display();
      hero.update(click, salle.tpD(), salle.tpG(), salle.tpH(), salle.tpB(), salle.sortieH(), salle.nombre());

      //barre de vie
      lifeBar.display(hero.coord(), hpH, hpMaxH);
      lifeBar.update();

      //salle en fond
      salle.display(nbE);
      salle.update(hero.coord(), nbE);
    }
  }

  //affichage curseur
  imageMode(CENTER);
  image(curseur, mouseX, mouseY);
  fill(255);
  //text(mouseX, mouseX-40, mouseY-40);
  //text(mouseY, mouseX+20, mouseY-40);
}

void mousePressed() {
  if (mouseButton == LEFT)controle[1]=1;
  if (mouseButton == RIGHT)controle[2]=1;
}

void mouseReleased() {
  if (mouseButton == LEFT)controle[1]=0;
  if (mouseButton == RIGHT){
    controle[2]=0;
    spawn = true;
  }
}

void keyPressed() {
  if (keyCode == 'A')controle[3]=1;
  if (keyCode == 'P')controle[4]=1;
}

void keyReleased() {
  if (keyCode == 'A')controle[3]=0;
  if (keyCode == 'P')controle[4]=0;
}

void controle() {
  if (controle[1] == 1 || controle[3] == 1 && (salle.tpD() == false || salle.tpG() == false || salle.tpH() == false || salle.tpB() == false)) {
    PVector mouse = new PVector(mouseX, mouseY);
    if (frameCount%5==0) {
      PVector dir = PVector.sub(mouse, hero.coord());
      dir.normalize();
      dir.mult(9);
      Bullet bullet = new Bullet(hero.coord(), dir, 5);
      bullets.add(bullet);
      //fire.play();
    }
  }
  if (controle[2] == 1)click = hero.onclickH();
}
