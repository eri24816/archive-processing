class ball{
  c pos,vel,ppos;
  float mass=1;
  float sizeFactor=0.03;
  boolean fixed=false;
  float size;
  ball(c pos, c vel,float mass){
    this.pos=pos;
    this.vel=vel;
    this.mass=mass;
    size=pow(abs(mass),0.33)*scale.abs()*sizeFactor;
  }
  void addJ(c j){
    vel=add(vel,divide(j,mass));
  }
  void update(){
    //vel=add(vel,new c(0,g));
    if(!fixed){
      ppos=pos;
      pos=add(pos,vel);}
  }
  void display(){
    c p=toScreen(pos);
    fill(255);
    ellipse(p.re,p.im,size,size);
    fill(200);
    textSize(size*0.5);
    textAlign(CENTER);
    stroke(255);
    text((int)(mass),p.re,p.im+size);
  }
  void trail(){
    c p=toScreen(pos);
    c pp=toScreen(ppos);
    stroke(frameCount%255,255,max(vel.abs()*500000.0,100));
    line(pp.re,pp.im,p.re,p.im);
  }
  
}
class two_balls{
  c pos,vel;
  ball a,b;
  float rot,avel,len;
  two_balls(ball a,ball b,float len){
    this.a=a;
    this.b=b;
    this.len=len;
    this.pos=divide(add(mult(a.pos,a.mass),mult(b.pos,b.mass)),a.mass+b.mass);
    this.vel=divide(add(mult(a.vel,a.mass),mult(b.vel,b.mass)),a.mass+b.mass);
  }
  void update(){
    pos=add(pos,vel);
    rot+=avel;
    a.pos=add(pos,mult(len*b.mass/(a.mass+b.mass),cis(rot)));
    b.pos=add(pos,mult(-len*a.mass/(a.mass+b.mass),cis(rot)));
  }
  void display(){
    a.display();
    b.display();
  }
  
}
