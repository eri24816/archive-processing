import processing.sound.*;
class instrument{ 
  float tone[],envelope[];
  SinOsc sine[];
  int m[],rm[];
  float volume;
  int time;
  int echodelay=5;
  float echovol=0.5;
   instrument(sound5_2 s,int[] _m){
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
     
     tone=new float [12];
     envelope=new float [100];
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
