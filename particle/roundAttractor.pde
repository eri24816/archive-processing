class RAttractor {
  float x=0, y=0;
  float g=0.03;
  float affectRange=400;
  float ds=0.0017;
  float d;
  float hue;
  void update(Par[] o) {
    for (int i=0; i<o.length; i++) {
      d=dist(x, y, o[i].x, o[i].y)+0.01;
      if (d<affectRange) {
        o[i].vx+=g*(x-o[i].x)*(-1.0/d/d/ds/ds+3.0/(d*ds+0.2)/(d*ds+0.2))/d;
        o[i].vy+=g*(y-o[i].y)*(-1.0/d/d/ds/ds+3.0/(d*ds+0.2)/(d*ds+0.2))/d;
      }
    }
    noStroke();
    fill(hue, 20,255,20);
    ellipse(x,y,0.7/ds,0.7/ds);
    fill(hue, 20,255,50);
    ellipse(x,y,0.6/ds,0.6/ds);
    fill(hue, 20,255,100);
    ellipse(x,y,0.5/ds,0.5/ds);
  }
}
