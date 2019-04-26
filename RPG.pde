PImage curseur;

int controle[]=new int[7];

Hero hero = new Hero();
Salle salle = new Salle();

ArrayList<Bullet> bullets;

//detection du click
boolean click = false;

boolean affichageSalle = false;

boolean remove = false;

void setup() {

  //on enlève la souris pour ajouter notre propre curseur
  noCursor();
  
  genereSalles();
  
  //definition propriété de l'affichage
  size(900, 900);
  background(125);

  //Creation d'une Arraylist pour bullets
  bullets = new ArrayList();

  //chargement et resize des images
  curseur = loadImage("curseur.PNG");
  curseur.resize(75, 75);
}

void draw() {
    
  if(salle.tpD()==true || salle.tpG() == true || salle.tpH() == true || salle.tpB() == true)affichageSalle = true;
  if(salle.tpD()==true || salle.tpG() == true || salle.tpH() == true || salle.tpB() == true)bullets.clear();
  
  if(affichageSalle == true)background(Salles[salle.sortieH()][salle.nombre()]);
  else background(SallesG[0]);
  
  //controle souris
  controle();
  //personnage  
  hero.display();
  hero.update(click, salle.tpD(),salle.tpG(),salle.tpH(),salle.tpB(),salle.sortieH(),salle.nombre());

  //salle en fond
  salle.display();
  salle.update(hero.coord());
 
  for (Bullet bullet : bullets) {
    bullet.update();
    bullet.display();
  }

  //affichage curseur
  imageMode(CENTER);
  image(curseur, mouseX, mouseY);
  fill(255);
  text(mouseX,mouseX-40,mouseY-40);
  text(mouseY,mouseX+20,mouseY-40);
}

void mousePressed() {
  if (mouseButton == LEFT)controle[1]=1;
  if (mouseButton == RIGHT)controle[2]=1;
}

void mouseReleased() {
  if (mouseButton == LEFT)controle[1]=0;
  if (mouseButton == RIGHT)controle[2]=0;
}

void keyPressed(){
  if (keyCode == 'A')controle[3]=1;
}

void keyReleased(){
  if (keyCode == 'A')controle[3]=0;
}

void controle() {
  if (controle[1] == 1 || controle[3] == 1){
    PVector mouse = new PVector(mouseX, mouseY);
    if (frameCount%5==0) {
        PVector dir = PVector.sub(mouse, hero.coord());
        dir.normalize();
        dir.mult(9);
        Bullet bullet = new Bullet(hero.coord(), dir);
        bullets.add(bullet);
      }
  }
  if (controle[2] == 1)click = hero.onclickH();
}
