float x=0.7 ,y=0.7,z=0.2,px,py;
float a=0.03,b=0.04,c=0.05,d=0.03,e=0.01,f=0.02,g=0.02,xMax=2,yMax=2;
float s=100;
void setup(){
  size(800,800);
  background(0);
  stroke(255);
  
  //frameRate(300000);
}
void draw(){
  
  px=x;
  py=y;
  if(mousePressed){
    y-=min(0.01,y*0.05);
  }
  x+=-x*y*b+x*d-z*x*f-0.0001*x*x*x*x;
  y+=x*y*a-y*c-0.0001*y*y*y*y;
  z+=z*x*e-z*g-0.0001*z*z*z*z;
  translate(width/2,height/2);
  scale(s);
  strokeWeight(1.0/s);
  line(px,-py,x,-y);
  
  
}
