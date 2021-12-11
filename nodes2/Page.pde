class Page{
  Node root;
  Node selectedNode=null;
  Node newNode=null;
  float x,y,s=1;
  Page(){
    root=new Node();
    root.applyTemplate(template[0]);
    selectedNode=null;
  }
  void display(){
    fill(10, 0,255,80);
    rect(width*0.5,height*0.5,width,height);
    translate(width/2,height/2);
    scale(s);
    translate(x,y);
    root.display();
    if(state=="addingNode"){
      newNode.x=mouseX();
      newNode.y=mouseY();
      
    }
  }
  void addNode(){
    newNode=selectedNode.child[selectedNode.emptyChildIndex()]=new Node();//My first time to write a=b=c.
    newNode.parent=selectedNode;
    newNode.x=mouseX();
    newNode.y=mouseY();
    newNode.templateN=min(newNode.parent.templateN+1,template.length-1);
    newNode.applyTemplate(template[min(newNode.parent.templateN+1,template.length-1)]);
    selectedNode=newNode;
    
    state="addingNode";
  }
  void cancelNodeAdding(){
    deleteNode();
    state="nodeSelected";
  }
  void selectNode(){
    float mx=mouseX(),my=mouseY();
    selectedNode=root.trySelectNode(mx,my);
    state=selectedNode==null?"displaying":"nodeSelected";
    
  }

  void moveNode(){
    selectedNode.x=mouseX();selectedNode.y=mouseY();
    //selectedNode.hue=(selectedNode.x*0.03+selectedNode.y*0.02+10000)%255;
  }
  void deleteNode(){
    if(selectedNode==root){println("Error: can't delete root node");return;}
    for(int i=0;i<selectedNode.parent.child.length;i++){
      if(selectedNode.parent.child[i]==selectedNode){
        selectedNode.parent.child[i]=null;
        return;
      }
    }
    
  }
  void type(char c){
    if(c==BACKSPACE){
      if(selectedNode.text.length()>0)
        selectedNode.text=(String)selectedNode.text.subSequence(0,selectedNode.text.length()-1);
      
    }
    else{
      selectedNode.text+=c;
    }
  }
  float mouseX(){//mouseX after transformation
    return (mouseX-width/2)/s-x;
  }
  float mouseY(){
    return (mouseY-height/2)/s-y;
  }
  
  
}
