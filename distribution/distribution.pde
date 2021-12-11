float c[]=new float [1900];

void setup(){
  size(1900,1000);
  background(0);
  stroke(255);
  noFill();
  
  
  
  
}



void draw(){
  fill(0,0,0,30);
  rect(-1,-1,width,height);
  noFill();
  for(int i=0;i<100000;i++){
    c[max(min(int(1900.0*(
    
    1.0/(random(0.00001,100))
    
    )),1899),0)]++;
  
  }
  translate(0,height);
  beginShape();
  for(int i=0;i<c.length;i++){
    vertex(i,c[i]*-(height-mouseY)/frameCount*0.01);
  }
  endShape();
  
  
}
