import processing.sound.*;
int t=0;
float delay=5;
int r=-100;
instrument in[];
Button b_part[];
Button b_start,b_pause,b_stop,b_a,b_d,b_save,b_load,b_drum;
boolean playing;
int selected=100;
float px=10,py=-700;
int timeFromPlay=0;
String filename="b";
slide echod,echov;
drum d;
void setup() {
  colorMode(HSB);
  size(1900,1100);
  textSize(20);
  textAlign(CENTER);
  
  in=new instrument[4];
  d=new drum(this,512);
  b_part=new Button[in.length];

  int m[][]=new int[in.length][512];
  for(int i=0;i<m.length;i++){
    for(int j=0;j<m[i].length;j++){
      m[i][j]=r;
    }
  }

  for(int i=0;i<in.length;i++){
    in[i]=new instrument(this,m[i]);
    b_part[i]=new Button(width-50,i*50,50,50);
    b_part[i].setText("part"+(i+1));
  }
  selected=100;
  for(int k=0;k<in.length;k++){
    b_part[k].setColor(k==selected? 255:230);
  }
  
  b_drum=new Button(1800,10,50,50);
  b_start=new Button(10,930,50,50);
  b_start.setText("►");
  b_pause=new Button(70,930,50,50);
  b_pause.setText("❚❚");
  b_stop=new Button(130,930,50,50);
  b_stop.setText("⬛");
  b_a=new Button(190,930,50,50);
  b_a.setText("+");
  b_d=new Button(250,930,50,50);
  b_d.setText("-");
  b_load=new Button(10,870,50,50);
  b_load.setText("load");
  b_save=new Button(70,870,50,50);
  b_save.setText("save");
  
  echod=new slide(1400,10,300,1,20);
  echov=new slide(1400,60,300,0,1);
  //load(filename);
}
void draw(){
  background(200); //<>//
  for(int i=0;i< in.length;i++){
    in[i].update();
  }
  for(int i=0;i<in.length;i++){
    b_part[i].display();
    if(b_part[i].press()){
      selected=i;
      for(int k=0;k<in.length;k++){
        b_part[k].setColor(k==selected? 255:230);
      }
    }
  }
  if(selected<100){
    GUI_toneSetting(410,620,600,390);
    GUI_envelopeSetting(1020,620,600,390);
    GUI_notes(10,10,1300,600,px,py,30,30);
  }else{
    GUI_drum(10,10,1300,600,px,py,30,30);
  }
  if(b_load.press()){
    load(filename);
  }
  if(b_save.press()){
    save(filename);
  }
  
  //================================
  if(playing){
    timeFromPlay++;
    if(timeFromPlay%delay==0){
      for(int i=0;i< in.length;i++){
        in[i].playNote();
      }
      d.playNote();
      t=(t+1)%in[0].m.length;
    }
  }
  b_drum.display();
  b_start.display();
  b_pause.display();
  b_stop.display();
  b_a.display();
  b_d.display();
  b_save.display();
  b_load.display();
  if(selected<100){
    echod.value=in[selected].echodelay;
    echov.value=in[selected].echovol;
  }
  echod.display();
  echov.display();
  echod.update();
  echov.update();
  if(selected<100){
    in[selected].echodelay=(int)echod.value;
    in[selected].echovol=echov.value;
  }
  text(1.0/delay,10,800);
  
  if(b_drum.press()){
    selected=100;
  }
  if(b_start.press()){
    playing=true;
  }
  if(b_pause.press()){
    playing=false;
  }
  if(b_stop.press()){
    playing=false;
    timeFromPlay=0;
    t=0;
  }
  if(b_a.press()){
    if(delay>0.5){
      delay-=0.5;
    }
  }
  if(b_d.press()){
    delay+=0.5;
  }
}
void load(String name){
  //setup();

  JSONArray jin= loadJSONArray("data/"+name+".json");
  int m[][]=new int[jin.size()][512];
  for(int i=0;i<m.length;i++){
    for(int j=0;j<m[i].length;j++){
      m[i][j]=r;
    }
  }
  for(int i=0;i<jin.size();i++){
    JSONObject o=jin.getJSONObject(i);
    JSONArray a=o.getJSONArray("fourier series");
    float value[]=new float[a.size()];
    for(int j=0;j<a.size();j++){
      value[j]=a.getFloat(j);
    }
    
    in[i].tone=value;
    
    a=o.getJSONArray("envelope");
    float value2[]=new float[a.size()];
    for(int j=0;j<a.size();j++){
      value2[j]=a.getFloat(j);
      println(value2[j]);
    }
    in[i].envelope=value2;
    
    a=o.getJSONArray("notes");
    for(int j=0;j<a.size();j++){
      in[i].setM(j,(int)a.getFloat(j));
    }
  }
  selected=0;
  for(int k=0;k<in.length;k++){
    b_part[k].setColor(0==k? 255:230);
  }
  
  println("Loaded.");
}

void save(String name){
  JSONArray jin=new JSONArray();
  for(int i=0;i<in.length;i++){
    JSONObject newin= new JSONObject();
    JSONArray fo=new JSONArray();
    for(int j=0;j<in[i].tone.length;j++){
      fo.setFloat(j,in[i].tone[j]);
    }
    JSONArray en=new JSONArray();
    for(int j=0;j<in[i].envelope.length;j++){
      en.setFloat(j,in[i].envelope[j]);
    }
    JSONArray m=new JSONArray();
    for(int j=0;j<in[i].rm.length;j++){
      m.setFloat(j,in[i].rm[j]);
    }
    newin.setJSONArray("fourier series",fo);
    newin.setJSONArray("envelope",en);
    newin.setJSONArray("notes",m);
    jin.setJSONObject(i,newin);
  }
  saveJSONArray(jin,"data/"+name+".json");
  println("saved");
}

void GUI_toneSetting(int x,int y,int w,int h){
  fill(color(150,55,220));
  stroke(0);
  rect(x,y,w,h);
  float scaleX=min(50,w/in[selected].tone.length);
  float scaleY=h/3;
  x+=scaleX*0.5;
  noFill();
  beginShape();
  for(int i=0;i<in[selected].tone.length;i++){
    vertex(i*scaleX+x,y+h-in[selected].tone[i]*scaleY);
    fill(i*-7+150,255,255);  
    rect((i-0.5)*scaleX+x,y+h,scaleX,-in[selected].tone[i]*scaleY*in[selected].volume*1.5);
  }
  noFill();
  endShape();
  if(mousePressed&&inRect(mouseX,mouseY,x,y,w,h)){
    if((int)((mouseX-x)/scaleX+0.5)<in[selected].tone.length&&(int)((mouseX-x)/scaleX)>=0){
      in[selected].tone[(int)((mouseX-x)/scaleX+0.5)]=max(min(-(mouseY-y-h),h)/scaleY,0);
    }
  }
}
void GUI_envelopeSetting(int x,int y,int w,int h){
  fill(100,55,220);
  stroke(0);
  rect(x,y,w,h);
  float scaleX=min(50,w/in[selected].envelope.length);
  float scaleY=h;
  x+=scaleX*0.5;
  noFill();
  beginShape();
  for(int i=0;i<in[selected].envelope.length;i++){
    vertex(i*scaleX+x,y+h-in[selected].envelope[i]*scaleY);
    
    fill(i*-7+150,255,255);
  }
  noFill();
  endShape();
  if(mousePressed&&inRect(mouseX,mouseY,x,y,w,h)){
    if((int)((mouseX-x)/scaleX+0.5)<in[selected].envelope.length&&(int)((mouseX-x)/scaleX)>=0){
      in[selected].envelope[(int)((mouseX-x)/scaleX+0.5)]=mouseButton==RIGHT?0:max(min(-(mouseY-y-h),h)/scaleY,0);
    }
  }
}
void mouseDragged(){
  if(mouseButton==CENTER){
    px+=mouseX-pmouseX;
    py-=mouseY-pmouseY;
    println(px);
  }
}
void GUI_notes(int x,int y,int w,int h,float px,float py,float scaleX,float scaleY){
  fill(40,10,230);
  stroke(0);
  rect(x,y,w,h);
  fill(255);
  int m[]=new int[in[selected].rm.length];
  for(int i=0;i<in[selected].rm.length;i++){
    m[i]=in[selected].rm[i];
  }
  
  stroke(100,50,200);
  fill(0);
  for(int i=0;i<h/scaleY;i++){
    line(x,y+(i*scaleY)-py%scaleY,x+w,y+(i*scaleY)-py%scaleY);
    text(numberToName(ceil(((i*scaleY+1)-py%scaleY-h+py)/-scaleY)),x+15,y+((i+0.5)*scaleY)-py%scaleY);
  }
  strokeWeight(3);
  stroke(150,50,50);
  for(int i=0;i<w/scaleX/16;i++){
    //line(x+(i*scaleX)*16+px%(scaleX*16),y,x+(i*scaleX)*16+px%(scaleX*16),y+h);
  }
  
  strokeWeight(1);
  stroke(150,0,255);
  for(int i=0;i<m.length;i++){
    if(px+i*scaleX>0&& px+(i+1)*scaleX<w && py+(m[i]-1)*scaleY>0 && py+(m[i])*scaleY<h){//display area
      fill((m[i]*4+1000)%255,230,150);
      rect(x+px+i*scaleX,h+y-(py+m[i]*scaleY),scaleX,scaleY);
    }
  }
  stroke(50);
  strokeWeight(3);
  for(float i=x+(px%scaleX);i<x+w;i+=scaleX){
    if(floor((i-x-px)%(4*scaleX))<scaleX){
      stroke(floor((i-x-px)%(16*scaleX))<scaleX?50:200);
      strokeWeight(floor((i-x-px)%(16*scaleX))<scaleX?3:1);
      line(i,y,i,y+h);
    }
  }
  strokeWeight(1);
  if(mousePressed&&mouseButton==LEFT){
    if(inRect(mouseX,mouseY,x,y,w,h)){
      int i=floor((mouseX-x-px)/scaleX);
      if(i>=0&&i<m.length){
        m[i]=ceil((mouseY-y-h+py)/-scaleY);
        in[selected].setM(i,m[i]);   
      }
    }
  }
    if(mousePressed&&mouseButton==RIGHT){
    if(inRect(mouseX,mouseY,x,y,w,h)){
      int i=floor((mouseX-x-px)/scaleX);
      if(i>=0&&i<m.length){
        m[i]=r;
        in[selected].setM(i,m[i]);   
      }
    }
  }
}

void GUI_drum(int x,int y,int w,int h,float px,float py,float scaleX,float scaleY){
  fill(80,10,230);
  stroke(0);
  rect(x,y,w,h);
  fill(255);
  boolean m[][]=d.m;
  
  stroke(100,50,200);
  fill(0);
  for(int i=0;i<h/scaleY;i++){
    line(x,y+(i*scaleY)-py%scaleY,x+w,y+(i*scaleY)-py%scaleY);
    //text(numberToName(ceil(((i*scaleY+1)-py%scaleY-h+py)/-scaleY)),x+15,y+((i+0.5)*scaleY)-py%scaleY);
  }
  
  strokeWeight(1);
  stroke(150,0,255);
  for(int j=0;j<m.length;j++){
    for(int i=0;i<m[j].length;i++){
      if(px+i*scaleX>0&& px+(i+1)*scaleX<w && py+(j-1)*scaleY>0 && py+(j)*scaleY<h){//display area
        if(m[j][i])
          rect(x+px+i*scaleX,h+y-(py+j*scaleY),scaleX,scaleY);
      }
    }
  }
  stroke(50);
  strokeWeight(3);
  for(float i=x+(px%scaleX);i<x+w;i+=scaleX){
    if(floor((i-x-px)%(4*scaleX))<scaleX){
      stroke(floor((i-x-px)%(16*scaleX))<scaleX?50:200);
      strokeWeight(floor((i-x-px)%(16*scaleX))<scaleX?3:1);
      line(i,y,i,y+h);
    }
  }
  strokeWeight(1);
  if(mousePressed&&mouseButton==LEFT){
    if(inRect(mouseX,mouseY,x,y,w,h)){
      int i=floor((mouseX-x-px)/scaleX);
      d.setM(ceil((mouseY-y-h+py)/-scaleY),i,true);   
    }
  }
    if(mousePressed&&mouseButton==RIGHT){
    if(inRect(mouseX,mouseY,x,y,w,h)){
      int i=floor((mouseX-x-px)/scaleX);
      d.setM(ceil((mouseY-y-h+py)/-scaleY),i,false);   
    }
  }
}

boolean inRect(float x,float y,float rx,float ry,float w,float h){
  return(x>rx&&x<rx+w&&y>ry&&y<ry+h);
}
int noteTransform(int note){
  if(note==r){
    return r;
  }
  int[] n={-1,1,2,4,6,7,9,11};
  return floor((note+140)/7-20)*12+n[(note+700)%7];
}

String numberToName(int n){
  return char((n+70)%7+65)+""+n/7;
}
