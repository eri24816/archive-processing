import processing.sound.*;
class instrument{ 
  boolean isDrum=false;
  float tone[],envelope[];
  SinOsc sine[];
  int m[],rm[];
  float mult;
  boolean chosen=false;
  int time;
   instrument(sound4_3 s,int[] _m,boolean drum){
     rm=new int[_m.length];
     m=new int[_m.length];
     for(int i=0;i<_m.length;i++){
       if(_m[i]==r){
         m[i]=r;
         rm[i]=r;
       }
       else{
         m[i]=noteTransform(_m[i]);
         rm[i]=_m[i];
       }
     }
     
     tone=new float [s.tone.length];
     envelope=new float [s.envelope.length];
     sine=new SinOsc[tone.length];
     for(int i=0;i<sine.length;i++){
       sine[i]=new SinOsc(s);
       sine[i].freq((i+1)*0);
       sine[i].play();
     }
     time=0;
   }
   
   
  void update(){
    time++;
    for(int i=0;i<sine.length;i++){
      sine[i].amp(tone[i]*mult);
    }
    //mult=exp(-frameCount%delay*0.1);
    if(envelope.length>time){
      mult=envelope[time];
    }
    else{
      mult=0;
    }
  }
  void playNote(){
    
    if(m[t]!=r){
      time=0;
      for(int i=0;i<sine.length;i++){
        sine[i].freq((i+1)*14.5676*pow(2.0,m[t]/12.0));
      }
    }
    
  }
  void setTone(float[] tone){
    for(int i=0;i<tone.length;i++){
      this.tone[i]=tone[i];
    }
  }
  void setEnvelope(float[] envelope){
    for(int i=0;i<envelope.length;i++){
      this.envelope[i]=envelope[i];
    }
  }
  void setM(int index, int v){
    rm[index]=v;
    m[index]=noteTransform(v);
  }
}
