float w = 5;
float xp = 0;
float yp = 0;
void setup(){
size(600, 600);

background(255);
}
void draw(){
  


  float h = 6;
  float k;
  float l;
  float xmin;
  float ymin;
  if(keyPressed){
    if(keyCode==LEFT){
      xp-=w;
    }
    if(key=='s'){
      saveFrame( "###");
    }
    if(keyCode==RIGHT){
      xp+=w;
    }
    if(keyCode==DOWN){
      yp-=w;
    }
    if(keyCode==UP){
      yp+=w;
    }
  }
  
  
  xmin = -w/2.0+xp;
  ymin = -w/2.0-yp;
  
  
  loadPixels();
  k=(mouseX-width/2);
  l=(mouseY-height/2);
  
  int maxiterations = 100;
  
  // x goes from xmin to xmax
  float xmax = xmin + w;
  // y goes from ymin to ymax
  float ymax = ymin + w;
  
  // Calculate amount we increment x,y for each pixel
  float dx = (xmax - xmin) / (width*1);
  float dy = (ymax - ymin) / (height*1);
  
  // Start y
  float y = ymin;
  for (int j = 0; j < height; j++) {
    // Start x
    float x = xmin;
    for (int i = 0; i < width; i++) {
  
      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      float a = x;
      float b = y;
  
      int n = 0;
      while (n < maxiterations) {
        float aa = a;
        float bb = b;
        
        a = a*a - b*b +k/100;
        b = 2*aa*bb +l/100;
        // Infinty in our finite world is simple, let's just consider it 16
        if (a*a + b*b >10000.0) {
          break;  // Bail
        }
        n++;
      }
  
      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      } else {
        // Gosh, we could make fancy colors here if we wanted
        pixels[i+j*width] = color(n*16.0 % 255,n*16.0 % 255,n*16.0 % 255);
      }
      x += dx;
    }
    y += dy;
}

updatePixels();}
void mousePressed(){
  if ((mouseButton == LEFT)) {
    w/=2;
  } if(mouseButton == RIGHT) {
    w*=2;
  }
}