import processing.video.*;
color c;
boolean csl=false;
int bx;
int by;
int dots;
float bc=2000;
float penx=0;
float peny=0;
float ppenx=0;
float ppeny=0;

Capture cam;

void setup() {
  size(800, 800);
  cam = new Capture(this, 320, 240,30);
  cam.start();
}

void draw() {
  dots=0;
  bc=2000;
  if(cam.available()) {
    cam.read();
  }
  //if(!csl){
    image(cam, 0, 0);
  //}
  if(csl){
    for(int x=0;x<320;x++){
      for(int y=0;y<240;y++){
        if(abs(red(get(x,y))-red(c)) 
        +abs(blue(get(x,y))-blue(c)) 
        +abs(green(get(x,y))-green(c))<80){
          dots++;
        }

        if(
        abs(red(get(x,y))-red(c)) 
        +abs(blue(get(x,y))-blue(c)) 
        +abs(green(get(x,y))-green(c))<bc){
          bx=x;
          by=y;
          bc= abs(red(get(x,y))-red(c)) 
        +abs(blue(get(x,y))-blue(c)) 
        +abs(green(get(x,y))-green(c));
          
        }
      }
    }
  }
 
  //background(0);
  ppenx=penx;
  ppeny=peny;
  penx=(penx+bx)/2;
  peny=(peny+by)/2;
  //strokeWeight(dots);
  strokeWeight(1);
  /*if(dots>150){ */   
    line(width-penx*3,peny*3,width-ppenx*3,ppeny*3); 
  /*}else{
  ellipse(width-bx*3,by*3,10,10);
  println( dots);
  }*/
    
  

  //ellipse(width-bx*3,by*3,10,10);
}
void mousePressed(){
  if(!csl){
    c=get(mouseX,mouseY);
    csl=true;
    stroke(c);
    penx=mouseX;
    peny=mouseY;
    //background(0);
  }else{
    background(0);
  }
}
void keyPressed(){
  csl=false;
}

    