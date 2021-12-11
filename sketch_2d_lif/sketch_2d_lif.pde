int p[]=new int[40000];
int n[]=new int[40000];
int ne;
int timer=0;
void setup(){
  for(int i=0;i<40000;i++){
    //n[i]=int(random(0.5,2));
    n[i]=0;
  }
  n[20100]=1;
  //n[20101]=1;
  //n[20300]=1;
  //n[20301]=1;
  size(200,200);
  background(0);
}
void draw(){
  n[20100]=1;
  if(mousePressed){
    n[mouseX+mouseY*200]=1;
  }
  loadPixels();
  for(int i=0;i<40000;i++){
      pixels[i]=color(p[i]*255,p[i]*255,p[i]*255);
    }
    updatePixels();
  timer++;
  if(timer%10==0){
    
    for(int i=0;i<40000;i++){
      p[i]=n[i];
    }
    for(int i=1;i<40000;i++){
      ne=(p[a(i)]+p[a(i+1)]+p[a(i-1)]+p[a(i+1+width)]+p[a(i-1+width)]+p[a(i+1-width)]+p[a(i-1-width)]+p[a(i+width)]+p[a(i-width)]);
      if(ne==1&&p[a(i)]==0){
        n[i]=1;
      }else{
        n[i]=0;
      }
    } 
  }
  
}
int a(int b){
  return((40000+b)%40000);
  
}
void mousePressed(){
  n[mouseX+mouseY*200]=1;
}