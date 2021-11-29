PShader shader;

void setup() {
  size(800, 600, P2D);
  shader = loadShader("example.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("rate", 0.5);
  shader.set("depth", 0.5);
}

void draw() {
  background(255);
  
  stroke(0, 255, 0);
  fill(0, 100, 250);
  ellipse(width/2, height/2, 400, 400);
  ellipse(100, height/2, 200, 200);

  shader.set("time", float(millis())/1000.0);
  shader.set("tex0", get());

 shader(shader);
}
