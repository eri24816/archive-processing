class slide{
  float x,y,len,value,min,max;
  slide(float x,float y,float len,float min,float max){
    this.x=x;
    this.y=y;
    this.len=len;
    this.min=min;
    this.max=max;
    value=min;
  }
  void display(){
    noStroke();
    fill(0);
    rect(x,y-3,len,6);
    fill(100);
    ellipse(map(value,min,max,x,x+len),y,20,20);
  }
  void update(){
    if(mousePressed&&inRect(mouseX,mouseY,x,y-10,len,20)){
      value=map(mouseX,x,x+len,min,max);
    }
  }
}
