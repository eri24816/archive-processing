class P{
  public float sx,sy,px,py,mass;
  public boolean isStatic=false;
  P(float sx1,float sy1,float px1,float py1, float mass1){
    sx=sx1;
    sy=sy1;
    px=px1;
    py=py1;
    mass=mass1;
  }
  void Move(){
    px+=sx;
    py+=sy;
  }
  void AddForce(float fx,float fy){
    sx+=fx/mass;
    sy+=fy/mass;
  }
  void AddForce(V2 v){
    sx+=v.x/mass;
    sy+=v.y/mass;
  }
  void AddForce(float force,V2 dir){
    float x=x
  }
}
class V2{
  float x;
  float y;
  V2(float x1,float y1){
    x=x1;
    y=y1;
  }
  
}
P sun;
P[]p=new P[2];
void setup(){
  sun=new P(0,0,500,500,5);
  p[1]=new P(0,0,500,800,1);
  sun.isStatic=true;
}
void draw(){
  for(int i=0;i<p.length;i++){

  p[i].Move();
  p[i].AddForce(planet1.x
  }
  
}