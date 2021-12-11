class m{
  float x,y;
  float r;
  float w=60,h=300;
  float xn,xs,yn,ys;
  m(float x1,float y1 ,float r1){
    x=x1;
    y=y1;
    r=r1;
  }
  void update(){
    xn=x+0.5*h*cos(r);
    yn=y+0.5*h*sin(r);
    xs=x-0.5*h*cos(r);
    ys=y-0.5*h*sin(r);
    r+=0.001;//----------------------------------------------
  }
  void display(){
    strokeWeight(1);
    pushMatrix();
    translate(x,y);
    rotate(r+PI*0.5);
    fill(200,0,0);
    rect(-w*0.5,-h*0.5,w,h*0.5);
    fill(0,0,200);
    rect(-w*0.5,0,w,h*0.5);
    popMatrix();
    
    
    
    //ellipse(xn,yn,20,20);
    //ellipse(xs,ys,10,10);
  }
  void addForceAt(c c1){
    float dir;
    float forceS,forceN;
    //float forceSx,forceNx;
    
    
    dir=direction(xn-c1.xn,yn-c1.yn);
    forceN=100.0*sin(dir-c1.r)*forceBetween(xn,yn,c1.xn,c1.yn);
    
    dir=direction(xn-c1.xs,yn-c1.ys);
    forceS=-100.0*sin(dir-c1.r)*forceBetween(xn,yn,c1.xs,c1.ys);
    
    //forceNx=30.0*cos(dir-c1.r)/dist(xn,yn,c1.xn,c1.yn)/dist(xn,yn,c1.xn,c1.yn);//------
    dir=direction(xs-c1.xs,ys-c1.ys);
    forceS+=100.0*sin(dir-c1.r)*forceBetween(xs,ys,c1.xs,c1.ys);
    
    dir=direction(xs-c1.xn,ys-c1.yn);
    forceN-=100.0*sin(dir-c1.r)*forceBetween(xs,ys,c1.xn,c1.yn);
    
    //forceSx=30.0*cos(dir-c1.r)/dist(xs,ys,c1.xs,c1.ys)/dist(xs,ys,c1.xs,c1.ys);//-----
    pushMatrix();
    translate(c1.xn,c1.yn);
    rotate(c1.r);
    //line(0,0,forceNx*1000000,forceN*1000000); 
    popMatrix();
    
   /* pushMatrix();
    translate(c1.xs,c1.ys);
    rotate(c1.r);
    line(0,0,0,forceS*1000000);  
    //line(0,0,forceSx*1000000,forceS*1000000); 
    popMatrix();*/
    
    c1.s+=forceN-forceS;
  }
}
//line(c1.xn,c1.yn,c1.xn+100*cos(dir),c1.yn+100*sin(dir));