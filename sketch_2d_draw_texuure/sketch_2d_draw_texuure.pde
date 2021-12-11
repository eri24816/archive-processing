float c_Re=0;
float c_Im=0;
float scale=0.005;
color c[];

void setup(){
  size(500,500);
  background(255);
  colorMode(HSB);
  c= new color[width*height];
  loadPixels();
  /*
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
        pixels[x+y*width]=f((x-width/2)*scale,-(y-height/2)*scale);
    }
  }
  */
  for(int i=1;i<200;i++){
    p(random(0,width),random(0,height),160,i);
  }
  for(int i=1;i<200;i++){
    p(random(0,width),random(0,height),80,i+200);
  }
  for(int i=1;i<400;i++){
    p(random(0,width),random(0,height),40,i+200);
  }
  /*
  for(int i=1;i<800;i++){
    p(random(0,width),random(0,height),5,i+1000);
  }
  for(int i=1;i<1600;i++){
    p(random(0,width),random(0,height),5,i+50);
  }
  */
  updatePixels();
  
}
void draw(){}
/*color f(float Re,float Im){
  //  xreturn color(255.0*atan2(Re,Im)/2.0/PI,dist(0,0,Re,Im)*100,255);

}*/

void p(float px,float py,float r,int t){
  c=pixels;
  for(int x=(int)-r;x<r;x++){
    for(int y=(int)-sqrt(r*r-x*x);y<sqrt(r*r-x*x);y++){
      int n=((int)px+x+((int)py+y)*width+width*height)%(width*height);
      float alpha=(1-pow(dist(0,0,x,y)/r,0.05))/6/t;
      pixels[n]=color(brightness(pixels[n])*(1-alpha)+0*(alpha));
      
    }
  
  }

}
void mousePressed(){
  saveFrame(random(0,100)+"");
  
  
  
}