Page page[]=new Page[100];
Page selectedPage=null;
String state="displaying";
void setup(){
  size(1920,1080);
  
  colorMode(HSB);
  rectMode(CENTER);
  background(255);
  page[0]=new Page();
  page[0].addNode();
  selectedPage=page[0];
}
void draw(){
  selectedPage.display();
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
    else if(state=="nodeSelected"){selectedPage.selectNode(); }
  }
  else if(mouseButton==RIGHT){
    if(state=="displaying"){selectedPage.selectNode(); }
    else if(state=="nodeSelected"){selectedPage.selectNode(); }
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
  }
  if(key==DELETE){
    state="deletingCheck";
  }
  if(state=="deletingCheck"){
    if(key=='Y'||key=='y'){
      selectedPage.deleteNode();
    }
  }
}
