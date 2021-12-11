int ms=0;
int t=0;
float angle;
color c1,c2;
void setup(){
  size(1000,1000);
  c1=color(0,0,0);
  
  c2=color(0,0,255);
}
void draw(){
  background(255);
  ms=t/100;
  angle=((t%100)/100.0)*PI/3.0;
  d(ms,0,new PVector(0,600),0,1000.0/pow(3.0,ms));
  if(t%100==0)
  delay(1000);
  t++;
  
}
void d(int maxStage,int stage,PVector pos,float dir,float size){
  if(maxStage>stage+1){

    
    d(maxStage,stage+1,pos,dir,size);
    
    pos.add(PVector.mult(PVector.fromAngle(dir),size));
    dir-=PI/3.0;
    d(maxStage,stage+1,pos,dir,size);
    
    pos.add(PVector.mult(PVector.fromAngle(dir),size));
    dir+=PI*2.0/3.0;
    d(maxStage,stage+1,pos,dir,size);
    
    pos.add(PVector.mult(PVector.fromAngle(dir),size));
    dir-=PI/3.0;
    d(maxStage,stage+1,pos,dir,size);
  }
  else if(maxStage==stage+1){

    
    d(maxStage,stage+1,pos,dir,size);
    
    pos.add(PVector.mult(PVector.fromAngle(dir),size));
    dir-=angle;
    strokeWeight(2);
    stroke(c2);
    d(maxStage,stage+1,pos,dir,size/cos(angle)/2);
    
    pos.add(PVector.mult(PVector.fromAngle(dir),size/cos(angle)/2));
    dir+=angle*2;
    d(maxStage,stage+1,pos,dir,size/cos(angle)/2);
    strokeWeight(1);
    stroke(c1);
    
    pos.add(PVector.mult(PVector.fromAngle(dir),size/cos(angle)/2));
    dir-=angle;
    d(maxStage,stage+1,pos,dir,size);
  }
  else{
    line(pos.x,pos.y,pos.x+cos(dir)*size,pos.y+sin(dir)*size);
  }
}
