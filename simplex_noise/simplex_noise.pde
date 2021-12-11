color a=color(255,0,0),b=color(0,255,0),c=color(0,0,255);

float w=800;
float h[][]=new float[10][10];
void setup(){
  size(800,800);
  background(0);
}
void draw(){
  PVector p=new PVector(0,0),q=new PVector(w,0),r=new PVector(w/2,w*sqrt(3)/2);
  float A,B,C,S;
  loadPixels();
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      A=f(1-x/w-y/w/1.732);
      B=f(x/w-y/w/1.732);
      C=f(y/w*2/1.732);
      if(A<0||A>1||B<0||B>1||C<0||C>1)break;
      S=A+B+C;
      A/=S;B/=S;C/=S;
      pixels[x+y*width]=color(A*red(a)+B*red(b)+C*red(c),A*green(a)+B*green(b)+C*green(c),A*blue(a)+B*blue(b)+C*blue(c));
      
      
    }
  }
  updatePixels();
  
  ellipse(p.x,p.y,5,5);
  ellipse(q.x,q.y,5,5);
  ellipse(r.x,r.y,5,5);
  
}
float f(float x){
  return (6*x*x-15*x+10)*x*x*x;
}
