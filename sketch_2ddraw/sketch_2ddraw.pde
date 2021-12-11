float an=0;
int r=300;
float x=width/2;
float y=height/2;
float xplus;
float yplus;
char oldkey;
int press;
void setup(){
  background(0);
size(500,500);}
void draw(){
  background(0);
   x=mouseX;
   y=mouseY;
   
translate(width/2,height/2);
for(float i=1;i<1000;i+=5){

  
  stroke(255);
  xplus=sin(i);
  yplus=cos(i);
  line(sin(cos(i))*r,cos(sin(i))*r,sin(sin(i+x/50))*r,  cos(cos(i+y/50))*r);
}
  if (mousePressed&&press==0){
     saveFrame("mouseX,mouseY");
     press=2;
   }
   if ((press==2)&&(mousePressed!=true)){press=0;}
  //saveFrame("####");

}