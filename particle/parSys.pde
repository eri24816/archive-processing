class ParSys {
  boolean enabled=true;
  float lineRange=60;
  float destroyRange=60;
  float affectRange=60;
  float g=0.0007;
  float maxVel=10;
  float ds=0.015;
  float respawnR=140;
  float hue=200;
  RAttractor ra;
  Par pars[];
  ParSys(int n) {
    pars=new Par[n];
    for (int i=0; i<n; i++) {
      pars[i]=new Par();
      pars[i].lineRange=lineRange;
      pars[i].destroyRange=destroyRange;
      pars[i].affectRange=affectRange;
      pars[i].g=g;
      pars[i].maxVel=maxVel;
      pars[i].ds=ds;
      pars[i].respawnR=respawnR;
      pars[i].hue=hue;
    }
    ra=new RAttractor();
    ra.hue=hue;
  }
  void update() {
    ra.update(pars);
    if (!enabled)return;
    for (int i=0; i<pars.length; i++) {
      if (pars[i].enabled) {
        pars[i].update(pars);
        pars[i].display(pars);
      } else if (mousePressed) {
        if (!pars[i].enabled) {
          pars[i].enabled=true;
          float angle=random(0, 2*PI);
          float r=random(respawnR, respawnR*1.5);
          pars[i].x=orginalX+r*cos(angle);
          pars[i].y=orginalY+r*sin(angle);
          pars[i].vx=1.0*sin(angle);
          pars[i].vy=1.0*-cos(angle);
          pars[i].hue=hue;
        }
      }
    }
  }
  void display() {
    if (!enabled)return;
    for (int i=0; i<pars.length; i++) {
      pars[i].display(pars);
    }
  }
}
