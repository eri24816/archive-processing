PVector translate;
float scale=0.005;
Complex c,d;
int times;
Complex value[];
void setup(){
  size(1000,1000);
  colorMode(HSB);
  translate=new PVector(0,0);
  d=new Complex(0,0);
  c=new Complex(1,0.5);
  value=new Complex[width*height];
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      value[x+y*width]=posToComplex(x,y);
    }
  }
}
void draw(){  
  loadPixels();
  
  int i;
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      i=x+y*width;
      value[i]=f(value[i],posToComplex(x,y));
      pixels[i]=colorAt(value[i]);
      if(y==500&&random(100)<1){
        println(value[i].re,value[i].im);
      }
    }
  }
  updatePixels();
}

color colorAt(Complex z){
  if(!(z.abs()<5)){
    return color(255);
  }
  if(z.abs()==0){
    return color(0);
  }
  return color((int)(z.arg()/2/PI*255)+127,255*exp(-z.abs()),255);
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
Complex f(Complex z,Complex z0){
  //return add(devide(new Complex(1,0),z.power(4)),c);
  //return devide(new Complex(1,0),add(devide(new Complex(1,0),add(z.power(1),c)).power(3),c));
  //return add(z.power(1),c );
  return power(z0,z);
}
