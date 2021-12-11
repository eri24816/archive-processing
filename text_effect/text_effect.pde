PImage ori;
color textC=color(0);
color mainC=color(255,150,20);
float range,arg,max;
float a=0.005;

Pen pen=new Pen(300,500);
float img[];

void setup(){
  ori=loadImage("a.png");
  size(2200,1000);
  background(0);
  //image(ori,0,0);
  noStroke();
  fill(mainC);
  img=new float[width*height];
  colorMode(HSB);
}
void draw(){
  
  loadPixels();
  for(int i=0;i<10000;i++){
    pen.move();
    

    if(ori.pixels[(int)pen.x+(int)pen.y*ori.width]!=textC){
      max=0;
      do{
        arg=random(0,PI*2.0);
        range=random(0,max);
        max+=0.1;
      }
      while(!isBlack(pen.x+range*cos(arg),pen.y+range*sin(arg)));
      range=a*(10);
      pen.x1+=range*cos(arg);pen.y1+=range*sin(arg);
      
    }
    if(!isBlack(pen.x,pen.y))
      pen.drag();
    //pen.display();
    for(int x=-10;x<40;x++){
      for(int y=-10;y<40;y++){
        if((x*x+y*y<40)&&inRect(pen.x+x,pen.y+y,0,width,0,height)){
          img[(int)pen.x+x+(int)(pen.y+y)*width]+=0.01/(x*x+y*y+20);
          pixels[(int)pen.x+x+(int)(pen.y+y)*width]=color(
          40.0-35.0/(1.0+img[(int)pen.x+x+(int)(pen.y+y)*width]),
          155.0+100.0/(1.0+img[(int)pen.x+x+(int)(pen.y+y)*width]),
          255.0-255.0/sq(1.0+img[(int)pen.x+x+(int)(pen.y+y)*width])
          );
        }
      }
    }
    
    
  }
  
  
  
  updatePixels();
  println(frameCount);
}
boolean inRect(float x,float y,float x1,float x2,float y1,float y2){
  return x>x1&&x<x2&&y>y1&&y<y2;
}
boolean isBlack(float x,float y){
  if (!inRect(x,y,0,ori.width,0,ori.height))
    {return false;}
   else if(ori.pixels[(int)x+(int)y*ori.width]==textC){return true;}
   else{return false;}
}
void mousePressed(){
  pen.x=mouseX;pen.y=mouseY;
  pen.x1=0;pen.y1=0;
}
