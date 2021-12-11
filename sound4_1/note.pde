import processing.sound.*;
class note{ 
  float amp[];
  SinOsc sine[];
  int m[];
  float mult;
  
   note(sound4_1 s,int[] _m){
     m=new int[_m.length];
     for(int i=0;i<_m.length;i++){
       m[i]=floor((_m[i]+14)/7)*12+noteTransform[(_m[i]+70)%7];
     }
     
     amp=new float [12];
     sine=new SinOsc[amp.length];
     for(int i=0;i<sine.length;i++){
       sine[i]=new SinOsc(s);
       sine[i].freq((i+1)*0);
       sine[i].play();
     }
   }
  void update(){
    for(int i=0;i<sine.length;i++){
      sine[i].amp(amp[i]*mult);
      sine[i].freq((i+1)*130*pow(2.0,m[t]/12.0));
    }
    mult=exp(-frameCount%delay*0.1);

  }
  void playNote(){
    if(m[t]!=A){
      mult=1;
    }
  }
  void changeAmp(float[] _amp){
    amp=_amp;
  }
}
