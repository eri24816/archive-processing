void move(){
  if(!f&&max(m,n,o)==m){
    if(!f&&max(n,o)==n){
      m-=n;n*=2;n-=o;o*=2;
      //t++;
      output(m+","+n+","+o);
    }
    else{
      m-=o;o*=2;o-=n;n*=2;
      //t++;
      output(m+","+n+","+o);
      }
  }
  else if(!f&&max(m,n,o)==n){
    if(!f&&max(m,o)==m){
      n-=m;m*=2;m-=o;o*=2;
      //t++;
      output(m+","+n+","+o);
    }
    else{
      n-=o;o*=2;o-=m;m*=2;
      //t++;
      output(m+","+n+","+o);
      }
  }
  else if(!f&&max(m,n,o)==o){
    if(!f&&max(m,n)==m){
      o-=m;m*=2;m-=n;n*=2;
      //t++;
      output(m+","+n+","+o);
    }
    else{
      o-=n;n*=2;n-=m;m*=2;
      //t++;
      output(m+","+n+","+o);
      }
  }
}
  