class Boom{
  PVector position;
    boolean alive;
      int timestamp;

  int lifetime = 500;
  Boom(PVector _position){
    position = _position;
    alive=true;
    timestamp = millis();
  }
  void display(){
    if (alive && millis() > timestamp + lifetime) alive = false;
    if(alive){
       imageMode(CENTER);
      image(img3,position.x,position.y);
    }
  }

}
