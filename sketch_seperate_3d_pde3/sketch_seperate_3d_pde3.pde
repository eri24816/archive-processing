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
int entering=0;
boolean f;
String enter="0";
void setup(){
  size(500,900);
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
void keyPressed(){
  if(key>=48&&key<=58){
  enter=enter+key;
  }
  if(key==ENTER){    
    entering++;
    if(entering>2){
      entering=0;
    }
    enter="0";
  }
  if(entering==0){
    a=int(enter);
  }
  if(entering==1){
    b=int(enter);
  }
  if(entering==2){
    c=int(enter);
  }
  println(enter);
  background(255); 
  arrows();
  m=a;
  n=b;
  o=c;
  run();
}