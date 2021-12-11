ball balls[];
float v_avg[];
c scale;
c trans;
int cols=0;
float times=100;
boolean creating=false;
float g=0.000000000002;
//two_balls test;
void setup(){
  colorMode(HSB);
  size(1000,1000);
  background(0);
  scale=new c (200,0);
  trans=new c (0,0);
  balls=new ball[10];
  for(int i=0;i<balls.length;i++){
    balls[i]=new ball(mult(1,cis(i*PI/5.0)),mult(0.0002,cis(i*PI/5.0-PI*0.3)),200+600*i);  
  }
 // test=new two_balls(balls[0],balls[1],1);
  //test.avel=0.01;
  /*
  balls[0]=new ball(mult(0,cis(1*6.283/5.0)),new c(random(0.00001,0.00005),0),50000);  
  balls[1]=new ball(mult(1.9,cis(0)),new c(0,0.0001),5000);
  balls[2]=new ball(mult(2.2,cis(0)),new c(0.0008,0.0001),5000);
  balls[3]=new ball(mult(2.2,cis(1)),new c(0.0002,0.0002),5000);
  */
  
  v_avg=new float [balls.length];
  
  /*
  balls[0]=new ball(new c(0,0),new c(-0.001,0));
  balls[0].mass=10;
  balls[1]=new ball(new c(-1,0),new c(0,0));
  */
  noStroke();
  
}
c toScreen(c z){
  return add(con(mult(add(z,trans),scale)),new c(width/2,height/2));
}

c toPos(c z){
  return add(divide(con(add(z,new c(-width/2,-height/2))),scale),trans);
}
void draw(){
  for(int i=0;i<balls.length;i++){
    v_avg[i]=(v_avg[i]*(float)frameCount+balls[i].vel.abs()*100.0)/(float)(frameCount+1);
  }
  background(0);
  if(mousePressed){

  }
  
  for(int n=0;n<times;n++){
    //test.update();
    for(int i=0;i<balls.length;i++){
      
      balls[i].update();

    }
    for(int i=0;i<balls.length;i++){
      if(toScreen(balls[i].pos).im-balls[i].size*0.5<0){balls[i].vel=new c(balls[i].vel.re,-balls[i].vel.im);cols++;}
      if(toScreen(balls[i].pos).im+balls[i].size*0.5>height){balls[i].vel=new c(balls[i].vel.re,-balls[i].vel.im);cols++;}
      if(toScreen(balls[i].pos).re-balls[i].size*0.5<0){balls[i].vel=new c(-balls[i].vel.re,balls[i].vel.im);cols++;}
      if(toScreen(balls[i].pos).re+balls[i].size*0.5>width){balls[i].vel=new c(-balls[i].vel.re,balls[i].vel.im);cols++;}
      for(int j=0;j<i;j++){
        balls[i].vel=add(balls[i].vel,mult(g*balls[j].mass/sq(minus(balls[j].pos,balls[i].pos).abs()),cis(minus(balls[j].pos,balls[i].pos).arg())));
        balls[j].vel=add(balls[j].vel,mult(g*balls[i].mass/sq(minus(balls[i].pos,balls[j].pos).abs()),cis(minus(balls[i].pos,balls[j].pos).arg())));
        if(dist(balls[i].pos,balls[j].pos)*scale.abs()*2.0<balls[i].size+balls[j].size){
          collide(i,j,dir(balls[j].pos,balls[i].pos));cols++;
        }
        
      }

    }
      for(int i=0;i<balls.length;i++){
      
       balls[i].vel=mult(balls[i].vel,0.99999);
    }
  }
  
  fill(255);
  textSize(50);
  //text("collisions: "+cols,200,50);
  
      for(int i=0;i<balls.length;i++){
      
balls[i].display();
    }
}
void collide(int m,int n,float dir){
  ball a=new ball(balls[m].pos,balls[m].vel,balls[m].mass);
  ball b=new ball(balls[n].pos,balls[n].vel,balls[n].mass);
  //balls[m].vel=add(mult(a.vel.abs()*sin(dir-a.vel.arg()),cis(dir-PI/2.0)),mult(sc(a.mass,a.vel.abs()*cos(dir-a.vel.arg()),b.mass,b.vel.abs()*cos(dir-b.vel.arg())),cis(dir)));
  //balls[n].vel=add(mult(b.vel.abs()*sin(dir-b.vel.arg()),cis(dir-PI/2.0)),mult(sc(b.mass,b.vel.abs()*cos(dir-b.vel.arg()),a.mass,a.vel.abs()*cos(dir-a.vel.arg())),cis(dir)));
  balls[m].addJ(mult(sc(a.mass,a.vel.abs()*cos(dir-a.vel.arg()),b.mass,b.vel.abs()*cos(dir-b.vel.arg())),cis(dir)));
  balls[n].addJ(mult(sc(b.mass,b.vel.abs()*cos(dir-b.vel.arg()),a.mass,a.vel.abs()*cos(dir-a.vel.arg())),cis(dir)));

}


float sc(float m1,float v1,float m2,float v2){
  return(2*m1*m2*(v2-v1))/(m1+m2);
}
