boolean stop=false;
int   outputs;
int   t=0;
float maxt;
int   a=7;
int   b=3;
int   c=2;
int   m=0;
int   n=0;
int   o=0;
int entering=0;
boolean f;
String enter="0";
PImage yes;
PImage no,steps;
void setup(){
  size(500,900);
  background(255); 
  output2(); 
  yes=loadImage("o.jpg");
  no=loadImage("x.jpg");
  steps=loadImage("t.jpg");
  run();
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
  output2();

  m=a;
  n=b;
  o=c;
  run();
}
void keyPressed(){
  if(key>=48&&key<=58&&(int(enter)<1000)){//if the pressed key is a number and max is 4  O   O    OOOOO  O    O  O
  enter=enter+key;//                                                                    OO OOOOO    OOO   O  O    O
  }               //                                                                     O  O O    O        O      O
  if(key==ENTER){ //                                                                     O OOOOO  O       O  O     
    entering++;   //                                                                                    O     O
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
  output2();
  m=a;
  n=b;
  o=c;
  run();
}