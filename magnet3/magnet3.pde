c c[];
m m[];
pen p;
float friction=0.01;
twoBalls t;
void setup(){
  t=new twoBalls(new v2(400,100),0.0,20);
  t.v=new v2(4,2);
  p=new pen(t.pos);
  size(800,800);
  /*
  int i=0;
  for(int x=0;x<=width;x+=200){
    for(int y=0;y<=height;y+=200){
      i++;
    }
  }
  c=new c[i];
  i=0;
  for(int x=0;x<=width;x+=200){
    for(int y=0;y<=height;y+=200){
      c[i]=new c(x,y,0,PI*0.5,7);
      i++;
    }
  }
  
  m=new m[1];
  m[0]=new m(400,400,0);
*/
  
}
void draw(){
  //background(200);
  for(int a=0;a<1000;a++){
  //t.addForce(new v2(0,0),new v2(0,0));
  t.update();
  //t.display();
  
  
  if(true){
    v2 f1=new v2((200-t.pos1.x),(400-t.pos1.y));
    f1.Mult(1000/f1.GetLength()/f1.GetLength()/f1.GetLength());
    t.addForce(f1,new v2(0,0));
    
    v2 f2=new v2((200-t.pos2.x),(400-t.pos2.y));
    f2.Mult(1000/f2.GetLength()/f2.GetLength()/f2.GetLength());
    t.addForce(new v2(0,0),f2);
    
    f1=new v2((600-t.pos1.x),(400-t.pos1.y));
    f1.Mult(1000/f1.GetLength()/f1.GetLength()/f1.GetLength());
    t.addForce(f1,new v2(0,0));
    
    f2=new v2((600-t.pos2.x),(400-t.pos2.y));
    f2.Mult(1000/f2.GetLength()/f2.GetLength()/f2.GetLength());
    t.addForce(new v2(0,0),f2);
    p.moveTo(p.pos);
    //point(t.pos.x,t.pos.y);
  }
  }
  /*
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
  */
}
float direction(float x,float y){
  if(dist(0,0,x,y)==0){
    return(0);
  }
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