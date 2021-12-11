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