PImage img=loadImage("ar.png");
for(int i=0;i<img.width;i++){
  for(int j=0;j<img.height;j++){
    color c=img.get(i,j);
    if((green(c)-0.5*red(c)-0.5*blue(c))>20)
    img.set(i,j,color(0,0,0,0));
  }
}
img.save("ar_.png");
