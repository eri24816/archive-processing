import processing.sound.*;
SinOsc sine[];
//float freq[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
//float amp[]= {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
float freq[]={2,3,4,5,6};
float amp[]= {30,30,30,30,30};
float d=0.05;
float mult;
float max=0.2;
float y;
float m[]={5};
float t=0;
void setup() {
  sine=new SinOsc[freq.length];
  size(1000, 360);
  background(255);
      for(int i=0;i<freq.length;i++){
    sine[i] = new SinOsc(this);
    sine[i].freq(freq[i]*4000.0*pow(2.0,-12.0/3.0));
    sine[i].amp(amp[i]*1);
    sine[i].play();
      }
      print(this);
}

void draw() {
  //n a=new n()
    for(int i=0;i<freq.length;i++){
      sine[i].freq(freq[i]*2000.0*pow(2.0,12.0/-3.0));
      sine[i].amp(amp[i]*mult);
    }
    mult=0.3*exp(-t);
    background(255);
    beginShape();
    for(int x=0;x<width;x++){
      y=0;
      stroke(0);
      for(int i=0;i<freq.length;i++){
        y+=sin(2.0*PI*freq[i]*x/400.0)*amp[i]*50.0;
      }
      vertex(x,y+height/2);
    }
    endShape();    
  
    //delay(500);
  t+=0.1;
}