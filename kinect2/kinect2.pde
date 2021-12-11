import kinect4WinSDK.Kinect;

 
Kinect kinect;
PImage d,i;
color t;
int add=4;
int mult=2;
void setup()
{
  size(1280, 960,P3D);
  background(0);
  kinect = new Kinect(this);
  noStroke();
  fill(200);
  smooth();
}
 
void draw()
{
  lights();
  background(0);
  i=kinect.GetImage();
  //image(kinect.GetDepth(), 320, 240, 320, 240);
  //image(kinect.GetMask(), 0, 240, 320, 240);
  d=kinect.GetDepth();
  //fill(d.get(160,120));
  //loadPixels();
  translate(width/2,height/2,0);
  rotateY(mouseX*0.01);
  rotateX(mouseY*0.01);
  translate(-width/2,-height/2,-500);
  for(int x=0;x<d.width;x+=add){
    for(int y=0;y<d.height;y+=add){
      //fill(i.get(x,y));
      
      if(x+add<d.width&&y+add<d.height){
          draw(x,y);
      }
    }
  }
  println(frameCount);
  //updatePixels();
  //println(d.get(120,160));

}
void draw(int x,int y){
  fill(i.get(x,y),200);
  //fill(200*atan(getD(x,y,add)*2-getD((x+add),y,add)-getD(x,(y+add),add)));
  beginShape();
  vertex(x*mult,y*mult,getD(x,y,add));
  vertex((x+add)*mult,(y)*mult,getD((x+add),y,add));
  vertex(x*mult,(y+add)*mult,getD(x,(y+add),add));
  endShape(CLOSE);
  //fill(200*atan(getD(x,y+add,add)*2-getD((x+add),y,add)-getD(x+add,(y+add),add)));
  beginShape();
  vertex(x*mult,(y+add)*mult,getD(x,(y+add),add));
  vertex((x+add)*mult,(y)*mult,getD((x+add),y,add));
  vertex((x+add)*mult,(y+add)*mult,getD((x+add),(y+add),add));
  endShape(CLOSE);
}
float getD(int X,int Y,int R){
  float sum=0;
  int i=0;
  float r=R/2;
  for(float x=X-r;x<X+r;x++){
    for(float y=Y-r;y<Y+r;y++){
      sum+=red(d. get(int(x),int(y)));
      i++;
    }
  }
  return sum/i;
}
 

  