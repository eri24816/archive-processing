class Par {
  boolean enabled=false;
  float x, y, vx, vy;
  float lineRange=50;
  float destroyRange=60;
  float affectRange=60;
  float g=0.0012;
  float maxVel=1000;
  float ds=0.015;
  float respawnR=200;
  float hue=10;
  Par() {}
  void display(Par[] o) {
    stroke(hue, 100,255,2);
    strokeWeight(30);
    point(x,y);
    strokeWeight(1);
    for (int i=0; i<o.length; i++) {
      if(!o[i].enabled) continue;
      if (dist(x, y, o[i].x, o[i].y)<lineRange) {
        stroke(hue,255 , 255,600.0/(dist(x, y, o[i].x, o[i].y)+10)-10);
        line(x, y, o[i].x, o[i].y);
      }
    }
  }
  void update(Par[] o) {
    x+=vx;
    y+=vy;
    float d;
    float c=0;
    float vel=sqrt(vx*vx+vy*vy);
    if(vel>maxVel){
      vx*=maxVel/vel;
      vy*=maxVel/vel;
    }
    //hue=(1+(y-height/2)*0.2)*0.01+hue*0.99;
    for (int i=0; i<o.length; i++) {
      if(!o[i].enabled) continue;
      d=dist(x, y, o[i].x, o[i].y)+0.01;
      if (d<affectRange) {
        o[i].vx+=g*(x-o[i].x)*(-1.0/d/d/ds/ds+10.0/(d*ds+1)/(d*ds+1))/d;
        o[i].vy+=g*(y-o[i].y)*(-1.0/d/d/ds/ds+10.0/(d*ds+1)/(d*ds+1))/d;
      }
      if (d<destroyRange) {
        c++;
      }
    }
    if(c<5){
      enabled=false;
    }
  }

}
