class v2{
  float x=0;
  float y=0;
  v2(float x1,float y1){
    x=x1;
    y=y1;
  }
  void Rotate(float r){
    float d=direction(x,y)+r;
    float l=dist(x,y,0,0);
    x=l*cos(d);
    y=l*sin(d);
  }
  float GetDirection(){
    return(direction(x,y));
  }
  float GetLength(){
    return(dist(x,y,0,0));
  }
  void Add(v2 v){
    x+=v.x;
    y+=v.y;
  }
  void Mult(float a){
    x*=a;
    y*=a;
  }
  
  
  
}
v2 force(v2 pos1,v2 pos2,float mult){
    v2 f=new v2((pos2.x-pos1.x),(pos2.y-pos1.y));
    f.Mult(mult/f.GetLength()/f.GetLength()/f.GetLength());
    return f;
  }
v2 force(float x1,float y1,float x2,float y2,float mult){
  v2 f=new v2((x2-x1),(y2-y1));
  if(f.GetLength()!=0){
  f.Mult(mult/f.GetLength()/f.GetLength()/f.GetLength());
  return f;
  }
  else{return new v2(0,0);}
}