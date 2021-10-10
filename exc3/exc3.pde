float rotSeconds = 0;
float rotMinutes = 0;
float rotHours = 0;
int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;

float Clock = 600;
float SecondHand = 250;
float MinuteHand = 220;
float HourHand = 130;

color Outline_color = color(0);
color Secondhand_color = color(100, 123, 456);
color Clock_color = color(300, 200, 310);

void setup() {
  size(600, 600, P2D); 
  strokeWeight(2);
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  if (s != lastSecond) {
    rotSeconds = ((float) s / 60) * TWO_PI;
    lastSecond = s;
  }
  
  if (m != lastMinute) {
    rotMinutes = ((float) m / 60) * TWO_PI; 
    lastMinute = m;
  }
  
  if (h != lastHour) {
    rotHours = ((float) h / 12) * TWO_PI;  
    println(h);
    lastHour = h;
  }
  
  fill(Clock_color);
  stroke(Outline_color);
  ellipse(width/2, height/2, Clock, Clock);
  ellipse(300, 10, 20, 20);
  ellipse(300, 590, 20, 20);
  ellipse(10, 300, 20, 20);
  ellipse(590, 300, 20, 20);
  ellipse(444.5, 50, 20, 20);
  ellipse(444.5, 550, 20, 20);
  ellipse(50, 444.5, 20, 20);
  ellipse(550, 444.5, 20, 20);
  ellipse(550, 156, 20, 20);
  ellipse(156, 50, 20, 20);
  ellipse(50, 156, 20, 20);
  ellipse(156, 550, 20, 20);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotSeconds);
  fill(Secondhand_color);
  stroke(Secondhand_color);
  line(0, 0, 0, -SecondHand);
  ellipse(0,-SecondHand,10,10);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotMinutes);
  fill(0);
  stroke(Outline_color);
  line(0, 0, 0, -MinuteHand);
  ellipse(0, -MinuteHand, 10,10);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotHours);
  line(0, 0, 0, -HourHand);
  ellipse(0,-HourHand, 10,10);
  popMatrix();
  
  fill(Clock_color);
  ellipse(width/2, height/2, 20, 20);
}
