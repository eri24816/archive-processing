float w = 5;
float s = 0.2;
float xp = 0;
float yp = 0;
float mx = 0;
float my = 0;
float k=0;
float l=0;

float lxw=80;
float lx[]=new float[100];
float lx2[]=new float[lx.length];
int lxn;
float lyw=80;
float ly[]=new float[100];
float ly2[]=new float[lx.length];
int lyn;
boolean xyline=false;
boolean line=false;
boolean bl=false;

void setup(){
size(800, 800,P3D);
for(float z=-2;z<2;z+=00.1){
    background(255);
    k=z;
    
    
    float xmin;
    float ymin;
    if(keyPressed){
      if(keyCode==LEFT){
        xp-=w*s;
      }
      if(key=='f'){
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
    
    
  
    
    
    int maxiterations = 1000;
    
    // x goes from xmin to xmax
    float xmax = xmin + w;
    // y goes from ymin to ymax
    float ymax = ymin + w;
    
    // Calculate amount we increment x,y for each pixel
    float dx = (xmax - xmin) / (width*1);
    float dy = (ymax - ymin) / (height*1);
    
    // Start y
    float y = ymin;
    lyn=0;
    for (int j = 0; j < height; j++) {
      // Start x
      lxn=0;
      float x = xmin;
      for (int i = 0; i < width; i++) {
    
        // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
        float a = x;
        float b = y;
    
        int n = 0;
        while (n < maxiterations) {
          float aa = a;
          float bb = b;
          
          a = a*a - b*b +k;
          b = 2*aa*bb +l;
          // Infinty in our finite world is simple, let's just consider it 16
          if (a*a + b*b >100.0) {
            break;  // Bail
          }
          n++;
        }
        if (!(n == maxiterations)==bl) {
          point(i,j,z*100.0);
        }
        bl=(n == maxiterations);
        
        x += dx;
      }
      
      y += dy;
      
    }
  }



}
void draw(){
  camera(mouseX,mouseY,0,0,0,0,0,0);
}
  