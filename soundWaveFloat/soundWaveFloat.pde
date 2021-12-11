float r=0.062;
float[][] source=new float[72][3];
void setup(){
  size(150,150);

  for(int i=0;i<6;i++){
    source[2*i][0]=0.9848;
    source[2*i+1][0]=-0.9848;
    source[2*i][1]=0.1736*cos(TWO_PI/6.0*i);
    source[2*i+1][1]=-0.1736*cos(TWO_PI/6.0*i);
    source[2*i][2]=0.1736*sin(TWO_PI/6.0*i);
    source[2*i+1][2]=-0.1736*sin(TWO_PI/6.0*i);
  }
    for(int i=0;i<12;i++){
    source[12+2*i][0]=0.9397;
    source[12+2*i+1][0]=-0.9397;
    source[12+2*i][1]=0.3420*cos(TWO_PI/12.0*i-0.21);
    source[12+2*i+1][1]=-0.3420*cos(TWO_PI/12.0*i-0.21);
    source[12+2*i][2]=0.3420*sin(TWO_PI/12.0*i-0.21);
    source[12+2*i+1][2]=-0.3420*sin(TWO_PI/12.0*i-0.21);
  }
      for(int i=0;i<18;i++){
    source[36+2*i][0]=0.8660;
    source[36+2*i+1][0]=-0.8660;
    source[36+2*i][1]=0.5*cos(TWO_PI/18.0*i);
    source[36+2*i+1][1]=-0.5*cos(TWO_PI/18.0*i);
    source[36+2*i][2]=0.5*sin(TWO_PI/18.0*i);
    source[36+2*i+1][2]=-0.5*sin(TWO_PI/18.0*i);
  }
  for(int i=0;i<72;i++){for(int j=0;j<3;j++){source[i][j]*=r;}
  }
}
float scale=0.0003;
float t=-0.06;
void draw(){
  colorMode(HSB);
  loadPixels();
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
       shift(t,(j-width/2)*scale,(i-width/2)*scale,0);
      pixels[i+j*width]=color(0.5*outX,0,0.8*sqrt(sq(outX)+sq(outY)+sq(outZ)));
    }
  }
  updatePixels();
  t+=0.002;
}
float outX,outY,outZ;
void shift(float x,float y,float z,float t){
  float freq=40000,speed=340,amp=1;
  outX=0;outY=0;outZ=0;
  for(int i=0;i<source.length;i++){
    float sqdist=sq(x-source[i][0])+sq(y-source[i][1])+sq(z-source[i][2]);
    outX+=(x-source[i][0])/sqdist*sin(TWO_PI*freq*(t-sqrt(sqdist)/speed));
    outY+=(y-source[i][1])/sqdist*sin(TWO_PI*freq*(t-sqrt(sqdist)/speed));
    outZ+=(z-source[i][2])/sqdist*sin(TWO_PI*freq*(t-sqrt(sqdist)/speed));
  }
  outX*=amp;
  outY*=amp;
  outZ*=amp;
}
