float r;
float d=300;
//float x;
//float y=-400;
float px;
float py;
int maxT=2;
void setup(){
  size(800,800);
  background(255);
  translate(width/2,height/2);
  loops(1,0,-400);
   
}
void loops(int t,float x,float y){
  r+=PI/2;
  d=300/t;
  x=cos(r)*d;
  y=sin(r)*d;
  if(t>1){
    line(px,py,x,y);
  }
  if(t<maxT){
    px=x;
    py=y;
    loops(t+1,x,y);
  }
  r-=PI/2;//reset

  r-=PI/2;
  x=cos(r)*d;
  y=sin(r)*d;
  if(t>1){
    line(px,py,x,y);
  }
  if(t<maxT){
    px=x;
    py=y;
    loops(t+1,x,y);
  }
} 