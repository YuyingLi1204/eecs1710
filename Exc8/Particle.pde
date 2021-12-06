class Particle {

  PVector pos;  //position
  PVector speed;
  int timeStamp; //determine how old something is
  float particleSize = 200;
  float floor;    //the ground xD

  Particle(float x, float y) {
    pos = new PVector(x, y);
    timeStamp = millis();
    speed = new PVector(random(-1, 1), random(-1, 1));  //random x, y that is positive or negative
    floor = height + particleSize;
  }

  void update() {

    speed.mult(friction);  //speed slows down wih friction, multiplied
    pos.add(speed);      //each position is updated by speed
    pos.y += gravity;  //update the y position of the particles to the gravity

    pos.y = constrain(pos.y, 0, floor);  //??
  }

  void draw() {

    //Discoruce Processing, ansewered by noel   https://discourse.processing.org/t/galaga-scrolling-background/26527/2
    //foreground objects loop around the background
    /*
    image(img, 0, -height+y);
     image(img, 0, y++);
     if (y > height) y = 0;
     */

     noStroke();
     colorMode(HSB);
     fill(0, 0, 75);
     ellipse(pos.x, pos.y, particleSize, particleSize);
     
     /*
     if (pos.y == floor) {    //when the particles hit the floor, teleport back up to the celling
       pos.y = 0;
       pos.x = random(width);
       speed.equals(0);
       //speed.equals(0) doesnt do anything. However, the gravity delta is 0 so there is no acceleration
     }
     */
     
     //Same thing as commeted code above, but it teleports when beyond the particle's size
     if (pos.y == floor) {    //when the particles hit the floor, teleport back up to the celling
       pos.y = (particleSize);
       pos.x = random(width);
       speed.equals(0);
       //speed.equals(0) doesnt do anything. However, the gravity delta is 0 so there is no acceleration
     }
  }

  void run() {
    update();
    draw();
  }
}
