float x=400;
float y=400;
float xs=0;
float ys=0;
float s=1;
float size=50;
int a1;
float direction=1;
int a2;
float a3[]=new float[1000];
int a4;
void setup(){
  size(800,800);
  background(100);
  xs=s*sin(direction);
  ys=s*cos(direction);
}
void draw(){
  
  strokeWeight(4);
  background(100);
  //translate(width/2,heigsht/2);
  stroke(0,200,200);
  beginShape();
  vertex(200,600);
  vertex(200,200);
  vertex(700,200);
  vertex(500,700);
  endShape(CLOSE);
  
  bounce();
  x+=xs;
  y+=ys;  
  fill(100);
  stroke(0);
  ellipse(x,y,size,size);
}