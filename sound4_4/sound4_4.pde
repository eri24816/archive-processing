import processing.sound.*;
float tone[];
int t=0;
int delay=20;
int r=-100;
float envelope[];
instrument in[];
Button b_part[];
Button b_start,b_pause,b_stop,b_a,b_d,b_save,b_load;
boolean playing;
int chosenInd=0;
float px=10,py=-700;
int timeFromPlay=0;
String filename="b";
void setup() {
  
  colorMode(HSB);
  size(1900,1100);
  textSize(20);
  textAlign(CENTER);
  tone=new float [12];
  envelope=new float[delay*8];
  in=new instrument[4];
  b_part=new Button[in.length];
  
  
  int m[][]=new int[in.length][512];
  for(int i=0;i<m.length;i++){
    for(int j=0;j<m[i].length;j++){
      m[i][j]=r;
    }
  }
  /*
            {{1,r,3,r,5,r,4,r,3,r,1,r,3,r,2,r,1,r,-1,r,1,r,-2,r,-1,r,1,r,0,r,2,r},
             {3,r,r,r,2,r,r,r,1,r,r,r,0,r,r,r,-1,r,r,r,-2,r,r,r,-1,r,r,r,-0,r,r,r},
             {-6,-4,-2,1,-9,-7,-5,-2,-8,-6,-4,-1,-11,-9,-7,-4,-10,-8,-6,-3,-13,-11,-9,-6,-10,-8,-6,-3,-9,-7,-5,-2}
            };canon
            */
  for(int i=0;i<in.length-1;i++){
    in[i]=new instrument(this,m[i],false);
    b_part[i]=new Button(width-50,i*50,50,50);
    b_part[i].setText("part"+(i+1));
  }
  in[in.length-1]=new instrument(this,m[i],true);
  b_start=new Button(10,930,50,50);
  b_start.setText("►");
  b_pause=new Button(70,930,50,50);
  b_pause.setText("❚❚");
  b_stop=new Button(130,930,50,50);
  b_stop.setText("⬛");
  in[0].chosen=true;
  b_a=new Button(190,930,50,50);
  b_a.setText("+");
  b_d=new Button(250,930,50,50);
  b_d.setText("-");
  b_load=new Button(10,870,50,50);
  b_load.setText("load");
  b_save=new Button(70,870,50,50);
  b_save.setText("save");
  //load(filename);
}
void draw(){
  background(200);
  GUI_toneSetting(410,620,600,390);
  GUI_envelopeSetting(1020,620,600,390);
  GUI_notes(10,10,1300,600,px,py,30,30);
 //<>//
  for(int i=0;i< in.length;i++){
    in[i].update();
  }
  for(int i=0;i<in.length;i++){
    b_part[i].display();
    if(b_part[i].press()){
      for(int k=0;k<in.length;k++){
        in[k].chosen=(i==k);
        b_part[k].setColor(in[k].chosen? 255:230);
      }
      chosenInd=i;
      for(int j=0;j<tone.length;j++){
        tone[j]=in[i].tone[j];
      }
      for(int j=0;j<envelope.length;j++){
        envelope[j]=in[i].envelope[j];
      }
    }
    if(in[i].chosen){
      in[i].setTone(tone);
      in[i].setEnvelope(envelope);
    }
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
      t=(t+1)%in[0].m.length;
    }
  }
  b_start.display();
  b_pause.display();
  b_stop.display();
  b_a.display();
  b_d.display();
  b_save.display();
  b_load.display();
  text(1.0/delay,10,800);
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
    
    in[i].setTone(value);
    
    a=o.getJSONArray("envelope");
    float value2[]=new float[a.size()];
    for(int j=0;j<a.size();j++){
      value2[j]=a.getFloat(j);
      println(value2[j]);
    }
    in[i].setEnvelope(value2);
    
    a=o.getJSONArray("notes");
    for(int j=0;j<a.size();j++){
      in[i].setM(j,(int)a.getFloat(j));
    }
  }
  
  
  for(int k=0;k<in.length;k++){
    in[k].chosen=(0==k);
    b_part[k].setColor(in[k].chosen? 255:230);
  }
  chosenInd=0;
  tone=new float [in[0].tone.length];
  for(int j=0;j<tone.length;j++){
    tone[j]=in[0].tone[j];
  }
  envelope=new float [in[0].envelope.length];
  for(int j=0;j<envelope.length;j++){
    envelope[j]=in[0].envelope[j];
    
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
  float scaleX=min(50,w/tone.length);
  float scaleY=h/3;
  x+=scaleX*0.5;
  noFill();
  beginShape();
  for(int i=0;i<tone.length;i++){
    vertex(i*scaleX+x,y+h-tone[i]*scaleY);
    fill(i*-7+150,255,255);  
    rect((i-0.5)*scaleX+x,y+h,scaleX,-tone[i]*scaleY*in[chosenInd].mult*1.5);
  }
  noFill();
  endShape();
  if(mousePressed&&inRect(mouseX,mouseY,x,y,w,h)){
    if((int)((mouseX-x)/scaleX+0.5)<tone.length&&(int)((mouseX-x)/scaleX)>=0){
      tone[(int)((mouseX-x)/scaleX+0.5)]=max(min(-(mouseY-y-h),h)/scaleY,0);
    }
  }
}

void GUI_envelopeSetting(int x,int y,int w,int h){
  fill(color(100,55,220));
  stroke(0);
  rect(x,y,w,h);
  float scaleX=min(50,w/envelope.length);
  float scaleY=h;
  x+=scaleX*0.5;
  noFill();
  beginShape();
  for(int i=0;i<envelope.length;i++){
    vertex(i*scaleX+x,y+h-envelope[i]*scaleY);
    fill(i*-7+150,255,255);
  }
  noFill();
  endShape();
  if(mousePressed&&inRect(mouseX,mouseY,x,y,w,h)){
    if((int)((mouseX-x)/scaleX+0.5)<envelope.length&&(int)((mouseX-x)/scaleX)>=0){
      envelope[(int)((mouseX-x)/scaleX+0.5)]=mouseButton==RIGHT?0:max(min(-(mouseY-y-h),h)/scaleY,0);
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
  fill(color(40,10,230));
  stroke(0);
  rect(x,y,w,h);
  fill(255);
  int m[]=new int[in[chosenInd].rm.length];
  for(int i=0;i<in[chosenInd].rm.length;i++){
    m[i]=in[chosenInd].rm[i];
  }
  
  stroke(100,50,200);
  fill(0);
  for(int i=0;i<h/scaleY;i++){
    line(x,y+(i*scaleY)-py%scaleY,x+w,y+(i*scaleY)-py%scaleY);
    text(numberToName(ceil(((i*scaleY+1)-py%scaleY-h+py)/-scaleY)),x+15,y+((i+0.5)*scaleY)-py%scaleY);
  }
  /*
  for(int i=0;i<w/scaleX/4;i++){
    stroke(floor((i*4-px/scaleX+1600)%16)<4?50:200);
    strokeWeight(floor((i*4-px/scaleX+1600)%16)<4?3:1);
    line(x+(i*scaleX)*4+px%(scaleX*4),y,x+(i*scaleX)*4+px%(scaleX*4),y+h);
  }
  */

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
        in[chosenInd].setM(i,m[i]);   
      }
    }
  }
    if(mousePressed&&mouseButton==RIGHT){
    if(inRect(mouseX,mouseY,x,y,w,h)){
      int i=floor((mouseX-x-px)/scaleX);
      if(i>=0&&i<m.length){
        m[i]=r;
        in[chosenInd].setM(i,m[i]);   
      }
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
