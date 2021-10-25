class Enemy{
  PVector position;
  float velocity;
  boolean alive=true;
  Enemy(){
    position=new PVector(random(50,width-50),random(-30,30));
    velocity=0.5;
  }
  void update(){
    position.y+=velocity;
    if(position.y>height+100){
      alive=false;
    }
  }
  void detect(Bullet b){
    if(b.position.dist(position)<20){
      Boom boom= new Boom(position);
      booms.add(boom);
          alive=false;

    }
  }
  
  void dispaly(){
    imageMode(CENTER);
    image(img2,position.x,position.y);
  }
  void run(){
    update();
    dispaly();
  }
  
}
