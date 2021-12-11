Complex c;

void setup(){
  size(800,800);
  colorMode(HSB);
  translate=new PVector(0,0);
  c=new Complex(-1,0);
}

void draw(){  
  loadPixels();
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      pixels[x+y*width]=colorAt(x,y);
    }
  }
  updatePixels();
}

color   colorAt(float x,float y){

  return color(y/800*210+sin(x/100*2*PI)*5,255,255);
}

Complex f(Complex z){
  //return add(z.power(2),c);
  return add(z,devide(add(z.power(3),-1),mult(z.power(2),-3)));
}

//=================================================================================================================

float scale=0.005;
PVector translate;

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
void mousePressed(){
  saveFrame("####.png");
}
