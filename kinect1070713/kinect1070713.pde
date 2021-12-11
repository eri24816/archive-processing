import kinect4WinSDK.Kinect;

 
Kinect kinect;
PImage d,i;
color t;
int add=10;
int mult=2;
void setup()
{
  size(1280, 960,P3D);
  background(0);
  kinect = new Kinect(this);
  stroke(255);
  noFill();
  smooth();
}
 
void draw()
{
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
      fill(i.get(x,y));
      
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
  
  beginShape();
  vertex(x*mult,y*mult,red(d.get(x,y)));
  vertex((x+add)*mult,(y)*mult,red(d.get((x+add),y)));
  vertex(x*mult,(y+add)*mult,red(d.get(x,(y+add))));
  endShape(CLOSE);
  beginShape();
  vertex(x*mult,(y+add)*mult,red(d.get(x,(y+add))));
  vertex((x+add)*mult,(y)*mult,red(d.get((x+add),y)));
  vertex((x+add)*mult,(y+add)*mult,red(d.get((x+add),(y+add))));
  endShape(CLOSE);
}
 

  