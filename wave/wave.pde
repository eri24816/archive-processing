double wave[];

void setup(){
  size(1600,800);
  //noFill();
  textSize(30);
  wave=new double[5000];
  //beginShape();
  PImage image=loadImage("wave_piano.png");
  for(int x=0;x<image.width;x++){
    for(int y=0;true;y++){
      if(blue(image.get(x,y))-green(image.get(x,y))-red(image.get(x,y))>0){
        wave[int(wave.length/image.width)]=map(y,0,image.height,0,1);
        //vertex(x,(float)wave[int(wave.length/image.width)]*100+400);
        break;
      }
      if(!(y<image.height)){
        println("line not found at x="+x);
        break;
      }
    }
  }
  //endShape();
  println("setup finished");
  
}
float k=0,l=0;
float sumx,sumy,dist,psumx,psumy,pdist;
float kstep=0.005;

void draw(){
  
  sumx=0;
  sumy=0;
  stroke(0);
  fill(255);
  rect(0,0,800,800);
  fill(0);
  text(k,0,30);
  noFill();
  beginShape();
  for(float theta=0;theta<TWO_PI*100;theta+=0.0221){
    PVector v=pos(theta,k);
    vertex(v.x*200+400,v.y*200+400);
    sumx+=v.x;
    sumy+=v.y;
    
  }
    
  endShape();
  dist=dist(0,0,sumx,sumy);
  translate(800,400);
  stroke(0,150,0);
  line(k*500,sumx*-0.01,(k-kstep)*500,psumx*-0.01);
  stroke(255,0,0);
  line(k*500,sumy*-0.01,(k-kstep)*500,psumy*-0.01);
  stroke(0,0,255);
  line(k*500,dist*-0.01,(k-kstep)*500,pdist*-0.01);
  psumx=sumx;
  psumy=sumy;
  pdist=dist;

  k+=0.001;
  
  
  
  
}

PVector pos(float theta,float k){
  PVector v = PVector.fromAngle(theta*k);
  v.mult(sin(0.2*theta)+1);
  return v;
}