int thresholdDelta = 5;
int videoMode = 1;
void keyPressed() {
  switch(keyCode) {
    case UP:
      threshold += thresholdDelta;
      break;
    case DOWN:
      threshold -= thresholdDelta;
      break;
  }
  switch(keyCode) {
   case '1':
   videoMode = 1;
   break;
   case '2':
   videoMode = 2;
   break;
   case '3':
   videoMode = 3;
   break;
   case '4':
   videoMode = 4;
   break;
  }
  
  threshold = constrain(threshold, 0, 255);
  
  
}
import gab.opencv.*;

OpenCV openCV;

int threshold = 33;
boolean armOpenCvUpdate = false;
int scaler = 2;

void setupOpenCV(PImage img) { 
  openCV = new OpenCV(this, img);
}

void updateOpenCV(PImage img) {
  if (armOpenCvUpdate) {
    switch (videoMode) {
    case 1:
      openCV.loadImage(img);
      openCV.gray();
      openCV.threshold(threshold);
      armOpenCvUpdate = false;
      break;
    case 2:
      openCV.loadImage(img);
      openCV.gray();
      openCV.adaptiveThreshold(38, 1);
      img = openCV.getSnapshot();
      armOpenCvUpdate = false;
      break;
    case 3:
      openCV.loadImage(img);
      openCV.findScharrEdges(OpenCV.HORIZONTAL);
      openCV.findSobelEdges(1, 0);
      img = openCV.getSnapshot();


      armOpenCvUpdate = false;
      break;
    case 4:
      openCV.loadImage(img);
      openCV.findCannyEdges(threshold, 75);
      img = openCV.getSnapshot();
    }
  }
}
import processing.video.*;

Movie movie;
Capture capture;

// both of the above objects will be drawing to the PImage videoImg
PImage videoImg;

void setupCapture(int whichCamera) {  
  String[] cameraNames = capture.list();
  for (String cameraName : cameraNames) {
    println(cameraName);
  }
  capture = new Capture(this, 320, 240, cameraNames[whichCamera], 30);    
  capture.start();
}

void setupMovie(String movieUrl) {  
  movie = new Movie(this, movieUrl);
  movie.loop();
  movie.volume(0);
}

void captureEvent(Capture c) {
  c.read();
  videoImg = c;
  armOpenCvUpdate = true;
}

void movieEvent(Movie m) {
  m.read();
  videoImg = m;
  armOpenCvUpdate = true;
}
void setup() {
 size(640, 480, FX2D);
 //setupCapture(0);
 setupMovie("cat.mp4");
}

void draw() {
 background(0);
 
   if (videoImg != null) {
    if (openCV == null) {
      setupOpenCV(videoImg);
    } else {
      updateOpenCV(videoImg);
    }

    image(openCV.getSnapshot(), 0, 0);
   }
 
  surface.setTitle("" + frameRate);
  
  println(videoMode);
  println("threshold: " + threshold);
}
