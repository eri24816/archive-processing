class twoBalls{
  v2 pos,v,a,pos1,pos2;
  float rot,rotv,rota,l;
  
  boolean freezePos=false;
  twoBalls(v2 pos1,float rot1,float l1){
    pos=pos1;
    rot=rot1;
    v= new v2(0,0);
    a= new v2(0,0);
    rotv=0;
    rota=0;
    l=l1;
    freezePos=false;
    update();
  }
  
  void update(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(rot);
    popMatrix();
    if(!freezePos){
      v.Add(a);
      pos.Add(v);
    }
    a=new v2(0,0);
    rotv+=rota;
    rot+=rotv;
    rota=0;
    pos1=new v2(pos.x+cos(rot)*l*0.5,pos.y+sin(rot)*l*0.5);
    pos2=new v2(pos.x+cos(rot)*l*-0.5,pos.y+sin(rot)*l*-0.5);
  }
  void addForce(v2 f1,v2 f2){
    pos1=new v2(pos.x+cos(rot)*l*0.5,pos.y+sin(rot)*l*0.5);
    pos2=new v2(pos.x+cos(rot)*l*-0.5,pos.y+sin(rot)*l*-0.5);
    a.Add(f1);
    a.Add(f2);
    f1.Rotate(-rot);
    f2.Rotate(-rot);
    
    rota+=(f1.y-f2.y)/l;
  }
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(rot);
    line(-l*0.5,0,l*0.5,0);
    //ellipse(l*0.5,0,10,10);
    //ellipse(-l*0.5,0,10,10);
    
    
    popMatrix();
    fill(255,255,0);
    //ellipse(pos1.x,pos1.y,1,10);
    fill(0,255,255);
    //ellipse(pos2.x,pos2.y,10,10);
  }
  
  
  
  
}