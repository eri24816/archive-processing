  
import processing.sound.*;
SinOsc sine[]=new SinOsc[28];
float freq[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28};
float amp[]={38.51441274
,112.2641001
,48.49184537
,66.87621744
,48.18789918
,73.04392005
,60.60980535
,27.47426242
,27.91601964
,20.39539965
,42.74810532
,108.3645777
,83.84090726
,25.26827456
,5.735530332
,13.26786021
,5.575833425
,9.997493574
,1.387993375
,3.037141152
,3.146493161
,1.559566831
,4.718222107
,7.364722711
,4.335587731
,13.67086273
,12.64455352
,13.67131989
};
float t=0;
float y;
void setup() {
  size(640, 360);
  background(255);
    
  // Create the sine oscillator.
  for(int i=0;i<2;i++){
    sine[i] = new SinOsc(this);
    sine[i].freq(freq[i]*40.0);
    sine[i].amp(amp[i]/113.0);
    sine[i].play();
  }
}

void draw() {
  t++;
  background(255);
  beginShape();
  for(int x=0;x<width;x++){
    y=0;
    stroke(0);
    for(int i=0;i<freq.length;i++){
      y+=sin(2.0*PI*freq[i]*x/80000.0)*amp[i]*pow(0.94,t)*100.0;
    }
    vertex(x,y+height/2);
  }
  endShape();    
  for(int i=0;i<1;i++){
    sine[i].amp(amp[i]*pow(0.94,t));
  }
  
}