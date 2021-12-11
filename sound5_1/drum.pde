import processing.sound.*;
class drum{ 
  float tone[],envelope[];
  SinOsc sine[];
  int m[],rm[];
  float volume;
  boolean chosen=false;
  int time;
  int echodelay=5;
  float echovol=0.5;
   drum(sound5_1 s,int[] _m){
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
   }
   
  void update(){
    time++;
    for(int i=0;i<sine.length;i++){
      sine[i].amp(tone[i]*volume);
    }
    volume=0;
    for(int i=0;i<200;i++){
      if(time-i*echodelay>0&&time-i*echodelay<envelope.length){
        volume+=pow(echovol,(float)i)*envelope[time-i*echodelay];
      }
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

  void setM(int index, int v){
    rm[index]=v;
    m[index]=noteTransform(v);
  }
}
