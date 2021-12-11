int A;
int sum=36;//x+y+z
float scale=1;
boolean stop=false;
int   outputs;
int   t=0;
float maxt;
int   a=1;
int   b=4;
int   c=7;
int   m=0;
int   n=0;
int   o=0;
boolean f;
int dots;
void setup(){
  
  size(800, 800, P3D);

}
void draw(){
  
  //pushMatrix();
  translate(width/2,height/2,0);
  background(255);
  text("x+y+z="+sum,400,-300);
  fill(0,255,0);
  beginShape(TRIANGLES);
  vertex(400,-350);
  vertex(350,-350);
  vertex(375,-400);  
  endShape();
  fill(0,0,255);
  beginShape(TRIANGLES);
  vertex(400,-340);
  vertex(350,-340);
  vertex(375,-290);  
  endShape();
  rotateX(-mouseY/30.0);
  rotateZ(mouseX/30.0);
  lights();
  
  //popMatrix();
  scale(scale);
  
  fill(255,0,0);
  
  
  line(0,0,0,0,0,300);
  line(0,0,0,0,300,0);
  line(0,0,0,300,0,0);
  text('a',0,0,300);
  text('b',0,300,0);
  text('c',300,0,0);
  dots=0;
  for(int x=0;x<=sum;x++){
    //beginShape();
    for(int y=sum-x;y>=0;y--){
      int z=sum-x-y;
      m=x;
      n=y;
      o=z;
      
      run();
      if (A==1){
        stroke(0);
        pushMatrix();
        translate(x*10,y*10,z*10);
        box(10,10,10);          
        popMatrix();
        dots++;
      }
      
    }
    //endShape();
    
  }
}


void mousePressed(){
  if(get(mouseX,mouseY)==color(0,0,255)){
    if(sum>12){sum-=12;}
  }else if(get(mouseX,mouseY)==color(0,255,0)){
    sum+=12;
  }
  else{
    saveFrame(sum+",###");
  }
}
void keyPressed(){
  if(key=='s'){
    scale*=0.5;
  }
  if(key=='w'){
    scale*=2;
  }
  if(key=='q'){
    sum+=12
    ;
  }
  if(key=='a'){
    if(sum>12){sum-=12;}
  }
}