void setup(){
  size(1900,800);
  strokeWeight(2);
  background(0);
  PImage bg=loadImage("3495.tif");
  
  image(bg,0,0);
  fill(0,0,10,200);
  rect(0,0,width,height);
}
float r=20,c=4;
float t=0,q=0,i,vin,pvin=0,pq=q,q0=q+(-q/c+f(0))/r;
float xs=1,ys=100;
float[] oct={0,1,0,0,1};
float w=0.01;
void draw(){
  
  translate(0,height/2);
  for(int j=0;j<10;j++){
    vin=f(t);
    i=(-q/c+vin)/r;
    q+=i;
    stroke(255,0,0);
    line(t*xs,q/c*ys,(t-1)*xs,pq/c*ys);
    stroke(0,0,255);
    line(t*xs,vin*ys,(t-1)*xs,pvin*ys);
    stroke(0,255,0);
    line(t*xs,fil(t)*ys,(t-1)*xs,fil(t-1)*ys);
    t++;
    pq=q;
    pvin=vin;
  }
}
float f(float x){
  float result=0;
  for(int i=0;i<oct.length;i++){
    result+=oct[i]*cos(i*w*x);
  }
  return result;
}
float fil(float x){
  float result=0;
  for(int i=0;i<oct.length;i++){
    result+=oct[i]/sqrt(r*r*c*c*i*i*w*w+1)*cos(i*w*x-atan(r*c*i*w))+q0*exp(-x/r*c);
  }
  return result;
}
