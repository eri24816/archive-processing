float p1x=0;
float p1y=800;
float p2x=800;
float p2y=800;
float p3x=mouseX;
float p3y=mouseY;
float lx=0;
float ly=0;
float plx=1090;
float ply=800;
float pplx;
float pply;
float s=2;
void setup(){
size(800, 800);
background(255);
strokeWeight(1);
loadPixels();
}
void draw(){
  
  p3x=mouseX;
  p3y=mouseY;
  for(int a=0;a<1000;a++){
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*p1x)/s;
      ly=(ly+(s-1)*p1y)/s;
      pixels[int(lx)+800*int(ly)]=color(0);
    }  
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*p2x)/s;
      ly=(ly+(s-1)*p2y)/s;  
      pixels[int(lx)+800*int(ly)]=color(0);
    }
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*p3x)/s;
      ly=(ly+(s-1)*p3y)/s;
      pixels[int(lx)+800*int(ly)]=color(0);
    }
  }
  if(mouseX!=pmouseX){
    for(int a=0;a<640000;a++){
      pixels[a]=color(255);
    }
  }
  updatePixels();
  
  stroke(0);
  //point(lx,ly);
  //line(plx,ply,lx,ly);
  println(int(random(1,3)));
  stroke(0,0,255);
  
  //point(p1x,p1y);
  //point(p2x,p2y);
}
void mouseMoved(){
  background(255);
}
void mousePressed(){
  saveFrame("##");
}