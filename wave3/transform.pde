float[] transform(float wave[]){

  float result[]=new float[(int)(Settings.samples)+1];
  int i=0;
  for(float freq=0;freq<Settings.maxFreq;freq+=Settings.maxFreq/Settings.samples){
    result[i]=amp(wave,freq);
    i++;
  }
  return result;
}

float amp(float[]wave,float freq){
  float sumx=0, sumy=0;
  
for(int i=0; i<wave.length*Settings.repeats;i++) {
    PVector v=pos(wave[i%wave.length],i*freq);
    sumx+=v.x;
    sumy+=v.y;
  }
  float dist=dist(0, 0, sumx, sumy);
  return dist;
}

PVector pos(float value, float k) {
  PVector v = PVector.fromAngle(k).mult(value);
  v.mult(value);
  return v;
}
static class Settings{
  static float maxFreq=0.3;
  static float samples=300;
  static float repeats=30;
}