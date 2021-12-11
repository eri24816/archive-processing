/*int p=int(random(0,2));
int k=int(random(1,10));
int m=int(random(1,10));*/


int t=0;
float maxt;
int a;
int b;
void setup(){
  size(1000,1000);
  textSize(30);
}
void draw(){
  background(255);
  
  for(int x=0 ;x<width;x+=50){
    stroke(255,255,100,200);
    line(x,0,x,height);
  }
  for(int y=0 ;y<height;y+=50){
    stroke(255,255,100,200);
    line(0,y,width,y);
  }
  loadPixels();
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      a=x;
      b=y;
      t=0;
      maxt=(a+b+1);
      while(!(a==b)){
        if(a>b){
          a-=b;
          b*=2;
          t++;
          //println(a+","+b);
        }
        if(a<b){
          b-=a;
          a*=2;
          t++;
          //println(a+","+b);
        }
        if(t>maxt){
          break;
        }
      }
      if(!(t>maxt)){pixels[x+y*width]=0;}
    }
  }
  updatePixels();
  saveFrame("123.b");
  println('a');
}

void keyPressed(){
  if(key=='q'){
    saveFrame("22");
  }
}