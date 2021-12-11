float a[];
int n=1024;
void setup() {
  size(1674,548);
  background(102);
}

void draw() {
  PImage img=loadImage("wave2.png");
  image(img,0,0);
  stroke(255);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  a=new float[n];
}
void keyPressed(){
  color c=color(255,255,255);
  int j=0;
  for(float x=0;j<n;x+=width/(float((n-1)))){
    int y=0;
    c=get(int(x),y);
    while((!isblue(c))&&(y<height)){
      c=get(int(x),y);
      y++;
    }
  a[j]=y;
  j++;
  }
  float max=max(a);
  float min=min(a);
  for(int i=0;i<a.length;i++){
    a[i]=map(a[i],max,min,-1,1);
    //print(",");
    println((int)(a[i]*100)/100.0);
  }
  
  

}
boolean isblue(color c){
  return (blue(c)-(red(c)+green(c))/2.0>10);

}