c c[];
m m[];
float friction=0.01;
void setup(){
  size(800,800);
  int i=0;
  for(int x=0;x<=width;x+=20){
    for(int y=0;y<=height;y+=20){
      i++;
    }
  }
  c=new c[i];
  i=0;
  for(int x=0;x<=width;x+=20){
    for(int y=0;y<=height;y+=20){
      c[i]=new c(x,y,0,PI*0.5,7);
      i++;
    }
  }
  
  m=new m[1];
  m[0]=new m(400,400,0);
  //m[1]=new m(500,650,PI);
  
}
void draw(){
  background(200);
  for(int a=0;a<7;a++){
 // friction+=0.0001;

    
    for(int i=0;i<m.length;i++){
      m[i].update();
      for(int j=0;j<c.length;j++){
        m[i].addForceAt(c[j]);
      }
    }
    for(int i=0;i<c.length;i++){
      c[i].rotate();
      c[i].update();
    }
  
  }
    for(int i=0;i<m.length;i++){
    m[i].display();
  }
  for(int i=0;i<c.length;i++){
    c[i].display();
  }
}
float direction(float x,float y){
  if(y>0){
    return (acos(x/dist(0,0,x,y)));
  }
  else{
    return (-acos(x/dist(0,0,x,y)));
  }
}

float forceBetween(float x1,float y1,float x2,float y2){
  return 1.0/dist(x1,y1,x2,y2)/dist(x1,y1,x2,y2);
  
  
}

//println(c[0].r+","+((direction(c[0].l*cos(c[0].r),c[0].l*sin(c[0].r))+PI*2)%(PI*2)));