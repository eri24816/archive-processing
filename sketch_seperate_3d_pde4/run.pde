void run(){ 
  int moves;
  int[] p1=new int[10000];
  int[] p2=new int[10000];
  int[] p3=new int[10000];
  stop=false;
  t=0;
  f=false;
  outputs=1;
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
  moves=outputs-2;
  outputs=0;
  if((m==n)&&(n==o)){
    output("o"+"("+(moves)+"moves)");
  }else{
    output("x");
  }
}