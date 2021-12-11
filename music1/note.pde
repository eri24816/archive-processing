import processing.sound.*;
class instrument{ 
  float tone[],envelope[],_envelope[];
  SinOsc sine[];
  int m[],rm[];
  float volume;
  int time;
  int echodelay=5;
  float echovol=0.5;
  float echosmooth=0;
  float pechosmooth=100;
   instrument(music1 s,int[] _m){
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
     envelope=new float [200];
     _envelope=new float [200];
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
  if(time<envelope.length)
    volume=_envelope[time];
  /*
  for(int i=0;i<200;i++){
    if(time-i*echodelay>0&&time-i*echodelay<envelope.length){
      volume+=pow(echovol,(float)i)*_envelope[time-i*echodelay];
    }
  }
  */
  if(pechosmooth!=echosmooth){
    pechosmooth=echosmooth;
    _envelope=echo(envelope,echovol,echodelay,echosmooth);
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
float[] smooth(float arr[],float k){
  float result[]=new float[arr.length];
  if(k==0){
    return arr;
  }
  else{
    for(int i=0;i<result.length;i++){
      result[i]=0;
    }
    float sum=0;
    for(int i=-result.length/2;i<result.length/2;i+=1){
      sum+=exp(-(i)*(i)/k);// integral e^(-x^2 /echosmooth)
    }
    for(int i=0;i<arr.length;i++){
      for(int j=max(0,i-20);j<min(result.length,i+20);j++){
        result[j]+=arr[i]*exp(-(j-i)*(j-i)/k)/sum;
      }
    }
  }
  return result;
}
float[] echo(float arr[],float vol,float del,float smoothk){
  float smoothed[]=new float[arr.length+100];
  for(int i=0;i<arr.length;i++){
    smoothed[i+100]=arr[i];
  }
  float result[]=new float[arr.length+100];
  float _result[]=new float[arr.length];
  for(int i=0;i<result.length;i+=del){
    for(int j=0;j<smoothed.length;j++){
      if(i+j-100>0&&i+j-100<_result.length)
        _result[i+j-100]+=smoothed[j]*(1-vol);
    }
    for(int j=0;j<smoothed.length;j++){
      smoothed[j]=smoothed[j]*vol;
    }
    smoothed=smooth(smoothed,smoothk);
    
  }
  

  return _result;
}
