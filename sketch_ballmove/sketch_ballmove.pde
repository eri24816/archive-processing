int bn=40;
float time=0;
float x[]=new float[bn];
float y[]=new float[bn];
void setup(){
  stroke(255);
  size(800,800,P3D);
  /*for(int n=0;n<bn;n++){
    y[n]=n*70;
    x[n]=0;
  }*/
}
void draw(){
  time+=0.007;
  for(int n=0;n<bn;n++){
    y[n]=n*130;
    x[n]=200*sin((n+10)*time);
  }
  background(0);
  rotateX(PI/2);
  translate(400,-800,-800);
  rotateX(mouseY*0.01);
  rotateX(PI);
  
  
  for(int n=0;n<bn;n++){
    noFill();
    stroke((255-255/bn*n)/2,255-255/bn*n,255/bn*n);
    pushMatrix();
    translate(x[n],y[n],0);
    sphere(60);
    popMatrix();
  }
  lights();
  
}
    