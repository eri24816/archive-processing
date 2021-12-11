boolean mp=false;
float ol;
float l;
float[]px=new float[100];
float[]py=new float[100];
int pn=0;
float[]c=new float[100];
float[]b=new float[100];
int pname;

void setup(){
  size(500,500);
}
void draw(){
  frameRate(10);
  
  
  
  if (mousePressed){
  px[pn]=mouseX;
  py[pn]=mouseY;
  c[pn]=pn*10+50;
  b[pn]=pn*10+50;
  pn++;
  println(pn); 
 
  }

  background(255);               
  for(float x=0;x<width;x++){
    for(float y=0;y<height;y++){
      ol=10000;
      for(int a=0;a<pn;a++){        
        l=dist(x,y,px[a],py[a])/b[a];
        if (l<ol){
          ol=l;pname=a;
       }        
      }
      stroke(c[pname]);
      point(x,y);
    }
  }
  for(int x=0;x<pn;x++){
    ellipse(px[x],py[x],b[x],b[x]);
  }
}