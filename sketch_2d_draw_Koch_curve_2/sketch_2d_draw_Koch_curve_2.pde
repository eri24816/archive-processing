void setup(){
  size(800,800);
}
void draw(){
  d(7,0,0,400,0,800);
}
void d(int maxStage,int stage,float x,float y,float dir,float size){
  if(maxStage>stage){
    size/=2;
    
    d(maxStage,stage+1,x+cos(dir)*size,y+sin(dir)*size,dir,size);
    
    d(maxStage,stage+1,x+cos(dir+1)*size,y+sin(dir+1)*size,dir+1,size);
    
  }
  else{
    line(x,y,x+cos(dir)*size,y+sin(dir)*size);
  }
}
