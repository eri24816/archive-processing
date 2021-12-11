
Complex a[];
Complex b[];
Complex g[]=new Complex[500];
int state=291;
void setup(){
  size(1000,1000);
  background(0);
  
}

float t;int maxn=101;
void draw(){
  
  if(state==1){
    fill(0);
    stroke(255);
    background(0);
    translate(width/2,height/2);
    beginShape();
    vertex(0,0);
    Complex z=new Complex(0,0);
    for(int i=0;i<a.length;i++){
      z=add(z,mult(a[i],cis(t*(i+1))));
      vertex(z.re,z.im);
      z=add(z,mult(b[i],cis(-t*(i+1))));
      vertex(z.re,z.im);
    }
    endShape();
    point(z.re,z.im);
    t+=0.01;
  }
  else if(state==2){
    fill(0);
    stroke(255);
    translate(width/2,height/2);
    Complex z=new Complex(0,0);
    for(int i=0;i<a.length;i++){
      z=add(z,mult(a[i],cis(t*(i+1))));
      z=add(z,mult(b[i],cis(-t*(i+1))));
    }
    t+=0.01;
    point(z.re,z.im);
  }
  else if(state==300){
    if(!(t<g.length)){
      ft(g.length);
      strokeWeight(2);
      state=1;
      return;
    }
    g[(int)t]=new Complex(mouseX-width/2,mouseY-height/2);
    t++;
    //background(0);
    stroke(255);
    strokeWeight(20);
    line(0,0,t*width/g.length,0);
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
  else if(state>290){state++;return;}
  else if(state==3){state=291;return;}
}
Complex f(float x){
  return g[(int)(x*g.length)];
}
void ft(int dtin){
  a=new Complex[maxn];
  b=new Complex[maxn];
  for(int n=0;n<maxn;n++){
    float t;
    Complex sum=new Complex(0,0);
    for(int i=0;i<dtin;i++){
      t=((float)i/dtin);
      sum=add(sum,mult(f(t),cis(-2*PI*(n+1)*t)));
    }
    a[n]=divide(sum,dtin);
    sum=new Complex(0,0);
    for(int i=0;i<dtin;i++){
      t=((float)i/dtin);
      sum=add(sum,mult(f(t),cis(2*PI*(n+1)*t)));
    }
    b[n]=divide(sum,dtin);
  }
  
}
void keyPressed()
{
  if(key=='w'){
    maxn+=5;
    ft(g.length);
    fill(255);
    text(maxn,10,10);
    fill(0);
  }
  else if(key=='s'){
    if(maxn>5){
      maxn-=5;
      ft(g.length);
      fill(255);
      text(maxn,10,10);
      fill(0);
    }
  }
  else{
  background(0);
  t=0;
  state=(int)key-48;
  }
}
