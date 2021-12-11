PImage img;
int px;
int py;
int sx;
int sy;
float big=0.25;
boolean salready;
boolean ding=true;
boolean b;


void setup(){
  img=loadImage("a123.JPG");

  
  size(1000,1000);
  image(img,0,0,img.width*big,img.height*big);
  fill(0,0,0,1);
  rect(0,0,img.width*big,img.height*big);
  stroke(255);
  
  //beginShape();
  px=mouseX;
  py=mouseY;
  salready=!true;
}
void draw(){
  strokeWeight(2);
  
  if(key=='a'){
    
    ding=!true;
    line(sx,sy,px,py);
  }
  else{
    if(mousePressed&&ding){
      if(salready==!true){
        salready=true;
        sx=mouseX;
        sy=mouseY;
      }
      line(mouseX,mouseY,px,py);
    }
  px=mouseX;
  py=mouseY;
  if(ding==!true){//finished circleing
  strokeWeight(1);
  stroke(50,50,0,200);
    for(int x=0;x<img.width*big;x++){
       b=!true;
      for(int y=0;y<img.height*big;y++){
        if(get(x,y)==color(255,255,255)){          
          b=!b;
        }
        if(b){
          point(x,y);
        }
      }
    }
          
        
          
  }
}  
}
  

  
  
  