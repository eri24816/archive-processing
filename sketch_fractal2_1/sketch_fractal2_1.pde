
float theta;   

void setup() {
  size(640, 360);
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);

  float a = (mouseX / (float) width) * 90f*4/3;

  theta = radians(a);

  translate(width/2,height);

  line(0,0,0,-120);

  translate(0,-120);

  branch(height-mouseY);

}

void branch(float h) {
  //stroke(sin(logn(0.7,h/(height-mouseY))/5)*255,255,255-sin(logn(0.7,h/(height-mouseY))/5)*255);
  h *= 0.7;
  
  
  if (h > 2) {
    pushMatrix();   
    rotate(logn(0.7,h/(height-mouseY))+theta);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);       
    popMatrix();     
    

    pushMatrix();
    rotate(logn(0.7,h/(height-mouseY)));
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
  }
}
float logn(float m,float n){
  return((log(m) / log(n)));
}

  