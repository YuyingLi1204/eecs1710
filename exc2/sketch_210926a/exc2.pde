PImage img1, img2, bg;
float x = 250;
float y = 250;
float s = 200;
float speed = 5;


void setup() {
  size(800, 600, P2D);
  
  img1 = loadImage("surfing.png");
  img2 = loadImage("coconut.png");
  bg = loadImage("background.jpeg");
  
}

void draw() {
  imageMode(CORNER);
  image(bg, 0, 0, width, height);
  
  imageMode(CENTER);
  image(img2, mouseX, mouseY, 80, 80);
  
  imageMode(CORNER);
  image(img1, x, y, s, s);
  x += speed;
  
  if (x > width || x <0) {
    speed *= -1;
  }
  


}
