import processing.sound.*;

class drum{ 
  SoundFile sound[]=new SoundFile[8];
  boolean m[][];
   drum(sound5_2 s,int n){
     m=new boolean[sound.length][n];
     for(int i=0;i<m.length;i++){
       for(int j=0;j<m[i].length;j++)
         m[i][j]=false;
     }
     sound[0]= new SoundFile(s, "ambient_tom_2.mp3");
     sound[1]= new SoundFile(s, "ambient_tom_3.mp3");
     sound[2]= new SoundFile(s, "clappy-snare.mp3");
     sound[3]= new SoundFile(s, "compressed_sd.mp3");
     sound[4]= new SoundFile(s, "curiouscym1.mp3");
     sound[5]= new SoundFile(s, "distortotom.mp3");
     sound[6]= new SoundFile(s, "ghay.mp3");
     sound[7]= new SoundFile(s, "musical_snare.mp3");
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
}
