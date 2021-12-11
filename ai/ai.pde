
void setup(){
  size(1600,800);
  background(255);
  
  
}
float r=50;

float x=200,y=70,x_=1,y_=0,damp=0,maxV=0.1,t,g=0.005;
void draw(){
  background(255);
  for(int i=0;i<10;i++){
    x+=x_;y+=y_;
    if(x<r){x_=-x_;x+=3;}
    else if(x>width-r){x_=-x_;x-=3;}
    if(y<r){y_=-y_;y+=3;}
    else if(y>height-r){y_=-y_;y-=3;}
    t=(maxV*damp+sqrt(x_*x_+y_*y_))/(damp+1.0)/sqrt(x_*x_+y_*y_);
    x_*=t;y_*=t;
    y_+=g;
  }
  ellipse(x,y,r*2,r*2);
}
class player{
  float r=50;
  float x=100,y=100;
  

}
