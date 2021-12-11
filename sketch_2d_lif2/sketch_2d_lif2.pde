int p[]=new int[40000];
int n[]=new int[40000];
int ne;
void setup(){
  for(int i=0;i<40000;i++){
    n[i]=int(random(0,1.2));
  }
  n[20100]=1;
  n[10180]=1;
  size(200,200);
  background(0);
}
void draw(){
  
  loadPixels();
  for(int i=0;i<40000;i++){
    p[i]=n[i];
  }
  for(int i=0;i<40000;i++){
    pixels[i]=color(p[i]*255,p[i]*255,p[i]*255);
  }
  updatePixels();
  for(int i=1;i<40000;i++){
    ne=(p[a(i)]+p[a(i+1)]+p[a(i-1)]+p[a(i+1+width)]+p[a(i-1+width)]+p[a(i+1-width)]+p[a(i-1-width)]+p[a(i+width)]+p[a(i-width)]);
    if(p[i]==1){
      if(ne<2||ne>3){
        n[i]=1;
      }else{
        n[i]=0;
      }
    }else{
      if(ne<2||ne>3){
        n[i]=0;
      }else{
        n[i]=1;
      }
    }
  } 
  delay(50);
}
int a(int b){
  return((40000+b)%40000);
}