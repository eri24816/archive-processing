float z;

void setup(){
  
  size(300, 300, P3D);

}
void draw(){
  //pushMatrix();
  translate(width/2,height/2,0);
  
  
  rotateX(-mouseY/30.0);
  rotateZ(mouseX/30.0);
  lights();
  
  //popMatrix();
  scale(1);
  background(255);
  noFill();
  
  
  
  for(int x=-width/2;x<=width/2;x+=1){
    beginShape();
    for(int y=-height/2;y<=height/2;y+=1){
      z( x, y);
      vertex(x, y,z);
    }
    endShape();
  }
  for(int y=-height/2;y<=height/2;y+=1){
    beginShape();
    for(int x=-width/2;x<=width/2;x+=1){
      z( x, y);
      vertex(x, y,z);
    }
    endShape();
  }
  //rotateZ(PI);
  translate(200,0,0);
  //text("z=sin(x/10.0)/sin(y/10.0);",50,50);
  
  
}
void z(float xxx,float yyy){
  float w = 5;
float h = (w * height) / width;
float k = 0.1;
float l = 0.3;


float xmin = -w/2;
float ymin = -h/2;





int maxiterations = 100;





    // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
    float a = xxx/100.0;
    float b = yyy/100.0;

    int n = 0;
    while (n < maxiterations) {
      float aa = a * a;
      float bb = b * b;
      float twoab = 2.0 * a * b;
      a = aa - bb +a+ xxx/100.0;
      b = twoab + yyy/100.0;
      // Infinty in our finite world is simple, let's just consider it 16
      if (aa + bb > 16.0) {
        break;  // Bail
      }
      n++;
    }

    // We color each pixel based on how long it takes to get to infinity
    // If we never got there, let's pick the color black
    if (n == maxiterations) {
      z=255;
      stroke(200);
    } else {
      // Gosh, we could make fancy colors here if we wanted
      z=(n*16 % 255);
      stroke(n*16 % 255);
    }

}


void mousePressed(){
  saveFrame("##");
}
  