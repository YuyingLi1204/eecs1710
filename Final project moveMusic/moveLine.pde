class moveLine {
  ArrayList<PVector> vertexes = new ArrayList<PVector>();
  boolean isstartDraw = false;
  color strokeColor;
  int maxWeight;
  int maxLength;
  moveLine() {
    strokeColor = color(255, 255, 255);
    maxWeight = 10;
    //this.checkBoundary = null;
    maxLength = 200;
  }
  void startDraw() {
    isstartDraw = true;
  }
  void addVertex(PVector vertex) {
    vertexes.add(vertex);
    if(vertexes.size() > maxLength) {
      vertexes.remove(0);
    }
  }
  PVector checkBound(int i, PVector speed) {
    PVector next = PVector.add(vertexes.get(i), speed);
    if (0 > next.x){
      next.x=width-next.x;
    }
    else if(next.x > width) {
      next.x=next.x-width;
    }
    if (0 > next.y){
      next.y=height-next.y;
    }
    else if(next.y > height) {
      next.y=-height+next.y;
    }
    return next;
  }
    
  void  update() {
    if (!isstartDraw) return;
    if (vertexes.size() < 2) return;
    xy.clearWaves();
    for (int i = 0; i < vertexes.size(); i++) {
      
      
      PVector speed;
      if (i == vertexes.size() - 1) {
        speed =PVector.sub(vertexes.get(1), vertexes.get(0));
      } else {
        xy.line(vertexes.get(i).x, vertexes.get(i).y,vertexes.get(i+1).x, vertexes.get(i+1).y);
        speed =PVector.sub(vertexes.get(i+1), vertexes.get(i));
      }
      if(speed.x>width*4/5){
        speed.x=width-speed.x;
      }
      else if(speed.x<-width*4/5){
        speed.x=width+speed.x;
      }
      
      if(speed.y>height*4/5){
        speed.y=height-speed.y;
      }
      else if(speed.y <-height*4/5){
        speed.y=height+speed.y;
      }
      if(wallIf){
        vertexes.set(i,PVector.add(vertexes.get(i), speed));
      }
      else{ 
        vertexes.set(i,checkBound(i,speed));
      }
    }
  }

  void draw() {
    if (this.vertexes.size() < 2) return;
    
    pushMatrix();
    stroke(strokeColor);
    for (int i = 0; i < this.vertexes.size() - 1; i++) {
      strokeWeight(calcWeight(i));
      line(vertexes.get(i).x, vertexes.get(i).y,vertexes.get(i+1).x, vertexes.get(i+1).y);
      xy.line(vertexes.get(i).x, vertexes.get(i).y,vertexes.get(i+1).x, vertexes.get(i+1).y);
    }
    popMatrix();
    update();
  }

  float calcWeight(int i) {
    return map(
      vertexes.size() / 2 - abs(vertexes.size()/ 2 - i),
      0, vertexes.size()/ 2,
      0, maxWeight);
  }
}
