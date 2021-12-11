Complex c,z,b;
float hue,hue2;
float weight[][];
int repeat=100000;
int fc=4000;
void draw(){
  

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
  return mult(add(mult(a.power(1),1),z),0.5);
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


//============================================================================================================
boolean clear=true;
void setup(){
  size(1980,1060);colorMode(HSB);
  
  for(int n=0;n<4;n++){
    if(n==0){
      translate.x=translate0.x+0.5*scale*(float)width;
      translate.y=translate0.y-0.5*scale*(float)height;
    }
    if(n==1){
      translate.x=translate0.x+0.5*scale*(float)width;
      translate.y=translate0.y+0.5*scale*(float)height;
    }
    if(n==2){
      translate.x=translate0.x-0.5*scale*(float)width;
      translate.y=translate0.y+0.5*scale*(float)height;
    }
    if(n==3){
      translate.x=translate0.x-0.5*scale*(float)width;
      translate.y=translate0.y-0.5*scale*(float)height;
    }
    
    
    c=new Complex(-0.589,0);
    b=new Complex(0.066,0.660);
    z=new Complex(0.56,0.7);
    
    background(0);
    loadPixels();
    for(int i=0;i<repeat*fc;i++){
  
      if(random(2)>1)
      {
        hue++;
        hue2/=2;
        z=j(z,b);
      }
      else {
        hue/=2;
        hue2++;
        z=f(z,c);}drawPoint(z);
        if(i%repeat==0){
          println(i/repeat);
        }
    }
    updatePixels();
    saveFrame(b.re+"+"+b.im+"i, "+c.re+"+"+c.im+"i_2"+n);
  }
}

float scale=0.0009459/2.0;
PVector translate0=new PVector(0,0);
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
      pixels[int(pos.x)+int(pos.y)*width]=color(((-hue+hue2)*10+100000+0)%255,100,(brightness(pixels[int(pos.x)+int(pos.y)*width])*10+255)/11);
      
    //}
      //else {pixels[int(pos.x)+int(pos.y)*width]=color(hue(get(int(pos.x),int(pos.y))),100,(brightness(get(int(pos.x),int(pos.y)))*10+255)/11);}
      
  }
}
