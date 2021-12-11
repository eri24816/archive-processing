twoBalls t[];
m m[];
float friction=0.01;
pen p[];
void setup(){
  background(0);
  size(800,800);
  int i=0;
  for(int x=0;x<=width;x+=250){
    for(int y=0;y<=height;y+=250){
      i++;
    }
  }
  t=new twoBalls[i];
  i=0;
  for(int x=0;x<=width;x+=250){
    for(int y=0;y<=height;y+=250){
      t[i]=new twoBalls(new v2(x,y),PI*0.5,200);
      t[i].freezePos=true;
      i++;
    }
  }
  
  m=new m[1];
  m[0]=new m(600,400,0);
  m[0].update();
  m[0].display();
  

  p= new pen[50];
  for(int j=0;j<p.length;j++){
    p[j]=new pen(new v2(cos(2.0*PI*j/p.length)*1.0+200,sin(2.0*PI*j/p.length)*1.0+400));
  }
}
void mousePressed(){
  p[0]=new pen(new v2(mouseX,mouseY));
}

void draw(){
  for(int a=0;a<100;a++){
    for(int j=0;j<p.length;j++){ 
      v2 b=new v2(0,0);
      for(int i=0;i<m.length;i++){ 
        v2 c=force(m[i].posn,p[j].pos,1);
        c.Mult(-1.0);
        b.Add(c);
        
        b.Add(force(m[i].poss,p[j].pos,1));
        
      }
      //strokeWeight(min(sqrt(sqrt(b.GetLength()))*20,5));
      stroke(300-sqrt(sqrt(b.GetLength()))*2000,200-sqrt(sqrt(b.GetLength()))*2000,sqrt(sqrt(b.GetLength()))*2000);
      b.Mult(1.0/b.GetLength());
      
      p[j].move(b);
    }
    //background(200);
  

    for(int i=0;i<m.length;i++){
      m[i].update();
      for(int j=0;j<t.length;j++){
        
        t[j].addForce(force(m[i].posn,t[j].pos1,800),force(m[i].poss,t[j].pos2,800));
        t[j].addForce(force(m[i].posn,t[j].pos2,-800),force(m[i].poss,t[j].pos1,-800));
       
      }
    }
    for(int i=0;i<t.length;i++){
      t[i].update();
    }
  
  }
    for(int i=0;i<m.length;i++){
    //m[i].display();
  }
  for(int i=0;i<t.length;i++){
    //t[i].display();
  }
  
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