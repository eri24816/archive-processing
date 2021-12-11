PImage i;
color c;
void setup(){
  i=loadImage("b.png");
  size(1000,1000);
  noLoop();
}
void draw(){
  for(int x=0;x<i.width;x++){
    for(int y=0;y<i.width;y++){
      if(brightness(i.get(x,y))>10&&brightness(i.get(x,y))<16){
        i.set(x,y,color(0,0,0,0));
      }
      else{
        i.set(x,y,color(red(i.get(x,y))*1.2,green(i.get(x,y))*1.2,blue(i.get(x,y))*1.2));
      }
      
    }
  }
  image(i,0,0);
}
void mousePressed(){
  c=i.get(mouseX,mouseY);
  println(red(c),green(c),blue(c));
  i.save("out.png");
}