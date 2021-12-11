void output(String s){
  textSize(30);
  text(s,20,outputs*30+320);
  outputs++;
  if(((m==n)&&(n==o))){
    stop=true;
  }
}