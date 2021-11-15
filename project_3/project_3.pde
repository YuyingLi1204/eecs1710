PImage img;
PImage imgOrigin;

void setup() {
  size(500, 480);  
  imgOrigin = loadImage("mydog.jpeg");
  img=loadImage("mydog.jpeg");
  img.loadPixels();
  imgOrigin.loadPixels();
println(img.width*1.0/img.height);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
         int loc = x + y * img.width;

         if(x<img.width*1.0/img.height*y){
         int replaceLoc = (img.width-1-x)+y*img.width;
         float r = 255-red(imgOrigin.pixels[replaceLoc]);
         float g = 255-green(imgOrigin.pixels[replaceLoc]);
         float b = 255-blue(imgOrigin.pixels[replaceLoc]);
         img.pixels[loc] =color(r,g,b);
      } 
    }
  }

  img.updatePixels();
}

void draw() { 
  for (int i=0; i<100; i++) {
    int index1 = int(random(0, img.pixels.length));
    int index2 = int(random(0, img.pixels.length));
    img.pixels[index2] = img.pixels[index1];
  }
  img.updatePixels();
  
  image(img, 0, 0);
}
