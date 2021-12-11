public ComplexNumber[][] n;
ComplexNumber add;
int times=1;
a a1;
void setup(){
  a1=new a();
  add=new ComplexNumber(1,0);
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
  
   for (int x =  0; x < height; x++) {
  
    for (int y = 0; y < width; y++) {
       n[x][y]=new ComplexNumber((x-width/2)*0.005,(y-height/2)*0.005);
    }
  }
  colorMode(HSB,255);
  loadPixels();
  
  ComplexNumber t=new ComplexNumber(0,0);
  for (int x =  0; x < height; x++) {
  
    for (int y = 0; y < width; y++) {
      //n[x][y]=n[x][y].square().square();
      for(int i=0;i<times/*&&n[x][y].mod()<2*/;i++){
       t= t.sin(n[x][y].mult(2));
       //t.divide(n[x][y]);
       //t=t.conjugate();
      // t.multiply(new ComplexNumber(-1,0));
      //n[x][y]=n[x][y].square();
      //n[x][y].add(add);
      //n[x][y].add(t);
      //n[x][y]=n[x][y].add(n[x][y],new ComplexNumber((x-width/2)*0.005,(y-height/2)*0.005));
      

      /*
      n[x][y].multiply(a);
      n[x][y].multiply(a);
      n[x][y]=n[x][y].add(n[x][y],add);
      */
      
      }
      ComplexNumber c=t;
       
       color co=color((int)(((c.getArg()+PI)/TWO_PI)*255.0),(int)(pow(2,(float)-c.mod())*127.0),255);
       //color co=color((int)(((c.getArg()+PI)/TWO_PI)*255.0),(int)(((c.getArg()+PI)/TWO_PI)*255.0),0);
      pixels[x+y*width]=co;
      }
        
    }

  //a1._draw();
  updatePixels();
  
}
void mousePressed(){

  add=new ComplexNumber((mouseX-width/2)*0.005,(mouseY-height/2)*0.005);
  for (int x =  0; x < height; x++) {
  
    for (int y = 0; y < width; y++) {
       n[x][y]=new ComplexNumber((x-width/2)*0.005,(y-height/2)*0.005);
    }
  }
 
}