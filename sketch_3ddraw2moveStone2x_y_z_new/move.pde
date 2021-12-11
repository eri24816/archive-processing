void move(){
  if(!f&&max(m,n,o)==m){
    if(!f&&max(n,o)==n){
      m-=o;o*=2;
      //t++;
      output("["+(t+1)+"]"+m+","+n+","+o);
    }
    else{
      m-=n;n*=2;
      //t++;
      output("["+(t+1)+"]"+m+","+n+","+o);
      }
  }
  else if(!f&&max(m,n,o)==n){
    if(!f&&max(m,o)==m){
      n-=o;o*=2;
      //t++;
      output("["+(t+1)+"]"+m+","+n+","+o);
    }
    else{
      n-=m;m*=2;
      //t++;
      output("["+(t+1)+"]"+m+","+n+","+o);
      }
  }
  else if(!f&&max(m,n,o)==o){
    if(!f&&max(m,n)==m){
      o-=n;n*=2;
      //t++;
      output("["+(t+1)+"]"+m+","+n+","+o);
    }
    else{
      o-=m;m*=2;
      //t++;
      output("["+(t+1)+"]"+m+","+n+","+o);
      }
  }
}