void bounce(){
  a1=4;
  a2=0;
  a4=0;
  for(float r=0;r<2*PI;r+=0.01){
    if(get(int(x+(size/2)*sin(r)),int(y+(size/2)*cos(r)))==color(0,200,200)){  
      a3[a4]=r;
      if(a4<a1){
        a1=a4;
      }
      if(a4>a2){
        a2=a4;
      }
      a4++;       
      
    }
  }
  if(a1!=4){
    line(x,y,x+100*sin(a3[(a1+a2)/2]),y+100*cos(a3[(a1+a2)/2]));
    direction=a3[(a1+a2)/2]*2-direction-PI/2;
    xs=s*sin(direction);
    ys=s*cos(direction);
    x+=xs*3;
    y+=ys*3;
    println(1);
  } 
  else{ println(ENTER);}
}