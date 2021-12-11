float rx;
float ry;
float sc=1;
float zsc=1;
float data[][];
water w[];
void setup(){
  w=new water[100];
  for(int i=0;i<w.length;i++){
    w[i]=new water(rand(0,width),rand(0,height),6);
  }
  
  size(800, 800, P3D);
  textSize(20);
 
  generate();
}
void draw(){

  
  translate(width/2,height/2,0);
  
  
  rotateX(-mouseY/30.0);
  rotateZ(mouseX/30.0);
  //lights();
  
  //popMatrix();
  scale(1);

  background(0);
  
  
  noStroke();
  fill(0,50,255);
  for(int i=0;i<w.length;i++){
    w[i].move();
    w[i].display();
  }
   
  noFill();
  stroke(230);

  for(int y=0;y<height;y+=4){
    beginShape();
    for(int x=0;x<width;x+=4){
      vertex(x-width/2, y-height/2,data[x][y]);
    }
    endShape();
    if(y%400==0){     
      pushMatrix();
      rotateY(PI);
      rotateZ(PI/2);
      text(y/sc,y,-width/2-50,0);
      popMatrix();
    }
  }
    for(int x=0;x<width;x+=4){
    beginShape();
    for(int y=0;y<height;y+=4){
      vertex(x-width/2, y-height/2,data[x][y]);
    }
    endShape();
    if(x%400==0){     
      pushMatrix();
      rotateY(PI);
      rotateZ(PI/2);
      text(x/sc,x,-width/2-50,0);
      popMatrix();
    }
  }
  //rotateZ(PI);
  translate(200,0,0);
  //text("z=sin(x/10.0)/sin(y/10.0);",50,50);
 
  
}
float f(float x,float y){
  rx=x/sc;
  ry=y/sc;
return (x+y)*zsc;

}

void generate(){
  seed=frameCount+rand(0,1000);
  seed=floor(rand(0,1000));
  println("seed: "+seed);
  data=new float[width][height];
    for(int i=0;i<9;i++){
    for(int j=0;j<(i+1)*(i+1);j++){
      int cx=int(rand(0,width));
      int cy=int(rand(0,height));
      int range=int(width*pow(0.5,i));
      for(int x=cx-range;x<cx+range;x++){
        for(int y=cy-range;y<cy+range;y++){
          if(x>=0&&y>=0&&x<width&&y<height){
            data[x][y]+=max(0,map(dist(0,0,x-cx,y-cy),0,range,range*0.25,0));
          }
        }
      }
    }
    
  
  }
}


void keyPressed(){
  if(key=='f'){
  saveFrame("sin(x*y)");
  };
  if(key=='w'){
  sc=sc*1.1;
  zsc=zsc*1.1;
  };
  if(key=='s'){
  sc=sc/1.1;
  zsc=zsc/1.1;
  };
    if(key=='q'){
  zsc=zsc*1.1;
  };
    if(key=='a'){
  zsc=zsc/1.1;
  };
  if(key=='g'){
    generate();
  }
}
  
float seed=101;
float rand(float a,float b){
  float r=log(seed)+seed;
  r=r-floor(r);
  seed=r*10.1561203+4.14141+frameCount*0.001;
  return map(r,0,1,a,b);
}
class water{
  float x,y,size;
  float g=10.0;
  water(float x,float y,float size){
    this.x=x;this.y=y;this.size=size;
  }
  void move(){
    if(x>0&&x+1<width){
      float h=data[int(x)][int(y)]-data[int(x)+1][int(y)];
      x+=g*h/sqrt(1+h*h);
    }
    if(!(x>1&&x<width-1&&y>1&&y<height-1)){
      x=rand(0,width);y=rand(0,height);
      size=7;
    }
    if(y>0&&y+1<height){
      float h=data[int(x)][int(y)]-data[int(x)][int(y)+1];
      y+=g*h/sqrt(1+h*h);
    }
    if(!(x>1&&x<width-1&&y>1&&y<height-1)){
      x=rand(0,width);y=rand(0,height);
      size=7;
    }
    for(int i=0;i<(w.length);i++){
      if(dist(x,y,w[i].x,w[i].y)<1&&this!=w[i]){
        w[i].size=sqrt(sq(w[i].size)+sq(size));   
      x=rand(0,width);y=rand(0,height);
      size=7;
    }
    }
  }
  void display(){
    
    pushMatrix();
    translate(x-width/2,y-height/2,data[int(x)][int(y)]);
    sphere(size);
    popMatrix();
  }
  
}
