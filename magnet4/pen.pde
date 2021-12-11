class pen{
  v2 pos=new v2(0,0);
  v2 ppos=new v2(0,0);
  pen(v2 pos1){
    pos=pos1;
    ppos=pos1;
  };
  void move(v2 v){
    ppos=pos;
    pos.Add(v);
    line(ppos.x,ppos.y,pos.x,pos.y);
  }
  
  
  
  
  
  
}