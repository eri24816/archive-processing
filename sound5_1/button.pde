class Button{
  int x,y,w,h;
  color c;
  String t="";
  boolean pressing=false;
  Button(int x,int y,int w,int h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    c=color(230);
  }
  void display(){
    fill(c);
    rect(x,y,w,h);
    textAlign(CENTER);
    fill(0);
    text (t,x+w/2,y+h/2);
  }
  boolean press(){
    if((mouseX>x)&&(mouseX<x+w)&&(mouseY>y)&&(mouseY<y+h)&&mousePressed){
      if(!pressing){
        pressing=true;
        return true;
      }
    }
    else{pressing=false;}
    return false;
  }
  void setColor(color c){
    this.c=c;
  }
  void setText(String t){
    this.t=t;
  }
}
