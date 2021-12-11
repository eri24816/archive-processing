float speed=0;
float x = 0;
float y = 0;
float z =200;
float rz=0;
float ry=0;
float bullet[][]=new float[100][6];//[number][x/y/z/xs/ys/zs]
int lastBullet=0;
color boxColor[]=new color[100];
float x0=1000;
float y0=500;
boolean settingxy=true;

void setup(){
  size(3000,1000,P3D);
  for(int i=0;i<100;i++){
    boxColor[i]=color(random(0,255),random(0,255),random(0,255));
  }
  for(int i=0;i<bullet.length;i++){
    bullet[i][1]=0;
    bullet[i][2]=0;
    bullet[i][3]=0;
    bullet[i][4]=0;
    bullet[i][5]=0;
    bullet[i][0]=0;
  }
}

void draw(){
  //s();
  if(settingxy){
    x0=mouseX;
    y0=mouseY;
    //println(mouseY*3);
    if(mousePressed){
      settingxy=false;
    }
  }
  else{}
  if(keyPressed){
    println(key);
    if (key=='w'){
      speed+=1;
    }
    if (key=='s'){
      speed-=1;
    }
  }
  ry-=(mouseY-y0)*0.0001;
  rz+=(mouseX-x0)*0.0001;

  x+=cos(rz)*cos(ry)*speed;
  y+=sin(rz)*cos(ry)*speed;
  if(z+sin(ry)*speed+speed*0.1>200){
    z+=sin(ry)*speed;
    z-=20;
    z+=speed*0.1;
  }
  else{ry=0;}


  background(50,200,240);
  
  pushMatrix();
  fill(255);
  s();
  translate(0,0,0);
  beginShape();
  vertex(-50000,-50000,0);
  vertex(-50000,50000,0);
  vertex(50000,50000,0);
  vertex(50000,-50000,0);
  endShape(CLOSE);
  popMatrix();
  
  pushMatrix();
  //noFill();
  //translate(700,450,0);
 // sphere(5000);
 noStroke();
  popMatrix();
  for(int j=0;j<10;j++){
    for(int i=0;i<10;i++){
      pushMatrix();
      fill(boxColor[i+j*10]);
      s();
      translate(i*4000-10000,j*4000-2000,0);
      //drawCylinder(100,500,1000);
      box(500,500,1000);
      popMatrix();
    }
  }
  fill(0,255,0);
  textSize(50);
  text("elevation:"+((int(ry/PI*180+90))%180-90)+"degrees",20,70,0);
  text("speed:"+speed,20,120,0);
  pushMatrix();
  translate(x0,y0,0);
  stroke(230,0,0);
  line(40,0,-40,0);
  line(0,40,0,-40);
  popMatrix();
  Bullet();
}
void s(){
  translate(x0,y0);
  rotateX(PI/2);
  rotateZ(PI*1.5);
  rotateY(ry);
  translate(0,0,0);
  rotateZ(-rz);  
  
  translate(-x,-y,-z);
}

void Bullet(){
  noStroke();
  fill(200,100,0);
  
  for(int i=0;i<bullet.length;i++){
    pushMatrix();
    s();
    translate(bullet[i][0],bullet[i][1],bullet[i][2]);
    sphere(30);
    bullet[i][0]+=bullet[i][3];
    bullet[i][1]+=bullet[i][4];
    bullet[i][2]+=bullet[i][5];
    bullet[i][5]-=1;
    popMatrix();
  }
  //translate(cos(rz)*cos(ry)*200,sin(rz)*cos(ry)*200,sin(ry)*200);
  s();
}
void mousePressed(){
  bullet[lastBullet][0]=x;
  bullet[lastBullet][1]=y;
  bullet[lastBullet][2]=z;
  bullet[lastBullet][3]=cos(rz)*cos(ry)*1000;
  bullet[lastBullet][4]=sin(rz)*cos(ry)*1000;
  bullet[lastBullet][5]=sin(ry)*1000;
  lastBullet=lastBullet+1;
  if(lastBullet>=bullet.length){
    lastBullet=0;
  }
  println(lastBullet);
  s();
  //translate(cos(rz)*cos(ry)*200,sin(rz)*cos(ry)*200,sin(ry)*200);
  translate(200,0,0);
  sphere(30);
}