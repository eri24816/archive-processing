int x ;
int y;
int x2;
int y2;
void setup() {
  size(1000,500); 

   background(0); 
    x =0;
}

void draw() {
x= x+1;
float y=sin(x);
x2 = x+1;
float y2=sin(x);
 
  fill(255, 204);
  stroke(225);
 line(x,50*(-y)+height/2,x2,50*(-y2)+height/2);
 delay(0);
}