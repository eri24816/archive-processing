float p1x=700;
float p1y=600;
float p2x=150;
float p2y=756;
float p3x=100;
float p3y=700;
float lx=250;
float ly=620;
float plx=1090;
float ply=800;
float pplx;
float pply;
float s=3;
float s2=1.1;
float s3=1.5;
void setup(){
size(800, 800);
background(255);
strokeWeight(1);
loadPixels();
}
void draw(){
 
  for(int a=0;a<100000;a++){
    if(int(random(1,5))==1){
      lx=(lx+(s-1)*p1x)/s;
      ly=(ly+(s-1)*p1y)/s;
      if(int(lx)+800*int(ly)>0&&int(lx)+800*int(ly)<640000){
      pixels[int(lx)+800*int(ly)]=color(0);
      }
    }  
    if(int(random(1,5))==1){
      lx=(lx+(s2-1)*(p2y-ly)/2)/s2;
      ly=(ly+(s2-1)*(p2x-lx)/2)/s2;
      if(int(lx)+800*int(ly)>0&&int(lx)+800*int(ly)<640000){ 
      pixels[int(lx)+800*int(ly)]=color(0);
      }
    }
    if(int(random(1,5))==1){
      lx=(lx+(s3-1)*(p3y-ly)/2)/s3;
      ly=(ly+(s3-1)*(p3x-lx)/2)/s3;
      if(int(lx)+800*int(ly)>0&&int(lx)+800*int(ly)<640000){
      pixels[int(lx)+800*int(ly)]=color(0);
      }
    }
    
  }

  /*if(mouseX!=pmouseX){
    for(int a=0;a<640000;a++){
      pixels[a]=color(255);
    }
  }*/
  updatePixels();
 fill(0,255,0);
  ellipse(p1x,p1y,6,6);
  ellipse(p2x,p2y,6,6);
  ellipse(p3x,p3y,6,6);
  //stroke(0);
  //point(lx,ly);
  //line(plx,ply,lx,ly);
  println(s+","+s2);

  
  //point(p1x,p1y);
  //point(p2x,p2y);
}
void mouseMoved(){
 lx=250;
 ly=620;
  s=mouseX/80.0;
  s2=mouseY/80.0;
  for(int a=0;a<640000;a++){
      pixels[a]=color(255);
    }
}
void mousePressed(){
  saveFrame("##");
}