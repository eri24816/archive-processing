c c[];
m m[];
void setup(){
  size(800,800);
  c=new c[1];
  c[0]=new c(400,400,0,1,30);
  m=new m[1];
  m[0]=new m(300,400,3.6);
  
}
void draw(){
  background(200);
  
  c[0].x=mouseX;
  c[0].y=mouseY;
  c[0].rotate();
  c[0].display();
  m[0].display();
  m[0].addForceAt(c[0]);
  
  //line(
  
}
float direction(float x,float y){
  if(y>0){
    return (acos(x/dist(0,0,x,y)));
  }
  else{
    return (-acos(x/sqrt(x*x+y*y)));
  }
}



//println(c[0].r+","+((direction(c[0].l*cos(c[0].r),c[0].l*sin(c[0].r))+PI*2)%(PI*2)));