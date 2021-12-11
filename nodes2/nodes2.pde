Page page[]=new Page[100];
Page selectedPage=null;
String state="displaying";
Template template[]=new Template[4];
void setup(){
  template[0]=new Template(70,200,1);
  template[1]=new Template(50,150,2);
  template[2]=new Template(40,0,3);
  template[3]=new Template(30,30,3);
  
  size(1920,1080);
  
  colorMode(HSB);
  rectMode(CENTER);
  background(255);
  page[0]=new Page();

  selectedPage=page[0];
  

}
void draw(){
  selectedPage.display();
  println(state);
}
void mouseWheel(MouseEvent event) {
  selectedPage.s/=1+event.getCount()*0.1;
}
void mouseDragged(){
  if(mouseButton==CENTER){
    selectedPage.x+=(mouseX-pmouseX)/selectedPage.s;selectedPage.y+=(mouseY-pmouseY)/selectedPage.s;
  }
  else if(mouseButton==LEFT){
    if(state=="nodeSelected")
      selectedPage.moveNode();
  }
  else if(mouseButton==RIGHT){
    if(state=="nodeSelected")
      selectedPage.addNode();
  }
}
void mousePressed(){
  if(mouseButton==CENTER){}

  else if(mouseButton==LEFT){
    if(state=="displaying"){selectedPage.selectNode(); }
    else if(state=="nodeSelected"||state=="typing"){selectedPage.selectNode(); }
  }
  else if(mouseButton==RIGHT){
    if(state=="displaying"){selectedPage.selectNode(); }
    else if(state=="nodeSelected"||state=="typing"){selectedPage.selectNode(); }
  }
}
void mouseReleased(){
  if(mouseButton==RIGHT){
    if(state=="addingNode"){
      state="nodeSelected";
    }
  }
}
void keyPressed(){
  if(key==ESC){
    key=0;
    if(state=="addingNode"){
      selectedPage.cancelNodeAdding();
    }
    if(state=="typing"){
      state="displaying";
    }
  }
  if(state=="nodeSelected"){
    if(key==DELETE){
      state="deletingCheck";
    }
    if(key=='T'||key=='t'||key==ENTER){
      state="typing";
    }
  }
  else if(state=="deletingCheck"){
    if(key=='Y'||key=='y'||key==ENTER){
      selectedPage.deleteNode();
      state="displaying";
    }
    else{
      state="displaying";
    }
  }
  else if(state=="typing"){
    selectedPage.type(key);
  }
}
