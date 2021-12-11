class graph{
  int x,y,w,h,axisWidth=3,gridWidth=1,girdAmount=11;
  float x1,x2,y1,y2;
  graph(int x,int y,int h,int w,float x1,float x2,float y1,float y2){
    this.x=x;this.y=height-y;this.w=w;this.h=h;
    this.x1=x1;this.x2=x2;this.y1=y1;this.y2=y2;
  }
  void axis(){
    
    strokeWeight(axisWidth);
    line(x,y,x+w,y);
    line(x,y,x,y-h);
  }
  void grid(){
    fill(0);
    stroke(150);
    strokeWeight(gridWidth);
    for(int i=0;i<girdAmount;i++){
      line(map(i,0,girdAmount-1,x,x+w),y,map(i,0,girdAmount-1,x,x+w),y-h);
      text(map(i,0,girdAmount-1,x1,x2),map(i,0,girdAmount-1,x,x+w),y+20);
    }
    textAlign(CENTER,CENTER);
    for(int i=0;i<girdAmount;i++){
      line(x,map(i,0,girdAmount-1,y,y-h),x+w,map(i,0,girdAmount-1,y,y-h));
      text(map(i,0,girdAmount-1,y1,y2),x-20,map(i,0,girdAmount-1,y,y-h));
    }
  }
}
void setup(){
  size(800,800);
  background(255);
  graph g=new graph(50,50,500,500,0,1,0,1);
  g.axis();
  g.grid();
  
}
