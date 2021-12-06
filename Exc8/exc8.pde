//Nickfox Geig, Shaders04  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week12/Shaders04
//Nick Fox geig, Gravity01  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Gravity01
PShader shader;

int numParticles = 10;
Particle[] particles = new Particle[numParticles];

//float gravity = 0.4;  //strength of attraction (the floor in this case)
//float gravityDelta = 0.01;  //increment gravity (falling faster)
//No acceleration \/
float gravity = 0.9; 
float gravityDelta = 0;

float friction = 0.99;  //slipperieness
//float friction = 1;  //slipperieness
float floor;    //the ground xD

void setup() {
  size(1280, 720, P2D);
  shader = loadShader("example_modified.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("rate", 1.0);
  shader.set("depth", 1.0);

  //Nick Fox geig, Gravity01  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Gravity01
  for (int i=0; i<numParticles; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  background(0);
  
  //ellipse(width/2 + width/4, height/2, 400, 400);
  //0ellipse(width/2 - width/4, height/2, 400, 400);

  shader.set("time", float(millis())/1000.0);
  shader.set("tex0", get());

  shader(shader);

  //Nick Fox geig, Gravity01  https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Gravity01
  for (int i=0; i<particles.length; i++) {
    particles[i].run();
  }
  
  gravity += gravityDelta;
}
