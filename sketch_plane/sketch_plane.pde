float rz=0;
float x=0;
float y=-100;
float z=0;

void setup(){
  size(800,800,P3D);
}
void draw(){
  
  println(x+","+y);
  rz+=(mouseX-width/2)*0.01;
  background(0);
  
  translate(400,600, -400);
  
  //translate(-width/2,0,-width/2);
  x+=sin(radians(rz))*10;
  y+=cos(radians(rz))*10;
  
  translate(x,y,z);
  rotateX(radians(90));
  
  
  
  fill(255);
  translate(100,0,0);
  rotateZ(radians(rz));
  sphere(50);
  
}
void ball(float x,float y,float s){
  
  
}