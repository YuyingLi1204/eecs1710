LetterGenerator lg;
String input = "acbdl";


void setup() {
  size(1200, 600, P2D);
  lg = new LetterGenerator(input, 0, height/2);
}

void draw() {
  background(255,192,203);
  
  lg.run(); 
}


class Letter {
  
  PShape s;
  PVector position;
  PVector[] vertices;
  float spread = 0.2;
  
  Letter(PShape _s, float x, float y) {
    s = _s;
    position = new PVector(x, y);
    vertices = new PVector[s.getVertexCount()];
  }
  
  void update() {
    for (int i=0; i<vertices.length; i++) {
      vertices[i] = s.getVertex(i);
      vertices[i].add(new PVector(random(-spread, spread), random(-spread, spread)));
      s.setVertex(i, vertices[i]);
    }
  }
  
  void draw() {
    shapeMode(CENTER);
    shape(s, position.x, position.y);
  }
  
  void run() {
    update();
    draw();
  }
  
}
class LetterGenerator {
  
  PShape a, b, c, d,l;
  ArrayList<Letter> letters;
  PVector position;
  float offset = 180;
  color col;
 
  LetterGenerator(String input, float x, float y) {
    initShapes();
    position = new PVector(x, y);
    letters = new ArrayList<Letter>();
     
    for (int i=0; i<input.length(); i++) {     
      char ch = input.charAt(i);
      
      float px = position.x + ((i+1) * offset);
      float py = position.y;
      
    switch(ch) {
        case 'a':
          letters.add(new Letter(a, px, py));
          break;
        case 'b':
          letters.add(new Letter(b, px, py));
          break;
        case 'c':
          letters.add(new Letter(c, px, py));
          break;
        case'd':
           letters.add(new Letter(d, px, py));
        case'l':
           letters.add(new Letter(l, px, py));
      }
    }
    
  }

  void initShapes() {
    a = createShape();
    a.beginShape();
    a.translate(170, 10);
    a.vertex(4, -3);
    a.fill(233,120,100);
    a.vertex(-180, 353.);
    a.vertex(-43, 220.);
    a.vertex(57., 219.);
    a.vertex(177, 358);
    a.beginContour();
    a.vertex(-40,180);
    a.vertex(0, 60);
    a.vertex(40,180);
    a.endContour();
    a.endShape(CLOSE);
    
    b = createShape();
    b.beginShape();
    b.fill(244,164,96);
    b.translate(50, 10);
    b.vertex(0.0, 0.0);
    b.vertex(-11, 313);
    b.vertex(202.4, 230.7);
    b.vertex(59., 145.7);
    b.vertex(205, 25);
    b.beginContour();
    b.vertex(40,120);
    b.vertex(40, 30);
    b.vertex(120, 50);
    b.endContour();
    b.beginContour();
    b.vertex(30,260);
    b.vertex(30, 180);
    b.vertex(110, 230);
    b.endContour();
    b.endShape(CLOSE);   
    
    c = createShape();
    c.beginShape();
    c.fill(255,165,0);
    c.translate(220, 0);
    c.vertex(0.0, 0.0);
    c.vertex(-177.5, -7.7);
    c.vertex(-169, 282);
    c.vertex(51, 269);
    c.vertex(-127, 247);
    c.vertex(-146.6, 21);
    c.endShape(CLOSE);
    
    d = createShape();
    d.beginShape();
    d.fill(255,160,122);
    d.translate(50, 10);
    d.vertex(0, 0);
    d.vertex(-11, 313);
    d.vertex(202, 230.5);
    d.vertex(205, 25);
    d.beginContour();
    d.vertex(40,30);
    d.vertex(160, 45);
    d.vertex(185, 195);
    d.vertex(30, 260);
    d.endShape(CLOSE);
    
    l = createShape();
    l.beginShape();
    l.fill(255,127,80);
    l.translate(420, 0);
    l.vertex(0, 0);
    l.vertex(-50, -10);
    l.vertex(-170, 282);
    l.vertex(51, 269);
    l.vertex(-120, 247);
    l.endShape(CLOSE);
    
  }
  
  void update() {
    //
  }
  
  void draw() {
    for (Letter letter : letters) {
      letter.run();
    }
  }
  
  void run() {
    update();
    draw();
  }

}
