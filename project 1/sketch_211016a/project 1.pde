PImage dog1;
PImage bone;
PImage dog2,dog3,room;
PVector dog;
PVector mouse;

void setup(){
    size(800,600);
    dog1=loadImage("dog1.png");
        bone=loadImage("bone.png");
    dog2=loadImage("dog2.png");
        dog3=loadImage("dog3.png");
    room=loadImage("room.jpg");
    dog=new PVector(width/2,height/2);
    
}

void draw(){
  mouse=new PVector(mouseX,mouseY);
    imageMode(CENTER);
    image(room,width/2,height/2,width,height);
    if(mouse.dist(dog)>5){
      PVector distance =mouse.copy();
    distance.sub(dog);
    distance.normalize();
    distance.mult(5);
    dog.add(distance);
    }
    
    

    if(mouse.dist(dog)<100){
          image(dog3,dog.x,dog.y,155,155);
    }else if(mouse.dist(dog)<300
  ){
    image(dog2,dog.x,dog.y,140,140);
  }else{
        image(dog1,dog.x,dog.y,160,160);

  }
      image(bone,mouse.x,mouse.y,100,100);


    
}
