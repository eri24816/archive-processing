float a=0;
float b=0;


void setup(){
 size(800,800);
 background(0);
} 
void draw(){
  if(mousePressed){
    if(mouseY-400!=0){
       
      f((mouseX-400)/200.0,(mouseY-400)/200.0,0);
    }
    
  }
}
void f(float c,float d,int t){
  if(t<10){
    b=sqrt(-c+sqrt(c*c+d*d));
    a=(2*c*b+2*b*b*b)/d;
    //a++;
    stroke(255,255,255);
    point(a*200.0+400,b*200.0+400);
    f(a,b,t+1);
    f(a,-b,t+1);
   println(d);
    
  }
}
void mousePressed(){

}