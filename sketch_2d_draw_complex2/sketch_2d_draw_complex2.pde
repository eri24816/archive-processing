Complex c,z;
float scale=0.01;
PVector translate;

void setup(){
  background(255);
  c=new Complex(-0.8,0.2);
  z=new Complex(0,0);
  size(800,800);
  colorMode(HSB);
  frameRate(5);
  translate=new PVector(0,0);
}
void draw(){  
  loadPixels();
  for(int i=0;i<100;i++){
    PVector pos=complexToPos(z);
    pixels[int(pos.x+pos.y*width)]=color(0);
  }
  updatePixels();
}

Complex f(Complex a){
  return add(a.power(2),c);
}

Complex posToComplex(float x,float y){
  return new Complex((x-width/2)*scale-translate.x,-(y-height/2)*scale-translate.y);
}
PVector complexToPos(Complex c){
  return new PVector((c.re+translate.x)/scale+width/2,(c.im+translate.y)/scale+height/2);
}

void mouseDragged(){
  translate.add(new PVector((mouseX-pmouseX)*scale,(mouseY-pmouseY)*-scale));
}
void mouseWheel(MouseEvent event) {
  scale*=1+event.getCount()*0.1;
}
