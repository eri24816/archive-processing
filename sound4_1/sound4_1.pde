import processing.sound.*;
float amp[];
float scaleX=70;
float scaleY=200;
int[] noteTransform={-1,0,2,4,5,7,9,10};
int t=0;
float delay=20;
float A=-100;
note n[];
void setup() {
  colorMode(HSB);
  size(1000,1000);
  amp=new float [12];
  n=new note[3];
  int m0[]={-8,-8,-8,-8,-10,-10,-10,-10,-6,-6,-6,-6,-9,-9,-9,-9};/*{1,2,3,4,5,6,7,8,9,10}*/;
  int m1[]={1,1,3,1,-3,-1,1,4,-2,1,3,1,2,0,-2,0};
  int m2[]={1,-6,3,3,1,1,1,1,5,5,5,1,-2,2,1,0};
  n[0]=new note(this,m0);
  n[1]=new note(this,m1);
  n[2]=new note(this,m2);
}
void draw(){
  background(255);
  noFill();
  beginShape();
  for(int i=0;i<amp.length;i++){
    
    vertex(i*scaleX,height-amp[i]*scaleY);
    fill(i*-7+150,255,255);
    rect((i-0.5)*scaleX,height,scaleX,-amp[i]*scaleY*exp(-frameCount%delay*0.1)*0.8);
  }
  noFill();
  endShape();
  if(mousePressed){
    if((int)(mouseX/scaleX+0.5)<amp.length&&(int)(mouseX/scaleX)>=0){
      amp[(int)(mouseX/scaleX+0.5)]=max(-(mouseY-height)/scaleY,0);
    }
  }
  for(int i=0;i< n.length;i++){
    n[i].update();
  }

  if(frameCount%delay==0){
   for(int i=0;i< n.length;i++){
    n[i].changeAmp(amp);
    n[i].playNote();
  }
  t=(t+1)%16;
}
  
}
