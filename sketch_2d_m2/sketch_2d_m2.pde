float w = 5;
float s = 0.1;
float xp = 0;
float yp = 0;
float mx = 0;
float my = 0;
float k;
float l;
float lx;
boolean line=false;
void setup(){
size(600, 600);

background(255);
}
void draw(){
  //k=(mouseX-width/2);
  //l=(mouseY-height/2);
  


  float h = 6;
  
  float xmin;
  float ymin;
  if(keyPressed){
    if(keyCode==LEFT){
      xp-=w*s;
    }
    if(key=='s'){
      saveFrame( "###");
    }
    if(keyCode==RIGHT){
      xp+=w*s;
    }
    if(keyCode==DOWN){
      yp-=w*s;
    }
    if(keyCode==UP){
      yp+=w*s;
    }
    
  }
  
  
  xmin = -w/2.0+xp;
  ymin = -w/2.0-yp;
  
  
  loadPixels();
  
  
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
        
        a = a*a - b*b + x+k/100;
        b = 2*aa*bb + y+l/100;
        // Infinty in our finite world is simple, let's just consider it 16
        if (a*a + b*b >10000.0) {
          break;  // Bail
        }
        n++;
      }
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

  updatePixels();
  if(line){
    text(sqrt((mouseX-mx)*(mouseX-mx)+(mouseY-my)*(mouseY-my))*w,10,10);
    
    rect(mx-2,my-2,4,4);
  }
  for(float a=-width/2;a<width;a+=80){
    line(a,0,a,width);
    text(80*dx*a- xmin,a,10);
  }
}
void keyPressed(){
  if ((key == 'w')) {
    w/=2;
  } if(key == 's') {
    w*=2;
  }
}
void mousePressed(){
  if(line){
    line=false;
  }
  else{
    mx =mouseX;
    my =mouseY;
    line=true;
  }
}
    
      