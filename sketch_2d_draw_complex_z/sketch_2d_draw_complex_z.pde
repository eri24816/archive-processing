Complex c;
float scale=0.01;
int times;

void setup(){
  c=new Complex(-0.5,0.5);
  size(500,500);
  colorMode(HSB);
  frameRate(5);
}
void draw(){
  times=frameCount;
  noFill();
  
  beginShape();
  for(int x=0;x<20;x++){
    
  }
  endShape();
}
color colorAt(Complex z0){
  Complex z=z0;
  int i=0;
  while(i<times){
    z=add(z.power(2),c);
    i++;
    if(z.abs()>=25000){
      return color(255);
    }
  }
  return color((int)(z.arg()/2/PI*255)+127,255*2.718/exp(z.abs()),255);
}
Complex t(float x,float y){
  return new Complex((x-width/2)*scale,(y-height/2)*scale);
}
