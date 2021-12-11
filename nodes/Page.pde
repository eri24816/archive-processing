class Page{
  Node[] node=new Node[100];int nodes=0;
  Node root;
  Node selectedNode=null;
  float x,y,s=1;
  Page(){
    node[0]=new Node();
    root=node[0];
    selectedNode=node[0];
    nodes=1;
  }
  void display(){
    fill(10, 0,255,80);
    rect(width*0.5,height*0.5,width,height);
    translate(width/2,height/2);
    scale(s);
    translate(x,y);
    for(int i=0;i<nodes;i++){
      node[i].display();
    }
    if(state=="addingNode"){
      node[nodes-1].x=mouseX();
      node[nodes-1].y=mouseY();
      node[nodes-1].hue=(node[nodes-1].x*0.03+node[nodes-1].y*0.02+10000)%255;
    }
  }
  void addNode(){
    node[nodes]=new Node();
    node[nodes].parent=selectedNode;
    selectedNode.child[selectedNode.childs]=node[nodes];
    selectedNode.childs++;
    nodes++;
    state="addingNode";
  }
  void cancelNodeAdding(){
    nodes--;
    state="nodeSelected";
  }
  int selectNode(){
    float mx=mouseX(),my=mouseY();
    for(int i=0;i<nodes;i++){
      if(dist(mx,my,node[i].x,node[i].y)<node[i].size){
        selectedNode=node[i];
        state="nodeSelected";
        return i;
      }
    }
    selectedNode=null;
    state="displaying";
    return -1;
  }

  void moveNode(){
    selectedNode.x=mouseX();selectedNode.y=mouseY();
    selectedNode.hue=(selectedNode.x*0.03+selectedNode.y*0.02+10000)%255;
  }
  void deleteNode(){
    
  }
  float mouseX(){//mouseX after transformation
    return (mouseX-width/2)/s-x;
  }
  float mouseY(){
    return (mouseY-height/2)/s-y;
  }
  
  
}
