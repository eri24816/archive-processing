float c[]=new float [1900];
void setup(){
  size(1900,1000);
  background(0);
  stroke(255);
  float x=0,v=0,t=0;
  
  
  
  noFill();
  
  
  for(int i=0;i<c.length;i++){
    v+=sin(0.2*t)*sin(0.5*x)-0.01;
    x+=v;
    c[i]=x;
    
    
    t++;
  }
  
  
  
  
  
}
void draw(){
  
  fill(0,0,0,30);
  rect(-1,-1,width,height);
  noFill();
  translate(0,height/2);
  beginShape();
  for(int i=0;i<c.length;i++){
    vertex(i,-c[i]*mouseY*1);
  }
  endShape();
}
