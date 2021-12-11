Complex c,z,b;
float hue,hue2;
float weight[][];
void draw(){
  /*
  if(z.abs()>100){
    z=z0;
  }*/
  if(clear){
    clear=false;
    weight=new float[width][height];
    background(0);
  }
  
  
  loadPixels();
  for(int i=0;i<100000;i++){

    if(random(2)>1)
    {
      hue++;
      hue2/=2;
      z=f(z,b);
    }
    else 
    {
      
      hue/=2;
      hue2++;
      z=j(z,c);
    }
      
    drawPoint(z);
  }
  updatePixels();
  
  Complex mouse = posToComplex(mouseX,mouseY);
  //ellipse(complexToPos(f(mouse)).x,complexToPos(f(mouse)).y,5,5);
  //ellipse(complexToPos(g(mouse)).x,complexToPos(g(mouse)).y,5,5);
}

Complex f(Complex a,Complex z){  
  return mult(power(a,z),0.5);
}
Complex g(Complex a,Complex z){  
  return divide(a,add(add(a,z).power(2),1));
}
Complex h(Complex a,Complex z){
  return mult(mult(a,z),cis(exp(a.abs()*0.1)));
}
Complex i(Complex a,Complex z){  
  return mult(add(a,z),0.5);
}
Complex j(Complex a,Complex z){  
  return mult(a,z);
}
Complex k(Complex a,Complex z){
  return divide(1,add(divide(0.5,a),divide(0.5,z)));
}
Complex l(Complex a,Complex z){
  return mult(exp(a.im*z.abs()),cis(a.re*z.arg()));
}
Complex m(Complex a,Complex z){  
  return divide(z,a);
}


//============================================================================================================
boolean clear=true;
void setup(){
  background(0);
  size(1980,1060);
  colorMode(HSB);
  c=new Complex(-0.589,0);
  b=new Complex(0.56,0.7);
  z=new Complex(0.56,0.7);
  
}

float scale=0.01;
PVector translate=new PVector(0,0);
Complex z0=new Complex(0.1,0.1);
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
    //if((hue-hue2+1000000.0)>weight[int(pos.x)][int(pos.y)]){
      pixels[int(pos.x)+int(pos.y)*width]=color(150+(1.0/hue+1.0/hue2)*10.0,255-(1.0/hue+1.0/hue2)*35.0,(brightness(get(int(pos.x),int(pos.y)))*10+255)/11);
      weight[int(pos.x)][int(pos.y)]=(hue-hue2+1000000.0);
    //}
      //else {pixels[int(pos.x)+int(pos.y)*width]=color(hue(get(int(pos.x),int(pos.y))),100,(brightness(get(int(pos.x),int(pos.y)))*10+255)/11);}
      
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
  saveFrame(b.re+"+"+b.im+"i, "+c.re+"+"+c.im+"i"+",s_"+scale+",t_"+translate.x+","+translate.y);
}
