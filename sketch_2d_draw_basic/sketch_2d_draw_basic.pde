float c_Re=0;
float c_Im=0;
float scale=0.005;


void setup(){
  size(500,500);
  background(255);
  colorMode(HSB);
  
  loadPixels();
  
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
        pixels[x+y*width]=f((x-width/2)*scale,-(y-height/2)*scale);
    }
  }
  
  updatePixels();
  
}

color f(float Re,float Im){
  return color(255.0*atan2(Re,Im)/2.0/PI,dist(0,0,Re,Im)*100,255);

}