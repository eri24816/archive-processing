float p1x=0;
float p1y=0;
float p1z=0;
float p2x=500;
float p2y=0;
float p2z=0;
float p3x=707.106781185/2;
float p3y=500;
float p3z=0;
float p4x=sqrt(0.75)*250;
float p4y=250;
float p4z=500;
float lx=0;
float ly=0;
float lz=0;
float s=2;
void setup(){
size(500, 500,P3D);
background(255);
stroke(0);

}
void draw(){
  translate(250,250,250);
  rotateX(mouseX/200);
  rotateY(mouseY/200);
  for(int a=0;a<100000;a++){
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*p1x)/s;
      ly=(ly+(s-1)*p1y)/s;
      lz=(lz+(s-1)*p1z)/s;
      point(int(lx),int(ly),int(lz));
    }  
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*p2x)/s;
      ly=(ly+(s-1)*p2y)/s;
      lz=(lz+(s-1)*p2z)/s;
      point(int(lx),int(ly),int(lz));
    }
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*p3x)/s;
      ly=(ly+(s-1)*p3y)/s;
      lz=(lz+(s-1)*p3z)/s;
      point(int(lx),int(ly),int(lz));
    }
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*p4x)/s;
      ly=(ly+(s-1)*p4y)/s;
      lz=(lz+(s-1)*p4z)/s;
      point(int(lx),int(ly),int(lz));
    }
  }
  //camera(mouseX,mouseY,0,0,0,0,1,0,0);
  println(int(lx)+","+int(ly)+","+int(lz));

}

void mousePressed(){
  saveFrame("##");
}
void mouseMoved(){
  background(255);
}