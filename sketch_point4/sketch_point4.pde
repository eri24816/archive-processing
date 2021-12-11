float px[]={0,0,800,800};
float py[]={0,800,0,800};
float lx=0;
float ly=0;
float plx=1090;
float ply=800;
float pplx;
float pply;
float s=1.9;
void setup(){
size(800, 800);
background(255);
strokeWeight(1);
loadPixels();
}
void draw(){
  pplx=lx;
  pply=ly;
  for(int a=0;a<100000;a++){
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*px[0])/s;
      ly=(ly+(s-1)*py[0])/s;
      if(int(lx)+800*int(ly)>0&&int(lx)+800*int(ly)<640000){
        pixels[int(lx)+800*int(ly)]=color(0,0,255);
      }
    }  
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*px[1])/s;
      ly=(ly+(s-1)*py[1])/s;  
      if(int(lx)+800*int(ly)>0&&int(lx)+800*int(ly)<640000){
        pixels[int(lx)+800*int(ly)]=color(0,255,0);
      }
    }
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*px[2])/s;
      ly=(ly+(s-1)*py[2])/s;
      if(int(lx)+800*int(ly)>0&&int(lx)+800*int(ly)<640000){
        pixels[int(lx)+800*int(ly)]=color(255,0,0);
      }
    }
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*px[3])/s;
      ly=(ly+(s-1)*py[3])/s;
      if(int(lx)+800*int(ly)>0&&int(lx)+800*int(ly)<640000){
        pixels[int(lx)+800*int(ly)]=color(0,255,255);
      }
    }
  }
  updatePixels();
  plx=pplx;
  ply=pply;
  stroke(0);
  //point(lx,ly);
  line(plx,ply,lx,ly);
  println(int(random(1,3)));
  stroke(0,0,255);
  //point(p1x,p1y);
  //point(p2x,p2y);
}