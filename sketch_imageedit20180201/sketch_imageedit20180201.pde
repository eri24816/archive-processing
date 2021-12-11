PImage img;
float size=1;
int startx;
int starty;
int endx;
int endy;
float step=0;
int effect=6;
int n;
int editing=0;
String path ="D:\\馬賽克";
String[] filenames;
boolean enterpressed=false;
void setup(){
  size(960,720);
  filenames = listFileNames(path);
  n=filenames.length;
}
void draw(){
  if(step==0){
    img=loadImage(path+"\\"+filenames[editing]);
    size=width/(float)img.width;
    image(img,0,0,img.width*size,img.height*size);
    step=1;
  }
  if(step==1){
    if(mousePressed){
      startx=mouseX;
      starty=mouseY;
      step=2;
    }

  }
  if(step==2){
    if(mousePressed){
      endx=mouseX;
      endy=mouseY;
    }else{
      step=3;
    }
  }
  if(step==3){
    loadPixels();
    for(int x=startx;x<=endx;x++){
      for(int y=starty;y<=endy;y++){
        if(x<width&&y<height&&x>0&&y>0){
       // pixels[x+y*width]=img.pixels[(int)((x/effect)*effect/size+(y/effect)*effect*width/size)];
        pixels[x+y*width]=get((x/effect)*effect,(y/effect)*effect);
        }
      
      }
    }
    updatePixels();
    saveFrame((editing+1)+"已加馬賽克.jpg" );
    step=1;
    if(/*keyPressed&&key==ENTER*/enterpressed){

    }
    
    
  }
  println(enterpressed);
}
 
void keyPressed(){

  if(key>=48&&key<=58){
    
  }
}
void keyReleased(){
    println("key");
  if(key==ENTER){
    
    enterpressed=true;
     enterpressed=false;
      if(editing<n-1){
        editing++;
        step=0;
      }
    else{println("finish");delay(1000000);}
  }
}
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}