float scaleAmp = 1000;
float scaleFreq = 1000;
PImage bg, img1, img2;
float x = 0;
float y = 250;
float s = 300;

void setup() {
  size(800, 600, P2D); 
  bg = loadImage("bg.jpeg");
  bg.resize(800,600);
  img1 = loadImage("sandbag.png");
  img2 = loadImage("pang.png");
  setupSound();
}

void draw() {
  imageMode(CENTER);
  background(bg);
  
  imageMode(CORNER);
  image(img1, x, y, s, s);
  updateSound();
  
  println("amp: " + amp + " freq: " + freq);

  rectMode(CENTER);
  float fillValR = constrain(map(freq, 0, scaleFreq, 0, 255), 0, scaleFreq);
  float fillValG = constrain(map(freq, 0, scaleFreq, 0, 127), 0, scaleFreq);
  float fillValB = constrain(map(freq, 0, scaleFreq, 0, 63), 0, scaleFreq);
  fill(fillValR, fillValG, fillValB);
  image(img2, width - (amp * scaleAmp), height*2/4, amp * scaleAmp, 250);
}

// https://forum.processing.org/one/topic/microphone-pitch-detect.html
// https://github.com/Notnasiul/R2D2-Processing-Pitch/blob/FFT/PitchProject/PitchDetectorFFT.pde

import processing.sound.*;

Amplitude amplitude;
AudioIn in;
FFT fft;
int specSize = 256;
float sampleRate = 44100;
float[] spectrum = new float[specSize];
int band = 0;
float amp = 0;
float freq = 0;

void setupSound() {
  amplitude = new Amplitude(this);
  fft = new FFT(this, specSize);
  in = new AudioIn(this, 0);
  in.start();
  amplitude.input(in);
  fft.input(in);
}


void updateSound() {
  amp = getAmp();
  
  freq = getFreq();
}

float getFreq() {
  fft.analyze(spectrum);
  
  band = 0;
  
  // find frequency band with highest amplitude
  for(int i = 0; i < spectrum.length; i++) {   
    if (spectrum[i] > spectrum[band]) band = i;
  }
  
  // convert the value into Hz
  return band * 0.5 * sampleRate / (float) specSize;
}

float getAmp() {
  return amplitude.analyze();
}
