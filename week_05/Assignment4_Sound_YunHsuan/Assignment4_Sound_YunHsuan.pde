import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;
float positionX = 0, positionY = 0;

void setup()
{
  size(800, 500, P3D);
  minim = new Minim(this);
  
  // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  song = minim.loadFile("song.mp3", 1024);
  
  // loop the file indefinitely
  song.loop();
  
  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( song.bufferSize(), song.sampleRate() );
}

void draw()
{
  background(255);
  
  //draw background with rectangles
  for(int i=0;i<width;i=i+20){
    for(int j=0;j<height;j=j+20){
      fill(200);
      stroke(random(255),random(255),random(255));
      rect(i,j,i+20,j+20);
    }
  }
  
  
  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( song.mix );
  
  for(int i = 0; i < fft.specSize(); i++)
  {
    //make sure the value in between 0 and height
    float m_rect = map(fft.getBand(i), 0, 10, 0, height);
    stroke(255);
    //println(fft.getBand(i));
    //the main line, draw the line for frequency band i, scaling it up a bit so we can see it
    line(width/4, height/4, width/4 + cos(radians(fft.getBand(i)))*(width/4), height/4 + sin(radians(fft.getBand(i)))*(height/4));
    
    //when key 'a' is pressed, the following 6 lines appear
    if (keyPressed) {
    if (key == 'a') {
      positionX = mouseX;
      positionY = mouseY;
      stroke(255);
      line(positionX, positionY, positionX + positionX + cos(radians(fft.getBand(i)))*(width/4), positionY + sin(radians(fft.getBand(i)))*(height/4));
      line(positionX, positionY, positionX + positionX + cos(radians(fft.getBand(i)))*(width/4), positionY - sin(radians(fft.getBand(i)))*(height/4));
      line(positionX, positionY, positionX + positionX - cos(radians(fft.getBand(i)))*(width/4), positionY + sin(radians(fft.getBand(i)))*(height/4));
      line(positionX, positionY, positionX + positionX - cos(radians(fft.getBand(i)))*(width/4), positionY - sin(radians(fft.getBand(i)))*(height/4));
      
      line(positionX, positionY, width/4 + cos(radians(fft.getBand(i)))*(width/4), height/4 + sin(radians(fft.getBand(i)))*(height/4));
      
      line(positionX*1.3, positionY*1.3+20, positionX*1.3 + cos(radians(fft.getBand(i)))*(width/4), positionY*1.3+20 + sin(radians(fft.getBand(i)))*(height/4));
    }
    }
  
  }
}
