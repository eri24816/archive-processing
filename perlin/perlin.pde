

void Perlin(float[][] a,float d,float k){
  float v[][]=new float[floor(a.length/d)+1][floor(a[0].length/d)+1];
  for(int x=0;x<v.length;x++){
    for(int y=0;y<v[0].length;y++){
      v[x][y]=random(-1,1); 
    }
  }
  float g[][][]=new float[floor(a.length/d)+1][floor(a[0].length/d)+1][2];
  for(int x=0;x<g.length;x++){
    for(int y=0;y<g[0].length;y++){
      float r=random(0,TWO_PI); 
      g[x][y][0]=cos(r);
      g[x][y][1]=sin(r);
    }
  }
  for(int x=0;x<a.length;x++){
    for(int y=0;y<a[0].length;y++){
       int x_=floor(x/d),y_=floor(y/d);
       float xf=((float)x-x_*d)/d,yf=((float)y-y_*d)/d;
       float xf_=3*xf*xf-2*xf*xf*xf,
       yf_=3*yf*yf-2*yf*yf*yf;
       a[x][y]=k*(
       (
       (g[x_][y_][0]*xf+g[x_][y_][1]*yf)
       *(1-xf_)+
       (g[x_+1][y_][0]*(xf-1)+g[x_+1][y_][1]*yf)
       *(xf_)
       )*(1-yf_)+
       (
       (g[x_][y_+1][0]*xf+g[x_][y_+1][1]*(yf-1))
       *(1-xf_)+
       (g[x_+1][y_+1][0]*(xf-1)+g[x_+1][y_+1][1]*(yf-1))
       *(xf_)
       )*yf_
       );
       
    }
  }
}
void Squares(float[][] a,float d,float k){
  float v[][]=new float[floor(a.length/d)+1][floor(a[0].length/d)+1];
  for(int x=0;x<v.length;x++){
    for(int y=0;y<v[0].length;y++){
      v[x][y]=random(-1,1); 
    }
  }
  float g[][][]=new float[floor(a.length/d)+1][floor(a[0].length/d)+1][2];
  for(int x=0;x<g.length;x++){
    for(int y=0;y<g[0].length;y++){
      float r=random(0,TWO_PI); 
      g[x][y][0]=cos(r);
      g[x][y][1]=sin(r);
    }
  }
  for(int x=0;x<a.length;x++){
    for(int y=0;y<a[0].length;y++){
       int x_=floor(x/d),y_=floor(y/d);
       float xf=((float)x-x_*d)/d,yf=((float)y-y_*d)/d;
       float xf_=3*xf*xf-2*xf*xf*xf,
       yf_=3*yf*yf-2*yf*yf*yf;
       a[x][y]=k*(
       (
       (g[x_][y_][0]*xf+g[x_][y_][1]*yf)

       ));
       
    }
  }
}
void addMatrix(float[][]a,float[][]b){
  for(int x=0;x<b.length;x++){
    for(int y=0;y<b[0].length;y++){
      a[x][y]+=b[x][y];
    }
  }
  
}
void setup(){
 

  size(100,100);
  w=width;h=height;
  
  background(0);
  colorMode(HSB);
  
}
int w,h;
float [][]map;
float[][]m;
void draw(){
  map=new float[w][h];m=new float[w][h];
  for(int i=0;i<8;i++){
    Perlin(m,w/pow(2,i),1.0/pow(2,i));
    addMatrix(map,m);
  }
  loadPixels();
  float min=100,max=-100;
  for(int x=0;x<map.length;x++){
    for(int y=0;y<map[0].length;y++){
      if(map[x][y]<min)min=map[x][y];
      if(map[x][y]>max)max=map[x][y];
    }
  }
  for(int x=0;x<map.length;x++){
    for(int y=0;y<map[0].length;y++){
      pixels[x+y*width]=color(0,0,int(map(map[x][y],min,max,0,255)));
    }
  }
  updatePixels();
  saveFrame("perlin_###.png");
}

void keyPressed(){
  if(key=='s'||key=='S'){saveFrame("perlin_###");}
  
  
}
