void run(){ 
  t=0;
  f=false;
  words=1;
  output(m+","+n+","+o);
  maxt=((m+n+o)*(m+n+o));
  while(t<maxt){
    move();   
    if(f){
      
      break;
    }
  }
  words=0;
  println(t);
  if(f&&(m==n)&&(n==o)){
  
    output("o");
  }else{
    output("x");
  }
}