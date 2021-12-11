ComplexNumber[][] n;
ComplexNumber p;
ComplexNumber add;
void setup(){
  add=new ComplexNumber(-0.1,0.72);
  p=new ComplexNumber(0,0);
  //frameRate(1);
    size(800,800);
  n=new ComplexNumber[width][height];
  for (int x =  0; x < height; x++) {
  
    for (int y = 0; y < width; y++) {
       n[x][y]=new ComplexNumber((x-width/2)*0.005,(y-height/2)*0.005);
    }
  }
  
}

void draw(){
  
  noLoop();
  //background(255);
  colorMode(HSB, 255);
  loadPixels();
  
  
  for (int x =  0; x < height; x++) {
  
    for (int y = 0; y < width; y++) {
      n[x][y]=n[x][y].square();
      n[x][y]=n[x][y].add(n[x][y],add);
       ComplexNumber c=n[x][y];
       
       color co=color((int)(((c.getArg()+PI)/TWO_PI)*255.0),(int)(pow(3,(float)-c.mod())*127.0),255);
       //color co=color((int)(((c.getArg()+PI)/TWO_PI)*255.0),(int)(((c.getArg()+PI)/TWO_PI)*255.0),0);
      pixels[x+y*width]=co;
      }
        
    }

  
  updatePixels();
  //ellipse((float)p.x(),(float)p.y(),5,5);
  //print(frameCount);
}
void mousePressed(){
  if(mouseButton==LEFT) {
  p=new ComplexNumber((mouseX-width/2)*0.005,(mouseY-height/2)*0.005);
}
  else{add=new ComplexNumber((mouseX-width/2)*0.005,(mouseY-height/2)*0.005);
  for (int x =  0; x < height; x++) {
  
    for (int y = 0; y < width; y++) {
       n[x][y]=new ComplexNumber((x-width/2)*0.005,(y-height/2)*0.005);
    }
  }}
 
}