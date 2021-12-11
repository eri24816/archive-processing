class v2{
  float x;
  float y;
  v2(float x1,float y1){
    x=x1;
    y=y1;
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