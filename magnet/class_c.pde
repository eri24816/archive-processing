class c{
  float x,y;
  float s;
  float r;
  float l;
  float xn,xs,yn,ys;
  float friction=0.01;
  c(float x1,float y1,float s1,float r1,float l1){
    x=x1;
    y=y1;
    s=s1;
    r=r1;
    l=l1;
  }
  void display(){
    strokeWeight(5);
    stroke(0,0,200);
    line(x,y,x+l*cos(r),y+l*sin(r));
    stroke(200,0,0);
    line(x,y,x-l*cos(r),y-l*sin(r));
    xn=x+l*cos(r);
    yn=y+l*sin(r);
    xs=x-l*cos(r);
    ys=y-l*sin(r);
  }
  void rotate(){
    r+=s;
    //s+=s>0?-min(abs(s),friction):min(abs(s),friction);
    s*=1-friction;
  }
  

}