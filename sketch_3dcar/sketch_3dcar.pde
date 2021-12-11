float rx=0;
float te=100;
float ry=0;
float cx=0;
float cz=0;
float zps2=0;
float yps2=0;
float tw[]={100,0,0,200,0};
float tl[]={200,0,0,0,0};
float tx[]={200,0,0,0,0};
float ty[]={200,0,0,0,0};
float tz[]={0,0,0,0,0};
float t[]={0,0,0,0,0};
float deg[]={0,0,0,0,0};
float sp[]={4,0,80,0,0};
float bxrot= 90;
boolean a2=false;
boolean hit;//[]=new boolean[4];

void setup(){
  background(255);
  fill(51);
  stroke(255);
  size(700, 700, P3D);
 }
void draw(){
  
  rotateX(radians(90));
  translate(width/2,0, -500);
  rotateX(radians(cx));
  rotateZ(radians(cz));
  
  cz=mouseX;
  cx=mouseY;
  //cx=mouseY;
  
      
 background(100);
 
    lights();
    if(keyPressed){
    if(keyCode==DOWN){
      
      hit=ty[0]<te;
      ty[0]+=cos(radians(deg[0]))*sp[0];
      tx[0]+=sin(radians(deg[0]))*sp[0];
      if(((hit&&ty[0]>te)||(!hit&&ty[0]<te))){
        ty[0]-=cos(radians(deg[0]))*sp[0];
        tx[0]-=sin(radians(deg[0]))*sp[0];
      }
       
        
    }
    if(keyCode==UP){
      hit=ty[0]<te;
      ty[0]-=cos(radians(deg[0]))*sp[0];
      tx[0]-=sin(radians(deg[0]))*sp[0];
      if((hit&&ty[0]>te)||(!hit&&ty[0]<te)){
        ty[0]+=cos(radians(deg[0]))*sp[0];
        tx[0]+=sin(radians(deg[0]))*sp[0];
      }
      
    }
    if(keyCode==RIGHT){
      deg[0]-=5;
    }
    if(keyCode==LEFT){
      deg[0]+=5;
    }
    if(key=='q'){
      a2=true;
      tx[2]=tx[0];
      ty[2]=ty[0];
      deg[2]=deg[0];
      zps2=sin(radians(bxrot))*sp[2];
      yps2=cos(radians(bxrot))*sp[2];
      tz[2]=50;
    }
    if(key=='w'){
      bxrot-=1;
    }
    if(key=='s'){
      bxrot+=1;
    }
  }
  drawcar( width/2, 0, -500);
  
  rotateZ(radians(deg[0]));
  draw1();
  if(a2){
    draw2();
  }
  draw3();

    
    
}
void drawcar(float  x,float y,float z){
  te=tw[0]+ty[3]*0.8;
  rotateX(PI*-0);
  fill(0,255,0);
  box(tw[0],tl[0],100);
  pushMatrix();
  rotateX(radians(bxrot));
  translate(0,100,0);
  
  box(10,150,10);
  popMatrix();
}
void draw1(){
  //ground
  pushMatrix();
  translate(tx[1]-tx[0],ty[1]-ty[0],-50);
  rectMode(CENTER);
  fill(0,20,20);
  //rect(0,0,6000,6000);
  popMatrix();
}
void mousePressed(){
  println(mouseY);
}
void draw2(){
  pushMatrix();
  zps2-=sp[2]/200;
  tz[2]+=zps2;
  ty[2]+=yps2;
  rotateZ(-radians(deg[0]));
  translate(tx[2]-tx[0],ty[2]-ty[0],tz[2]-50);
  fill(0);
  
  sphere(5);
  popMatrix();
  if(abs(tx[2]-tx[0])+abs(ty[2]-ty[0])>10000){
    a2=false;
  }
}
void draw3(){
  pushMatrix();
  translate(tx[3]-tx[0],ty[3]-ty[0],tz[3]+450 );
  box(tw[3],0,1000);
  popMatrix();
  
 
}
  
  
  
  
  
  
  