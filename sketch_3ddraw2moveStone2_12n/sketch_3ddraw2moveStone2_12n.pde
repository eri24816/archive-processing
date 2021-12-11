int A;
int size=600;
int num[]=new int[size+1];
boolean stop=false;
int   outputs;
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
}
void draw(){
  for(int i=0;i<num.length;i++){
    num[i]=0;
  }
  for(int x=0;x<=size;x++){
    println(x);
    //beginShape();
    for(int z=0;z<=size;z++){
      
      for(int y=0;y<=size;y++){
        if((x+y+z)%12==0&&x+y+z<=size){
          m=x;
          n=y;
          o=z;
          run();
          num[x+y+z]+=A;
        }
      }
      
    }
    //endShape();
  }
  for(int i=0;i<num.length;i+=12){
    println("["+i+"]"+num[i]); 
  }
}


void mousePressed(){
  saveFrame("###");
}