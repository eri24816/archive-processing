class m{
  v2 pos,posn,poss;
  float r;
  float w=60,h=400;
  
  m(float x1,float y1 ,float r1){
    pos=new v2(x1,y1);
    r=r1;
    posn=new v2(0,0);
    poss=new v2(0,0);
  }
  void update(){
    posn.x=pos.x+0.5*h*cos(r);
    posn.y=pos.y+0.5*h*sin(r);
    poss.x=pos.x-0.5*h*cos(r);
    poss.y=pos.y-0.5*h*sin(r);
    //r+=0.004;//----------------------------------------------
  }
  void display(){
    strokeWeight(1);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(r+PI*0.5);
    fill(200,0,0);
    rect(-w*0.5,-h*0.5,w,h*0.5);
    fill(0,0,200);
    rect(-w*0.5,0,w,h*0.5);
    popMatrix();
    
    
    
    //ellipse(posn.x,posn.y,20,20);
    //ellipse(poss.x,poss.y,10,10);
  }
  /*
  void addForceAt(c c1){
    float dir;
    float forceS,forceN;
    //float forceSx,forceNx;
    
    
    dir=direction(posn.x-c1.posn.x,posn.y-c1.posn.y);
    forceN=100.0*sin(dir-c1.r)*forceBetween(posn.x,posn.y,c1.posn.x,c1.posn.y);
    
    dir=direction(posn.x-c1.poss.x,posn.y-c1.poss.y);
    forceS=-100.0*sin(dir-c1.r)*forceBetween(posn.x,posn.y,c1.poss.x,c1.poss.y);
    
    //forceNx=30.0*cos(dir-c1.r)/dist(posn.x,posn.y,c1.posn.x,c1.posn.y)/dist(posn.x,posn.y,c1.posn.x,c1.posn.y);//------
    dir=direction(poss.x-c1.poss.x,poss.y-c1.poss.y);
    forceS+=100.0*sin(dir-c1.r)*forceBetween(poss.x,poss.y,c1.poss.x,c1.poss.y);
    
    dir=direction(poss.x-c1.posn.x,poss.y-c1.posn.y);
    forceN-=100.0*sin(dir-c1.r)*forceBetween(poss.x,poss.y,c1.posn.x,c1.posn.y);
    
    //forceSx=30.0*cos(dir-c1.r)/dist(poss.x,poss.y,c1.poss.x,c1.poss.y)/dist(poss.x,poss.y,c1.poss.x,c1.poss.y);//-----
    pushMatrix();
    translate(c1.posn.x,c1.posn.y);
    rotate(c1.r);
    //line(0,0,forceNx*1000000,forceN*1000000); 
    popMatrix();
    
    pushMatrix();
    translate(c1.poss.x,c1.poss.y);
    rotate(c1.r);
    line(0,0,0,forceS*1000000);  
    //line(0,0,forceSx*1000000,forceS*1000000); 
    popMatrix();
    
    c1.s+=forceN-forceS;
  }
  */
}
//line(c1.posn.x,c1.posn.y,c1.posn.x+100*cos(dir),c1.posn.y+100*sin(dir));