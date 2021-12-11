import processing.sound.*;
float amp[];
float scaleX=50;
float scaleY=200;
float n[]={1,3,5,6,8};
int t=0;
float delay=30;
SinOsc sine[];
void setup() {
  size(800,800);
  amp=new float [16];
  sine=new SinOsc[amp.length];
  for(int i=0;i<sine.length;i++){
    sine[i]=new SinOsc(this);
    sine[i].freq((i+1)*500);
    sine[i].play();
  }
}
void draw(){
  background(255);
  noFill();
  beginShape();
  for(int i=0;i<amp.length;i++){
    vertex(i*scaleX,height-amp[i]*scaleY);
  }
  endShape();
  if(mousePressed){
    if((int)(mouseX/scaleX+0.5)<amp.length&&(int)(mouseX/scaleX)>=0){
      amp[(int)(mouseX/scaleX+0.5)]=max(-(mouseY-height)/scaleY,0);
    }
  }
  
  for(int i=0;i<sine.length;i++){
    sine[i].amp(amp[i]);
    sine[i].freq((i+1)*500*pow(2.0,n[t]/12.0));
  }
  if(frameCount%delay==0){
  t=(t+1)%n.length;
}
  
}