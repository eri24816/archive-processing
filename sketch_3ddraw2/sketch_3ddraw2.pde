float a;
float allbig=100;

void setup(){
  
  size(300, 300, P3D);

}
void draw(){

  //pushMatrix();
  translate(width/2,height/2,0);
  
  
  rotateX(-mouseY/30.0);
  rotateZ(mouseX/30.0);
  lights();
  
  //popMatrix();
  scale(1);
  background(255);
  noFill();
  
  
  
  for(float x=-allbig/2;x<=allbig/2;x+=allbig/80){
    //beginShape();
    for(float z=-allbig/2;z<=allbig/2;z+=allbig/80){
      
      for(float y=-allbig/2;y<=allbig/2;y+=allbig/80){
        z( x,y,z);
        if ((a> -1000)&&(a<0)){
         stroke(80,50,255);
          point(x,y,z);
        }
        if ((a>0)&&(a<1000)){
         stroke(255,42,53);
          point(x/10,y/10,z/10);
        }
      }
      
    }
    //endShape();
  }
      
}
void z(float x,float y,float z){
//a=( pow(x,3)+pow(y,3)+pow(z,3));
a=( (x+y)*(x+z)*(z+y)*(x*y+y*z+z*x)/(x+y+z)/50.0);

}


void mousePressed(){
  saveFrame("##");
}
  