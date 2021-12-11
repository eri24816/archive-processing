class Node{
  int templateN=0,drawingFunc=1;
  float time=0;
  float x=0,y=0,size=50;
  Node parent;
  Node[] child=new Node[30];
  float hue=30;
  float gap=200;
  String text="OWO";
  Node(){
    for(int i=0;i<child.length;i++){
      child[i]=null;
    }
  }
  void applyTemplate(Template t){
    this.size=t.size;
    this.hue=t.hue;
    this.drawingFunc=t.drawingFunc;
  }
  void display(){
    time+=0.01;
    for(int i=0;i<child.length;i++){
      if(child[i]!=null)
        child[i].display();
    }
    switch(drawingFunc){
      case 1:
        draw1();
        break;
      case 2:
        draw2();
        break;
      case 3:
        draw3();
        break;
    }
  }
  int emptyChildIndex(){
    for(int i=0;i<child.length;i++){
      if(child[i]==null)
        return i;
    }
    return -1;
  }
  Node trySelectNode(float mx,float my){
    if(dist(mx,my,x,y)<size){
      return this;
    }
    else{
      for(int i=0;i<child.length;i++){
        if(child[i]==null)
          continue;
        if(child[i].trySelectNode(mx,my)!=null){
          return child[i].trySelectNode(mx,my);
        }
      }
    }
    return null;
  }
  void draw1(){
    if(parent!=null){
      float d=dist(x,y,parent.x,parent.y);
      for(int i=0;i<d/gap*7.0;i++){
        
        float p=(((i/7.0+time)*gap/d)%1);
        stroke(abs(hue-parent.hue)<128?parent.hue*(1-p)+hue*p:hue>parent.hue?((parent.hue+255)*(1-p)+hue*p)%255:(parent.hue*(1-p)+(hue+255)*p)%255,255,255,50);
        fill(abs(hue-parent.hue)<128?parent.hue*(1-p)+hue*p:hue>parent.hue?((parent.hue+255)*(1-p)+hue*p)%255:(parent.hue*(1-p)+(hue+255)*p)%255,255,255,30);
        pushMatrix();
        translate(x*p+parent.x*(1-p),y*p+parent.y*(1-p));
        rotate(p*d*0.03-time*2);
        rect(0,0,size*0.4*(p<0.2?p*5:p<0.8?1:(1-p)*5),size*0.3*(p<0.2?p*5:p<0.8?1:(1-p)*5));
        popMatrix();
      }
    }
    noStroke();
    fill(hue,255,255,40-140*abs((time)%1-0.5));
    ellipse(x,y,size*(1+0.8*(time%1)),size*(1+0.8*(time%1)));
    
    time+=0.5;
    noStroke();
    fill(hue,255,255,40-140*abs((time)%1-0.5));
    ellipse(x,y,size*(1+0.8*(time%1)),size*(1+0.8*(time%1)));
    fill(hue,255,255,10);
    ellipse(x,y,size*(3+0.2*sin(time)),size*(3+0.2*(sin(time)))); 
    time-=0.5;
    stroke(hue,255,255,30);
    noFill();
    pushMatrix();
    translate(x,y);
    rotate(time);
    rect(0,0,size*1.3+sin(time)*10,size*1.3+sin(time)*10);
    popMatrix();

    fill(hue,255,255);
    textSize(size*0.3);
    textAlign(CENTER, CENTER);
    text(text,x,y);
  }
  void draw2(){
    if(parent!=null){
      float d=dist(x,y,parent.x,parent.y);
      for(int i=0;i<d/gap*7.0;i++){
        
        float p=(((i/7.0+time)*gap/d)%1);
        stroke(abs(hue-parent.hue)<128?parent.hue*(1-p)+hue*p:hue>parent.hue?((parent.hue+255)*(1-p)+hue*p)%255:(parent.hue*(1-p)+(hue+255)*p)%255,255,255,50);
        fill(abs(hue-parent.hue)<128?parent.hue*(1-p)+hue*p:hue>parent.hue?((parent.hue+255)*(1-p)+hue*p)%255:(parent.hue*(1-p)+(hue+255)*p)%255,255,255,30);
        pushMatrix();
        translate(x*p+parent.x*(1-p),y*p+parent.y*(1-p));
        rotate(p*d*0.03-time*2);
        rect(0,0,size*0.4*(p<0.2?p*5:p<0.8?1:(1-p)*5),size*0.3*(p<0.2?p*5:p<0.8?1:(1-p)*5));
        popMatrix();
      }
    }
    noStroke();
    fill(hue,255,255,50-150*abs((time)%1-0.5));
    ellipse(x,y,size*(1+0.8*(time%1)),size*(1+0.8*(time%1)));
    
    time+=0.5;
    noStroke();
    fill(hue,255,255,50-150*abs((time)%1-0.5));
    ellipse(x,y,size*(1+0.8*(time%1)),size*(1+0.8*(time%1))); 
    time-=0.5;
    stroke(hue,255,255);
    noFill();
    pushMatrix();
    translate(x,y);
    rotate(time);
    rect(0,0,size*1.3+sin(time)*10,size*1.3+sin(time)*10);
    popMatrix();
    pushMatrix();
    translate(x,y);
    rotate(-time*0.811);
    rect(0,0,size*1.3,size*1.3);
    popMatrix();
    fill(hue,255,255);
    textSize(size*0.3);
    textAlign(CENTER, CENTER);
    text(text,x,y);
  }
  void draw3(){
    if(parent!=null){
      float d=dist(x,y,parent.x,parent.y);
      for(int i=0;i<d/gap*7.0;i++){
        
        float p=(((i/7.0+time)*gap/d)%1);
        stroke(abs(hue-parent.hue)<128?parent.hue*(1-p)+hue*p:hue>parent.hue?((parent.hue+255)*(1-p)+hue*p)%255:(parent.hue*(1-p)+(hue+255)*p)%255,255,255,50);
        fill(abs(hue-parent.hue)<128?parent.hue*(1-p)+hue*p:hue>parent.hue?((parent.hue+255)*(1-p)+hue*p)%255:(parent.hue*(1-p)+(hue+255)*p)%255,255,255,30);
        pushMatrix();
        translate(x*p+parent.x*(1-p),y*p+parent.y*(1-p));
        rotate(p*d*0.03-time*2);
        rect(0,0,size*0.4*(p<0.2?p*5:p<0.8?1:(1-p)*5),size*0.3*(p<0.2?p*5:p<0.8?1:(1-p)*5));
        popMatrix();
      }
    }
    noStroke();
    fill(hue,255,255,50-150*abs((time)%1-0.5));
    ellipse(x,y,size*(1+0.8*(time%1)),size*(1+0.8*(time%1)));
    
    time+=0.5;
    noStroke();
    fill(hue,255,255,50-150*abs((time)%1-0.5));
    ellipse(x,y,size*(1+0.8*(time%1)),size*(1+0.8*(time%1))); 
    time-=0.5;
    fill(hue,255,255);
    textSize(size*0.3);
    textAlign(CENTER, CENTER);
    text(text,x,y);
  }
  
  
  
}
