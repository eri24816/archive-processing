void setup(){
  size(800,400);
  stroke(0,0,200);
  noFill();
  background(255);
  
  translate(0,200);
  
  beginShape();
  for(int x=0;x<width;x++){
    vertex(x,f(x/10.0/PI));
  }
  
  endShape();
  saveFrame("wave7.png");
}

void draw(){
  
  
}
void mouesPressed(){
  
}
float f(float x){
  
  return(sin(x)+sin(x*2.0))*70.0;
}