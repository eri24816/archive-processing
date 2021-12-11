float posx1=-200,posy1=0,posx2=100,posy2=0;
float sx1,ys1,xs2,ys2;
float x1=120,y1=80,x2=-70,y2=-100;
float x1r,y1r,x2r,y2r;
float x1n,y1n,x2n,y2n;
float theta;
void setup(){
  size(800,800);
  background(255);

}
void draw(){
  background(255);
  pushMatrix();
  translate(400,400);
  //theta=mouseX*0.05;
  theta=-acos((posx2-posx1)/sqrt((posx2-posx1)*(posx2-posx1)+(posy2-posy1)*(posy2-posy1)));
  println(theta);
  x1r=x(x1,y1,-theta);
  y1r=y(x1,y1,-theta);
  x2r=x(x2,y2,-theta);
  y2r=y(x2,y2,-theta);
  
  x1n=x((x1r+x2r)/2,y1r,theta);
  y1n=y((x1r+x2r)/2,y1r,theta);
  x2n=x((x1r+x2r)/2,y2r,theta);
  y2n=-y((x1r+x2r)/2,y2r,theta);
  
  stroke(color(255,0,0));
  l(posx1,posy1,x1,y1);
  l(posx2,posy2,x2,y2);
  stroke(color(0,255,0));
  l(posx1,posy1,x1r,y1r);
  l(posx2,posy2,x2r,y2r);
  stroke(color(0,0,200));
  l(posx1,posy1,x1n,y1n);
  l(posx2,posy2,x2n,y2n);
  stroke(0);
  l(posx1,posy1,cos(theta)*200,sin(theta)*200);
  
  popMatrix();
}
float x(float x,float y,float r){
  if(x>0){
    return(cos(r+acos(x/sqrt(x*x+y*y)))*sqrt(x*x+y*y));
  }else{
    return(cos(r-acos(x/sqrt(x*x+y*y)))*sqrt(x*x+y*y));
  }
}
float y(float x,float y,float r){
  if(x>0){
    return(sin(r+acos(x/sqrt(x*x+y*y)))*sqrt(x*x+y*y));
  }else{
    return(sin(r-acos(x/sqrt(x*x+y*y)))*sqrt(x*x+y*y));
    }
}
void l(float a,float b,float c,float d){
  line(a,b,a+c,b+d);
}