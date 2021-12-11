float phase,amp,scale=5,u,v,vmax;
int x,y;

void setup(){
  background(255);
  colorMode(HSB);
  
  size(500,500);
  
  float[] g=new float[width*height];
  for(x=0;x<width;x++){
    for(y=0;y<height;y++){
      g[x+y*width]=400-2*sqrt(sq(x-(width/2))+sq(y-(height/2)));
    }
  }
  
  for(u=0;u<1;u+=0.03){
    vmax=sqrt(1.0-u*u);
    for(v=0;v<vmax;v+=0.03){
      amp=random(-1.0,1.0)*30.0;
      phase=random(2*PI);
      for(x=0;x<width;x++){
        for(y=0;y<height;y++){
          g[x+y*width]+=cos((u*x+v*y)/scale+phase);
          
        }
      }
    }
  }
  
  loadPixels();
  for(int i=0;i<g.length;i++){
    if(g[i]<=0)
      pixels[i]=color(150,255,180);
    else if(g[i]<10)
      pixels[i]=color(40,200,255);
    else if(g[i]<255){
      pixels[i]=color(80,200,255);
    }
    //else
      //pixels[i]=color((g[i]-255)*10,210+(g[i]-255)*2,(g[i]-255)*10);
  }
  updatePixels();
  print(0);
}
/*
float f(float x){
  float r=0;
  for(int i=0;i<a.length;i++){
    r+=a[i]*sin(b[i]+x*power(2,i));
}
  return r;
}
float g(float x){
  float r=0;
  for(int i=0;i<a.length;i++){
    r+=a[i]*sin(c[i]+x*power(2,i));
}
  return r;
}
int power(int a,int b){
  int r=1;
  for(int i=0;i<b;i++){
    r*=a;
  }
  return r;
}*/
