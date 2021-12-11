float z;
float c=10.0;

void setup(){
  background(0);
  size(500,500);}
void draw(){
  translate(250,250);

  for(float aa=-255/c;aa< width/c;aa+=0.1){
      for(float bb=-255/c;bb<height/c ;bb+=0.1){
        float a=aa*c;
        float b=bb*c;
        stroke((a*a *a- 3.0*a*b*b  +125)/10.0%255,(-bb*bb*bb+3.0*aa*aa*bb+125)/10.0%255,0);
        point(a,b);
       
      }
  }
}

void a(int x,int y){
  z=sin(x)+cos(y)+2;
}