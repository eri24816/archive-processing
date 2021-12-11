PImage img;
int px;
int py;
int sx;
int sy;
float big=0.25;
float wtimes;
boolean salready;
boolean ding=true;
boolean b;
boolean bal;
int minx=500;
int maxx=-500;
boolean fal=!true;
int ch[]=new int[1000000];
float re;
float gr;
float bl;
float wspeed=1.01;
float step=0;





void setup(){
  
  img=loadImage("a12.jpg");

  
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
  
  strokeWeight(4);
  
  if(key=='a'&&!fal){
    
    ding=!true;
    line(sx,sy,px,py);
  }
  if(mousePressed&&ding){
    if(salready==!true){
      salready=true;
      sx=mouseX;
      sy=mouseY;
     
    }
    
    line(mouseX,mouseY,px,py);
    maxx=max(maxx,mouseX);
    minx=min(minx,mouseX);  
  }
  px=mouseX;
  py=mouseY;
  if(!ding&&!fal){//circleing finished 
  v1();
  image(img,0,0,img.width*big,img.height*big);
  wtimes=0;
      
  }
  
  if(fal&&keyPressed&&key=='w'){
    whiting();
  }
}
  
void v1(){


  
  for(int x=0;x<img.width*big;x++){
     b=!true;
     bal=!true;
    for(int y=0;y<img.height*big;y++){
      if(x>minx+2&&x<maxx-2){
        if(get(x,y)==color(255,255,255)){          
          if(!bal){b=!b;}
          bal=true;
          }
          if(get(x,y)!=color(255,255,255)){
            bal=!true;
          }
          if(b){
            ch[x+y*width]=1;
 
            
            
            
            
        }
      }     
    }
  }
  fal=true;
  
}
void keyPressed(){
  /*if(key=='q'){
    
    strokeWeight(0.5);
    v1();
  }*/
}
void whiting(){
  
  
  loadPixels();
  
  for(int x=0;x<img.width*big;x++){
    for(int y=0;y<img.height*big;y++){ 
      if(ch[x+y*width]==1){
        re=red(get(x,y));
        gr=green(get(x,y));
        bl=blue(get(x,y));
        //pixels[x+y*width] = color((255-re)*wspeed+re,(255-gr)*wspeed+gr,(255-bl)*wspeed+bl);   
        //pixels[x+y*width] = color((255-(re+gr+bl)/3)*wspeed+re,(255-(re+gr+bl)/3)*wspeed+gr,(255-(re+gr+bl)/3)*wspeed+bl);   
        //pixels[x+y*width] = color(wspeed+re,wspeed+gr,wspeed+bl); 
        pixels[x+y*width] = color(wspeed*re,wspeed*gr,wspeed*bl); 
        wtimes++;
      }
    }
  }
  updatePixels();  
}
  

//