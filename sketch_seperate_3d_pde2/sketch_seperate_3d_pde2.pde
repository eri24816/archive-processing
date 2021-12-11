/*int p=int(random(0,2));
int k=int(random(1,10));
int m=int(random(1,10));*/

int   words;
int   t=0;
float maxt;
int   a=1;
int   b=4;
int   c=7;
int   m=0;
int   n=0;
int   o=0;
boolean f;
void setup(){
  size(200,900);
  background(255); 
  arrows(); 
}
void draw(){
  
}
void mousePressed(){
  
  
  if(get(mouseX,mouseY)==color(0,0,200)){
    if(mouseX<width/2){a--;}
    else{a++;}
  }
  if(get(mouseX,mouseY)==color(0,200,0)){
    if(mouseX<width/2){b--;}
    else{b++;}
  }
  if(get(mouseX,mouseY)==color(200,0,0)){
    if(mouseX<width/2){c--;}
    else{c++;}
  }
  background(255); 
  arrows();
 /*if(mouseY<190&&mouseY>150){
    m=a;
    n=b;
    o=c;
    run();}*/
    
  
  m=a;
  n=b;
  o=c;
  run();
  
 
  
}