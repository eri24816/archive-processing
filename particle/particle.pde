ParSys ps;
float orginalX, orginalY;
float sc=1,trX,trY;
void setup() {
  
  size(800, 800);
  colorMode(HSB);
  background(10, 1,255);
  orginalX=0;
  orginalY=0;
  trX=width/2;
  trY=height/2;
  ps=new ParSys(200);

}
void draw() {
  noStroke();
  fill(10, 1,255,100);
  rect(0,0,width,height);
  
  translate(trX,trY);
  scale(sc);
  ps.update();
  ps.display();

}

void mouseWheel(MouseEvent event) {
  sc*=event.getCount()==1?0.9:1.111;
}
