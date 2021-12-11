float p1x=300;

void setup(){
size(800, 800);
background(255);
strokeWeight(1);
}
void draw(){
  background(255);
  translate(400,400);
  for(float a=-400;a<400;a++){
    line(sin(mouseX/10+a/10)*300,a,a,cos(a+mouseY/10)*300);
  }
}
void mousePressed(){
  saveFrame("##");
}