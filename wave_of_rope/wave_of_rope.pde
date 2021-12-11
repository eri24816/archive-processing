float[] x=new float[800];
float[] v=new float[800];
float[] spec=new float [2];
float[] phase;
float amp=0;
float freq=3;
float gap;
int pmx=-1;
void setup(){
  size(1000,800);
  colorMode(HSB);
  background(0);
  phase=new float[spec.length];
  for(int i=0;i<5;i++){
    //v[i]=2.0*sin(i*2.0*PI/5);
  }
  gap=width/(float)x.length;
  for(int f=1;f<spec.length;f++){
    spec[f]=pow(-1,f/2)*(f%2)/(float)f/f;
    //phase[f]=PI*0.75+atan(f);
    for(int i=0;i<x.length;i++){
      x[i]+=amp*spec[f]*sin(TWO_PI*freq*f*i/x.length+phase[f]);
    }
  }
}
int t;
void draw(){
for(int repeat=0;repeat<500;repeat++){
  


  Add(v,
  Add(
  Mult(D2(x),0.00003),
  Mult(D2(D2(x)),0.00000)
  ));
  Add(x,v);
  

  //x=arrayAdd(x,arrayMult(D2__(x),0.1));


  if(mousePressed){
    int mx=int((mouseX-width/2)/gap+x.length/2);
    if(mx>=0&&mx<x.length&&pmx>=0&&pmx<x.length){
      for(int i=min(mx,pmx);i<=max(mx,pmx);i++){
        for(int j=-30;j<30;j++){
          //x[i]=(mouseY-height/2);
          v[(i+j)%x.length]+=(-x[(i+j)%x.length]+(mouseY-height/2))*0.0000001*exp(-j*j*0.009);
        }
      }
    }
    pmx=mx;
  }
  else{pmx=-1;}
} 
loadPixels();

PImage image=new PImage(width,height);
image.pixels=pixels;
background(0);
//tint(250);
image(image,width*0.02,height*0.01,width*0.96,height*0.96);
/*
for(int i=0;i<height*width;i++){
  pixels[i]=color(hue(pixels[i]),saturation(pixels[i]),brightness(pixels[i])*0.999);
}
updatePixels();*/
translate(width/2,height/2);
for(int i=0;i<x.length-1;i++){
  stroke(200,100+v[i]*v[i]*3000000.0,255);
  line((i-x.length/2)*gap,x[i],(i+1-x.length/2)*gap,x[i+1]);
}
t++;
}
float[] D(float[] x){
  float[] result=new float[x.length];
  for(int i=0;i<x.length;i++){
    result[i]=x[(i+1)%x.length]-x[(i-1+x.length)%x.length];
  }
  return result;
} 
float[] D2(float[] x){
  float[] result=new float[x.length];
  for(int i=0;i<x.length;i++){
    result[i]=x[(i+1)%x.length]+x[(i-1+x.length)%x.length]-2.0*x[i];
  }
  return result;
} 
float[] D2_(float[] x){
  float[] result=new float[x.length];
  result[0]=x[1]-2.0*x[0];
  result[x.length-1]=x[x.length-2]-2.0*x[x.length-1];
  for(int i=1;i<x.length-1;i++){
    result[i]=x[(i+1)%x.length]+x[(i-1+x.length)%x.length]-2.0*x[i];
  }
  return result;
} 
float[] D2__(float[] x){
  float[] result=new float[x.length];
  result[0]=x[1]-2.0*x[0];
  result[x.length-1]=x[x.length-2]-2.0*x[x.length-1];
  for(int i=1;i<x.length-1;i++){
    result[i]=x[(i+1)%x.length]+x[(i-1+x.length)%x.length]-2.0*x[i];
  }
  return result;
} 
float[] D4__(float[] x){
  float[] result=new float[x.length];
  result[0]=x[1]-2.0*x[0];
  result[x.length-1]=x[x.length-2]-2.0*x[x.length-1];
  for(int i=1;i<x.length-1;i++){
    result[i]=x[(i+1)%x.length]+x[(i-1+x.length)%x.length]-2.0*x[i];
  }
  return result;
}
float[] Add(float[] a ,float []b ){
  for(int i=0;i<a.length;i++){
    a[i]+=b[i];
  }
  return a;
}
float[] Mult(float[] a ,float b ){
  for(int i=0;i<a.length;i++){
    a[i]*=b;
  }
  return a;
}
