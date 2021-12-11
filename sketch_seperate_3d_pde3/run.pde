void run(){ 
  int[] p1=new int[10000];
  int[] p2=new int[10000];
  int[] p3=new int[10000];
  boolean stop=false;
  t=0;
  f=false;
  words=1;
  output(m+","+n+","+o);
  maxt=((m+n+o)*(m+n+o));
  while(!stop){
    move();
    p1[t]=m;
    p2[t]=n;
    p3[t]=o;//save past m,n,o
    for(int i=0;i<t;i++){
      if(p1[i]==m&&
      p2[i]==n&&
      p3[i]==o){
        stop=true;
      }
    }            // stop
    t++;
  }
  words=0;
  if(f&&(m==n)&&(n==o)){
  
    output("o"+(t-1));
  }else{
    output("x");
  }
}