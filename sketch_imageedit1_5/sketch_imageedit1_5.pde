PImage img;
int px;
int py;
int sx;
int sy;
float big=0.25;
boolean salready;
boolean ding=true;
boolean b;
boolean bal;
int w[]=new int[1000000];


void setup(){
  img=loadImage("a123.JPG");

  
  size(1000,1000);
  image(img,0,0,img.width*big,img.height*big);
  fill(0,0,0,10);
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
  if(ding==!true){//circleing finished 
  strokeWeight(0.5);
  stroke(255,20,0,200);
  v1();  
  stroke(10,20,0,200);
  v2();
          
        
          
  }
}  
}
  
void v1(){
  for(int x=0;x<img.width*big;x++){
     b=!true;
     bal=!true;
    for(int y=0;y<img.height*big;y++){
      if(get(x,y)==color(255,255,255)){          
        if(!bal){b=!b;}
        bal=true;
      }
      if(get(x,y)!=color(255,255,255)){
        bal=!true;
    }
      if(b){
        //point(x,y);
        w[int(x*img.height*big +y)]=1;       
      }
      else{
        w[int(x*img.height*big +y)]=0;
      }
    }
  }
}
void v2(){
  for(int x=0;x<img.height*big;x++){
     b=!true;
     bal=!true;
    for(int y=int(img.width*big-1);y>=0;y++){
      if(get(x,y)==color(255,255,255)){          
        if(!bal){b=!b;}
        bal=true;
      }
      else{
        bal=!true;
    }
      if(w[int(y*img.height*big+x)]==1&&b){
        stroke(10,255,0,200);
        point(x,y);
                
      }
      if(b){
        stroke(0,0,255,200);
        point(x,y);
        
      }
      
    }
  }
  text('1',10,10);
}
  
  
  