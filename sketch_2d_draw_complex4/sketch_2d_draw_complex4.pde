Complex c,z,b;
int n=5;
Complex points[]=new Complex[n];
int last=0;
void draw(){  
  if(clear){
    clear=false;
    background(0);
  }
  
  loadPixels();
  for(int i=0;i<100000;i++){
    int rand=int(random(n+1));
    if(rand==(last+1)%n||rand==(last+0)%n||rand==(last-1)%n)
      continue;
    if(rand==n){
      z=g(z);
      drawPoint(z);
      continue;
    }
    z=f(z,rand);
    drawPoint(z);
    last=rand+n;
  }
  updatePixels();
}

Complex f(Complex a,int i){
  return mult(add(points[i],a),0.5);
}
Complex g(Complex a){
  //return power(a,c);
  return mult(a,c);
  //return add(a,c);
  //return mult(add(a,c),0.5);
}



//============================================================================================================
boolean clear=true;
void setup(){
  
  background(0);
  size(800,800);
  colorMode(HSB);
  c=new Complex(0,-0.5);
  b=new Complex(0,0);
  z=new Complex(-0.1,0.1);
  for(int i=0;i<n;i++){
    points[i]=cis(2*PI*i/n);
  }
  z0=points[0];
}

float scale=0.01;
PVector translate=new PVector(0,0);
Complex z0;
Complex posToComplex(float x,float y){
  return new Complex((x-width/2)*scale-translate.x,-(y-height/2)*scale-translate.y);
}
PVector complexToPos(Complex c){
  return new PVector((c.re+translate.x)/scale+width/2,-(c.im+translate.y)/scale+height/2);
}

void drawPoint(Complex z){
  PVector pos=complexToPos(z);
  if(pos.x>=0&&pos.x<width&&pos.y>=0&&pos.y<height)
  {
    pixels[int(pos.x)+int(pos.y)*width]=color(0,0,(brightness(get(int(pos.x),int(pos.y)))*10+255)/11);
  }
}

void mouseDragged(){
  
  clear=true;
  z=z0;
  if(mouseButton==LEFT)
  translate.add(new PVector((mouseX-pmouseX)*scale,-(mouseY-pmouseY)*scale));
  else
  if(mouseButton==RIGHT)
  c=posToComplex(mouseX,mouseY);
  if(mouseButton==3)
  b=posToComplex(mouseX,mouseY);
}
void mouseWheel(MouseEvent event) {
  clear=true;
  z=z0;
  scale*=1+event.getCount()*0.1;
}
void keyPressed(){
  saveFrame("####");
}
