boolean isDragged = false;
moveLine getLine;
boolean wallIf=true;
void setup() {
  fullScreen(P2D);
  setupXYscope();
  getLine = new moveLine();
  textSize(35);
}

void draw() {
  background(0);
  pushMatrix();
  updateXYscope();
  if(wallIf == false){
    fill(255,0,0);
    rect(50,50,260,100);
    fill(0);
    translate(50+75,50+65);
    text("Boundary",0,0);
  }
  else{
    fill(0,255,0);
    rect(50,50,260,100);
    fill(0);
    translate(50+20,50+65);
    text("No Boundary",0,0);
  }
  popMatrix();
  getLine.draw();
}

void mousePressed() {
  if(mouseX >= 50 && mouseX<=50+260 && mouseY >= 50 && mouseY<=50+100){
      wallIf=!wallIf;
  }
  else{
    getLine = new moveLine();
  }
}
void mouseReleased() {
  if(getLine.vertexes.size() >= 3) {
    getLine.startDraw();
  }
}

void mouseDragged() {
  PVector location = new PVector(mouseX, mouseY);
  //xy.line(mouseX, mouseY, pmouseX, pmouseY);
  getLine.addVertex(location);
}

void keyPressed() {
  if (keyCode == 8) { // DELETE
    xy.clearWaves();
  }
}
