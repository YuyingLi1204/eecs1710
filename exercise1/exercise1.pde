color background_Color = color(20, 50, 100);
float circle_Size = 80;

void setup() {
  size(800, 600, P2D); // P2D enables 2D GPU acceleration
  background(background_Color);
}

void draw() {  
  if (mousePressed) {
    rectMode(CENTER);
    fill(270, 200, 12);
    stroke(255, 0, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY,circle_Size,circle_Size);
  }
}
