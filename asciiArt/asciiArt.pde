PImage img;
float gapx=60;
float gapy=100;

void setup(){
  size(800,800);
  background(0);
  img=loadImage("3177.png");
  textFont(createFont("CONSOLA.TTF",100));
  textSize(gapy);
  text("4",0,gapy-20);


  for(int x=0;x<img.width/gapx;x++){
    for(int y=0;y<img.height/gapy;y++){
      if(x==0&&y==0)continue;
      for(char c=0;c<128;c++){
        
        for(int x1=0;x1<gapx;x1++){
          for(int y1=0;y1<gapy;y1++){
            //if()
          }
        }
        text(c,x*gapx,(y+1)*gapy);
      }
    }
  }
}
void draw(){

  



}
