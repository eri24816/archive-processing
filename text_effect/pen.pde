class Pen{
  float x,y,x1=0.1,y1=0;
  float drag=0.0002;
  
  Pen(float x,float y){
    this.x=x;this.y=y;
  }
  void display(){ellipse(x,y,5,5);
  }
  void move(){
    
    if(inRect(x+x1,y+y1,0,ori.width,0,ori.height)){
      x+=x1;y+=y1;
    }
  }
  void drag(){
    x1-=x1*drag;
    y1-=y1*drag;
  }
}
