void setup(){
  background(0);
  size(800,800);
  colorMode(HSB);
  c=new Complex(cos(PI*2/5.0),sin(PI*2/5.0));
  b=new Complex(0,0);
  z=new Complex(-0.1,0.1);
}

float scale=0.01;
PVector translate=new PVector(0,0);
Complex z0=new Complex(0,0);
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
  

  z=z0;
  if(mouseButton==LEFT)
  translate.add(new PVector((mouseX-pmouseX)*scale,-(mouseY-pmouseY)*scale));
  else
  if(mouseButton==RIGHT)
  a=posToComplex(mouseX,mouseY);
  if(mouseButton==3)
  b=posToComplex(mouseX,mouseY);
}
void mouseWheel(MouseEvent event) {

  z=z0;
  scale*=1+event.getCount()*0.1;
}
