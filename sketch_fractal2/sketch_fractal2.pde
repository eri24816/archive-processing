
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

  h *= 0.5;

  if (h > 2) {
    pushMatrix();   
    rotate(theta);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);       
    popMatrix();     
    
    
    pushMatrix();
    rotate(PI/3);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(-PI/3);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    

  }
}