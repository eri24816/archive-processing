float t,x,y,s=1;
void setup(){
  size(1920,1080);
  background(255);
  colorMode(HSB);
  
  
}
void draw(){
  noStroke();
  fill(10, 0,255,80);
  rect(0,0,width,height);
  translate(width/2,height/2);
  scale(s);
  translate(x,y);
  stroke(0);
  strokeWeight(1.0/s);
  line(tx(0),ty(height/2),tx(width),ty(height/2));
  line(tx(width-20),ty(height/2+20),tx(width),ty(height/2));
  line(tx(width-20),ty(height/2-20),tx(width),ty(height/2));
  line(tx(width/2),ty(0),tx(width/2),ty(height));
  line(tx(width/2+20),ty(20),tx(width/2),ty(0));
  line(tx(width/2-20),ty(20),tx(width/2),ty(0));
  fill(0);
  textSize(20/s);
  float del=pow(10.0,int(log((tx(width)-tx(0))/3.0)/log(10.0)));
  for(float i=0;i<tx(width);i+=del){
    line(i,5.0/s,i,-5.0/s);
    text(i>1?int(i)+"λ":i+"λ",i,0);
  }
  for(float i=-del;i>tx(0);i-=del){
    line(i,5.0/s,i,-5.0/s);
    text(i<-1?int(i)+"λ":i+"λ",i,0);
  }
  for(float i=0;i<ty(height);i+=pow(10.0,int(log((ty(height)-ty(0))/3.0)/log(10.0)))){
    line(5.0/s,i,-5.0/s,i);
    text(i>1?int(i)+"λ":i+"λ",0,i);
  }
}
void mouseWheel(MouseEvent event) {
  s/=1+event.getCount()*0.1;
}
void mouseDragged(){
  if(mouseButton==CENTER){
    x+=(mouseX-pmouseX)/s;y+=(mouseY-pmouseY)/s;
  }
}
float tx(float px){//mouseX after transformation
  return (px-width/2)/s-x;
}
float ty(float py){
  return (py-height/2)/s-y;
}
