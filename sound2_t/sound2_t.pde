  
import processing.sound.*;
SinOsc sine[]=new SinOsc[10];
float freq[]={2};
float amp[]= {1,1,1,0,0.2,0};
int t=0;
float y;
float m[]={5};
void setup() {
  size(1000, 360);
  background(255);
  for(int i=0;i<freq.length;i++){
    sine[i] = new SinOsc(this);
    sine[i].freq(freq[i]*200);
    sine[i].amp(amp[i]);
    sine[i].play();
  }
}

void draw() {
  if(t/30<m.length){
    for(int i=0;i<freq.length;i++){
      sine[i].freq(freq[i]*100*pow(2,m[t/30]/12));
      sine[i].amp(amp[i]*pow(0.97,(t%30)));
    }
    t++;
    background(255);
    beginShape();
    for(int x=0;x<width;x++){
      y=0;
      stroke(0);
      for(int i=0;i<freq.length;i++){
        y+=cos(2.0*PI*freq[i]*x/400.0)*amp[i]*50.0;
      }
      vertex(x,y+height/2);
    }
    endShape();    
  
    //delay(500);
  }
}