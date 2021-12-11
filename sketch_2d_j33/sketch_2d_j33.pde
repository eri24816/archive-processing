float w = 5;
float s = 0.2;
float xp = 0;
float yp = 0;
float mx = 0;
float my = 0;
float k=0;
float l=0;
boolean m=true;
float lxw=80;
float lx[]=new float[100];
float lx2[]=new float[lx.length];
int lxn;
float lyw=80;
float ly[]=new float[100];
float ly2[]=new float[lx.length];
int lyn;
boolean xyline=false;
boolean line=false;
PImage img;
void setup(){
size(800, 800);
img=loadImage("011.jpg");
background(255);

}
void draw(){
  
  
  
  
  if(keyPressed){
    if(keyCode==LEFT){
      xp-=w*s;
    }
    if(key=='f'){
      saveFrame( "###");
    }
    if(keyCode==RIGHT){
      xp+=w*s;
    }
    if(keyCode==DOWN){
      yp-=w*s;
    }
    if(keyCode==UP){
      yp+=w*s;
    }
    
  }
  
  
 
  
  strokeWeight(1);
  stroke(50);
  
  for(int a=0 ;a<lx.length;a++){
    if(a<width/lxw&&xyline){
      line(lx2[a],0,lx2[a],width);
      text(lx[a],lx2[a],20);
    }
  }
  for(int a=0 ;a<ly.length;a++){
    if(a<height/lyw&&xyline){
      line(0,ly2[a],height,ly2[a]);
      text(-ly[a],10,ly2[a]);
    }
  }
  textSize(40);
  text("c="+k+"+"+l+'i',50,50);
  textSize(20);
  
}
void keyPressed(){
  if ((key == 'w')) {
    w/=2;
  } if(key == 's') {
    w*=2;
  }
  if(key == 'z') {
    m=!m;
  }
  if(key == 'l') {
    xyline=!xyline;
  }
}
void mousePressed(){
    if(mouseButton == LEFT){
    if(line){
      line=false;
    }
    else{
      mx =mouseX;
      my =mouseY;
      line=true;
    }
  }
  float xmin;
  float ymin;
  xmin = -w/2.0+xp;
  ymin = -w/2.0-yp;
  
  
  loadPixels();
  
  
  int maxiterations = 1000;
  
 
  float xmax = xmin + w;

  float ymax = ymin + w;
  

  float dx = (xmax - xmin) / (width*1);
  float dy = (ymax - ymin) / (height*1);
  ellipse(0,0,10,10);

  float y = ymin;
  lyn=0;
  for (int j = 0; j < height; j++) {
    lxn=0;
    float x = xmin;
    for (int i = 0; i < width; i++) {
      
      float a = x;
      float b = -y;
  
      int n = 0;
      while (n < maxiterations) {
        float aa = a;
        float bb = b;
        
        a = a*a - b*b +k;
        b = 2*aa*bb +l;

        if (a<0.5&&a>-0.5&&b<0.5&&b>-0.5) {
          break; 
        }
        n++;
      }
      if (n == maxiterations) {
        pixels[i+j*width] = color(255);
      } else {

        pixels[i+j*width] = color(0);
      }
      if((i)%lxw==0){
        lx[lxn]=x;
        lx2[lxn]=i;
        lxn++;
      }
      x += dx;
    }
    if((j)%lyw==0){
        ly[lyn]=y;
        ly2[lyn]=j;
        lyn++;
      }
    y += dy;
    
  }

  updatePixels();
}



void mouseDragged()
{
  if(mouseButton == CENTER){
    if(m){
      image(img,0,0);
    }
    k=((mouseX-width/2.0)/width*5.0);
    l=((mouseY-height/2.0)/height*5.0);
  }
  if(mouseButton == RIGHT){
    xp-=(mouseX-pmouseX)*w/width;
    yp+=(mouseY-pmouseY)*w/height;
  }
  
}    
      