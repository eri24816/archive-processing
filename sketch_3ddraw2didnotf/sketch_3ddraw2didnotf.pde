float z;
int b;
boolean p[]=new boolean [10000000];

void setup(){
  int xn=0;
  int yn=0;
  int zn=0;
  
  size(300, 300, P3D);
  for(float x=0;x<=b;x+=1){
    xn+=1;
    //beginShape();
    for(float z=0;z<=b;z+=1){
      zn+=1;
      for(float y=0 ;y<=b;y+=1){
        yn+=1;
        p[xn*b*b+zn*b+yn]=((int((x+z)*(x+y)*(z+y))<2000)&&(int((x+z)*(x+y)*(z+y))>1800));
          
        
      }
      
    }
    //endShape();
  }

}
void draw(){
  int xn=0;
  int yn=0;
  int zn=0;
  //pushMatrix();
  translate(width/2,height/2,0);
  
  
  rotateX(-mouseY/30.0);
  rotateZ(mouseX/30.0);
  lights();
  
  //popMatrix();
  scale(1);
  background(255);
  noFill();
  stroke(0);
  for(float x=0;x<=b;x+=1){
    xn+=1;
    //beginShape();
    for(float z=0;z<=b;z+=1){
      zn+=1;
      for(float y=0 ;y<=b;y+=1){
        yn+=1;
        if(p[xn*b*b+zn*b+yn]){
          point(x,y,z);
      }
    }
  }
  }
  
  
  
      
}
void z(float x,float y){
z=sqrt(x*x-y*y);

}


void mousePressed(){
  saveFrame("##");
}
  