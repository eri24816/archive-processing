int A;
int sum;
int size=60;
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
    //beginShape();
    for(int z=0;z<=size;z++){
      
      for(int y=0;y<=size;y++){
        if((x+y+z)%6==0&&x+y+z<=size){
          m=x;
          n=y;
          o=z;
          run();
          if((m!=0)&&(n!=0)&&(o!=0)&&!(m==o&&o==n)){
            println(x+","+y+","+z); 
          
          }
        }
      }
      
    }
    //endShape();
  }
  println("finish"); 
  delay(10000);
}


void mousePressed(){
  saveFrame("###");
}