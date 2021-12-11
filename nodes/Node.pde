class Node{
  float time=0;
  float x=0,y=0,size=50;
  Node parent=null;
  int childs=0;
  Node[] child=new Node[30];
  float hue=30;
  float gap=200;
  String text="";
  
  void display(){
    time+=0.01;
    if(parent!=null){
      
      float d=dist(x,y,parent.x,parent.y);
      for(int i=0;i<d/gap*7.0;i++){
        
        float p=(((i/7.0+time)*gap/d)%1);
        stroke(abs(hue-parent.hue)<128?parent.hue*(1-p)+hue*p:hue>parent.hue?((parent.hue+255)*(1-p)+hue*p)%255:(parent.hue*(1-p)+(hue+255)*p)%255,255,255,50);
        fill(abs(hue-parent.hue)<128?parent.hue*(1-p)+hue*p:hue>parent.hue?((parent.hue+255)*(1-p)+hue*p)%255:(parent.hue*(1-p)+(hue+255)*p)%255,255,255,30);
        pushMatrix();
        translate(x*p+parent.x*(1-p),y*p+parent.y*(1-p));
        rotate(p*d*0.03-time*2);
        rect(0,0,size*0.8*(p<0.2?p*5:p<0.8?1:(1-p)*5),size*0.9*(p<0.2?p*5:p<0.8?1:(1-p)*5));
        popMatrix();
      }
    }
    noStroke();
    fill(hue,255,255,80-180*abs((time)%1-0.5));
    ellipse(x,y,size*(1+0.8*(time%1)),size*(1+0.8*(time%1)));
    
    time+=0.5;
    noStroke();
    fill(hue,255,255,80-180*abs((time)%1-0.5));
    ellipse(x,y,size*(1+0.8*(time%1)),size*(1+0.8*(time%1))); 
    time-=0.5;
    fill(hue,255,255);
    textSize(size*0.3);
    textAlign(CENTER, CENTER);
    text(text,x,y);
    
  }
  
  
  
  
  
}
