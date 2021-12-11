float x1=200,y1=0,x2=-200,y2=0,xs1=-2,ys1=3,xs2=1,ys2=-3,a,b,c,d,dir,dir1,dir2,nx1,ny1,nx2,ny2;
void setup(){
 size(800,800);
 background(0);
} 
void draw(){
  background(0);
  
  translate(400,400);
  dir=dir(xs2-xs1,ys2-ys1);
  dir1=dir(xs1,ys1);
  dir2=dir(xs2,ys2);
  a=cos(dir1-dir);
  b=sin(dir1-dir);
  c=cos(dir2-dir);
  d=sin(dir2-dir);
  nx1=(a+c)/2+cos((b+d)/dist(x1,x2,y1,y2))*dist(x1,x2,y1,y2)/2;
  ny1=(a+c)/2+sin((b+d)/dist(x1,x2,y1,y2))*dist(x1,x2,y1,y2)/2;
  nx1=(a+c)/2-cos((b+d)/dist(x1,x2,y1,y2))*dist(x1,x2,y1,y2)/2;
  ny1=(a+c)/2-sin((b+d)/dist(x1,x2,y1,y2))*dist(x1,x2,y1,y2)/2;
  xs1=nx1-x1;
  ys1=ny1-y1;
  xs2=nx2-x2;
  ys2=ny2-y2;
  x1=nx1;
  x2=nx2;
  stroke(255,255,0);
  ellipse(x1,y1,10,10);
  ellipse(x2,y2,10,10);
  line(x1,y1,x1+cos(dir1)*100,y1+sin(dir1)*100);
  line(x2,y2,x2+cos(dir2)*100,y2+sin(dir2)*100);
  delay(1000);
}
float dir(float x,float y){
  if(y>0){
    return(acos(x/dist(0,0,x,y)));
  }
  else{
    return(-acos(x/dist(0,0,x,y)));
  }
}