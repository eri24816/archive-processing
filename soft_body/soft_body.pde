float x,y,s=1;
int w=20,h=40;
Par par[][];
Spr spr[];
int t=100;
Box box[];
float g=0.00005;
void setup(){
  size(1920,1080);
  colorMode(HSB);
  rectMode(CENTER);
  par=new Par[w][h];
  box=new Box[3];box[0]=new Box(200,1500,1000,1000);box[1]=new Box(400,1100,1000,3000);box[2]=new Box(1000,2300,700,2000);
  
  for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      //par[i][j]=new Par(i*40+j*30,i*30+j*-40,5);
      par[i][j]=new Par(i*50+1000,j*50-50,5);
    }  
  }
  spr=new Spr[w*h*4+2];
  float k=0.005;
  for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      if(i+1<w){
        spr[(i+j*w)*4]=new Spr(par[i][j],par[i+1][j],k,50);
      }
      if(j+1<h){
        spr[(i+j*w)*4+1]=new Spr(par[i][j],par[i][j+1],k,50);
      }
      if(i+1<w&&j+1<h){
        spr[(i+j*w)*4+2]=new Spr(par[i][j],par[i+1][j+1],k,50*sqrt(2));
      }
      if(i-1>=0&&j+1<h){
        spr[(i+j*w)*4+3]=new Spr(par[i][j],par[i-1][j+1],k,50*sqrt(2));
      }
      
    }
  }
  spr[w*h*4]=new Spr(par[0][0],par[w-1][h-1],k,50*sqrt((w-1)*(w-1)+(h-1)*(h-1)));
  spr[w*h*4+1]=new Spr(par[w-1][0],par[0][h-1],k,50*sqrt((w-1)*(w-1)+(h-1)*(h-1)));
}
void draw(){
  background(255);
  translate(width/2,height/2);
  scale(s);
  translate(x,y);
  box[0].x=(mouseX-width/2)/s-x;
  box[0].y=(mouseY-height/2)/s-y;
  for(int n=0;n<t;n++){
    box[0].y-=0.001;
    for(int i=0;i<w;i++){
      for(int j=0;j<h;j++){        
          par[i][j].update();
      }  
    }
    for(int i=0;i<spr.length;i++){
      if(spr[i]!=null){
        spr[i].update();
      }
    }
  }
  for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){        
        //par[i][j].display();
    }  
  }
  for(int i=0;i<spr.length;i++){
    if(spr[i]!=null){
      spr[i].display();
    }
  }
  for(int i=0;i<box.length;i++){
    fill(50,100,250,100);
    stroke(50,255,255,50);
    box[i].display();
  }
}
void mouseDragged(){
  if(mouseButton==CENTER){
    x+=(mouseX-pmouseX)/s;y+=(mouseY-pmouseY)/s;
  }
}
void mouseWheel(MouseEvent event) {
  s/=1+event.getCount()*0.1;
}
class Par{
  float m,x,y,x_,y_;
  float damp=0.9999;
  Par(float x,float y,float m){
    this.x=x;this.y=y;this.m=m;
  }
  void update (){
    boolean c=false;
    
    x+=x_;y+=y_;
    x_*=damp;y_*=damp;
    for(int i=0;i<box.length;i++){
      if (box[i].collide(this))
        c=true;
    }
    if(!c)
      y_+=g;
  }
  void display(){
    noStroke();
    fill(150,255,255,150);
    ellipse(x,y,20,20);
  }
}
class Spr{
  Par a,b;
  float k=1,l=10;
  Spr(Par a,Par b,float k,float l){
    this.a=a;
    this.b=b;
    this.k=k;
    this.l=l;
  }
  void update(){
    float t=k*(l-dist(a.x,a.y,b.x,b.y))/l;
    if(abs(l-dist(a.x,a.y,b.x,b.y))>100){
      for(int i=0;i<spr.length;i++){
        if(spr[i]!=null){
          if(spr[i].equals(this)){
            spr[i]=null;
          }
        }
      }
    }
    
    a.x_+=(a.x-b.x)/a.m*t;
    a.y_+=(a.y-b.y)/a.m*t;
    b.x_+=(b.x-a.x)/b.m*t;
    b.y_+=(b.y-a.y)/b.m*t;
  }
  void display(){
    stroke(-130+200*exp(-k*sq(l-dist(a.x,a.y,b.x,b.y))*20),255,255,150);
    strokeWeight(k*2000);
    line(a.x,a.y,b.x,b.y);
  }
}
class Box{
  float x,y,w,h;
  Box(float x,float y,float w,float h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  void display(){
    rect(x,y,w,h);
  }
 boolean collide(Par p){
    if(p.x>=x-w/2&&p.x<x+w/2&&p.y>=y-h/2&&p.y<y+h/2){
      
      if(min(abs(p.x-x+w/2),abs(p.x-x-w/2))<min(abs(p.y-y+h/2),abs(p.y-y-h/2))){
        if(abs(p.x-x+w/2)<abs(p.x-x-w/2))
          p.x_=-1*abs(p.x_)-0.001;
        else
          p.x_=abs(p.x_)+0.001;
      }
      else{
        if(abs(p.y-y+h/2)<abs(p.y-y-h/2))
          p.y_=-1*abs(p.y_)-0.001;
        else
          p.y_=abs(p.y_)+0.001;
      }
      //p.x_=0;p.y_=0;
      return true;
    }
    return false;
  }
}
