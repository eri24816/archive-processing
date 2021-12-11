void output(String s){
  textSize(30);
  text(s,20,words*30+210);
  words++;
  if(((m==n)&&(n==o))||m==0||n==0||o==0){
    f=true;
  }
}