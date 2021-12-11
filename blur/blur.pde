PImage in;
float gray[][];
int h,w;
void setup(){ 
  size(1960,1080);
  in=loadImage("1.png");
  w=in.width;h=in.height;
  gray=new float [w][h];
  for(int x=0;x<w;x++){
    for(int y=0;y<h;y++){
      gray[x][y]=brightness(in.get(x,y));
    }
  }

  blur(gray);
  
  
  
  
  loadPixels();
  for(int x=0;x<gray.length;x++){
    for(int y=0;y<gray[0].length;y++){
      pixels[x+y*width]=color(int(gray[x][y]),int(gray[x][y]),int(gray[x][y]));
    }
  }
  updatePixels();
  println(0);
}

void draw(){
  
  
}
void blur(float [][]img){
  float[][] out=new float [w][h];
  for(int x=0;x<w;x++){
    for(int y=0;y<h;y++){
      float s=0;
      int str=int(sqrt(sq(x-w/2)+sq(y-h/2))/100.0);
      float div=0;
      for(int m=-str;m<=str;m++){
        for(int n=-str;n<=str;n++){
          if(x+m>=0&&x+m<w&&y+n>=0&&y+n<h){
            s+=img[x+m][y+n]*exp(-(m*m+n*n));
            div+=exp(-(m*m+n*n));
          }
        }
      }
      out[x][y]=s/div;
    }
  }
  for(int x=0;x<out.length;x++){
    for(int y=0;y<out[0].length;y++){
      img[x][y]=out[x][y];
    }
  }
}
void mid(float [][]img){
  float[][] out=new float [w][h];
  for(int x=0;x<w;x++){
    for(int y=0;y<h;y++){
      float s=0;
      int str=3;
      float div=0;
      for(int m=-str;m<=str;m++){
        for(int n=-str;n<=str;n++){
          if(x+m>=0&&x+m<w&&y+n>=0&&y+n<h){
            s+=img[x+m][y+n]*exp(-(m*m+n*n));
            div+=exp(-(m*m+n*n));
          }
        }
      }
      out[x][y]=s/div;
    }
  }
  for(int x=0;x<out.length;x++){
    for(int y=0;y<out[0].length;y++){
      img[x][y]=out[x][y];
    }
  }
}
