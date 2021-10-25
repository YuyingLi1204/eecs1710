PImage img, img1, img2, img3;
ArrayList<Boom> booms;
int xp = 500;
int step = 2;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
void setup() {
  size(800, 600);
  img1 = loadImage("sky.jpg");
  img1.resize(800, 600);
  img = loadImage("plane.png");
  img.resize(100, 100);
  img2 = loadImage("ufo.png");
  img2.resize(50, 50);
  img3 = loadImage("boom.png");
  bullets = new ArrayList();
  booms= new ArrayList();
  enemies=new ArrayList();
  for (int i=0; i<5; i++) {
    Enemy e = new Enemy();
    enemies.add(e);
  }
}


void draw() {
  background(img1);
  imageMode(CENTER);
  image(img, xp, 550);
  
  xp+=step;
  if (xp > width-50) {
    xp = width-50;
    step = -2;
  }
  if (xp < 50) {
    xp = 50;
    step = 2;
  }
  for (int i=0; i<bullets.size(); i++) {
    bullets.get(i).run();
    if (bullets.get(i).alive==false) {
      bullets.remove(i);
    }
  }

  for (int i=0; i<enemies.size(); i++) {
    enemies.get(i).run();
    for (int j=0; j<bullets.size(); j++) {
      enemies.get(i).detect(bullets.get(j));
     
    }
    if (enemies.get(i).alive==false) {
      enemies.remove(i);
    }
  }
  for (int i=0; i<booms.size(); i++) {
    booms.get(i).display();
    if (booms.get(i).alive==false) {
      booms.remove(i);
    }
  }
  if(frameCount%200==0){
    Enemy e = new Enemy();
    enemies.add(e);  }
}
void keyPressed() {
  if (key==' ') {
    Bullet b = new Bullet(xp, 500, 0);
    bullets.add(b);
  }
}
