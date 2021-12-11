import processing.sound.*;

class drum{ 
  SoundFile sound[]=new SoundFile[8];
  boolean m[][];
   drum(music1 s,int n){
     m=new boolean[sound.length][n];
     for(int i=0;i<m.length;i++){
       for(int j=0;j<m[i].length;j++)
         m[i][j]=false;
     }
     sound[0]= new SoundFile(s, "Hi_hat_foot_pedal.wav");
     sound[1]= new SoundFile(s, "Hi_hat_closed.wav");
     sound[2]= new SoundFile(s, "Tom_8_inch.wav");
     sound[3]= new SoundFile(s, "Snare.wav");
     sound[4]= new SoundFile(s, "Tom_12_inch.wav");
     sound[5]= new SoundFile(s, "Floor_tom.wav");
     sound[6]= new SoundFile(s, "Bass.wav");
     sound[7]= new SoundFile(s, "Crash.wav");
     for(int i=0;i<m.length;i++)
     sound[i].amp(5);
   }
   
  void update(){
  }
  void playNote(){
    for(int i=0;i<m.length;i++){
      if(m[i][t]){
        sound[i].play();
      }
    }
  }

  void setM(int i,int j, boolean v){
    if(i>=0&&i<m.length&&j>=0)
      m[i][j]=v;
  }
  void play(int i){
    sound[i].play();
  }
}
