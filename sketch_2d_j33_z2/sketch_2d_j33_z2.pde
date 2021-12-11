float w = 5;
float s = 0.1;
float xp = 0;
float yp = 0;
float mx = 0;
float my = 0;
float k=-0.644;
float l=-0.441;
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

float rmx;
float rmy;
void setup(){
size(800,800);
img=loadImage("011.jpg");
background(255);
colorMode(HSB);
}
void draw(){
  
  
  
  float xmin;
  float ymin;
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
  
  
  xmin = -w/2.0+xp;
  ymin = -w/2.0-yp;
  
  
  loadPixels();
  
  
  int maxiterations = 1000;
  
 
  float xmax = xmin + w;

  float ymax = ymin + w;
  

  float dx = (xmax - xmin) / (width*1);
  float dy = (ymax - ymin) / (height*1);
  

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

        if (a*a + b*b >100.0) {
          break; 
        }
        n++;
      }
      if (n == maxiterations) {
        pixels[i+j*width] = color(0,0,0);
      } else {

        pixels[i+j*width] = color((n*3.0) % 255,sin(n*3*2*PI/255)*50+205,255);
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
  if(line){
    rmx=(mouseX-width/2)*w/width+xp;
    rmy=(mouseY-width/2)*w/width-yp;
    ellipse((rmx*rmx - rmy*rmy +k-xp)/w*width+width/2, (2*rmx*rmy -l+yp)/w*width+width/2,5,5);
   // println((rmx*rmx - rmy*rmy +k)/w*width+width/2);
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
  if(key == 'q') {
    saveFrame("####.png");
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
void mouseWheel(MouseEvent event) {
  w*=1+event.getCount()*0.1;
}
