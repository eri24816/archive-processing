void output2(){
  textSize(30);
  if(entering==0){fill(0,100,200);}else{fill(0,0,0);}
  text(a,width/2-15,40);
  if(entering==1){fill(0,100,200);}else{fill(0,0,0);}
  text(b,width/2-15,90);
  if(entering==2){fill(0,100,200);}else{fill(0,0,0);}
  text(c,width/2-15,140);
  
  fill(150);
  rect(0,150,width,40);
  fill(0);
  textSize(30);
  text("start",width/2-30,178);
}