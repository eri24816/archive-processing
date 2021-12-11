float wave[];
float value[];
float k=0, l=0;
float sumx, sumy, dist, psumx, psumy, pdist;
float kstep=0.0001;
float times=30;
float sx=3000;
float sy=-0.1;
int t=0;
void setup() {
  
  size(1600, 800);
  //noFill();
  fill(255);
  textSize(30);
  PImage image=loadImage("asd.png");
  wave=new float[image.width];
  value=new float[image.width];
  beginShape();

  for (int x=0; x<image.width; x++) {
    for (int y=0; true; y++) {
      if (isBlue(image.get(x, y))) {
        wave[x]=map(y, 0, image.height, 0, 1);
        //println(x, map(y, 0, image.height, 0, 1));
        //vertex(x,wave[805]*100+400);

        break;
      }
      if (!(y<image.height)) {
        println("line not found at x="+x);
        break;
      }
    }
  }
  endShape();
  stroke(100);
  for (int x=800; x<1600; x+=100) {
    line(x, 0, x, 800);
  }
  for (int y=0; y<800; y+=100) {
    line(800, y, 1600, y);
  }
}

void draw() {

  sumx=0;
  sumy=0;
  stroke(0);
  fill(255);
  rect(0, 0, 800, 800);
  fill(0);
  text(k, 0, 30);
  noFill();
  beginShape();
  for (float theta=0; theta<wave.length*times; theta+=1) {
    PVector v=pos(theta, k);
    //println(wave[(int)theta],(int)theta);
    //vertex(v.x*400+400, v.y*400+400);
    sumx+=v.x;
    sumy+=v.y;
  }

  endShape();

  dist=dist(0, 0, sumx, sumy);
  translate(800, 400);

  stroke(0, 150, 0);
  line(k*sx, sumx*sy, (k-kstep)*sx, psumx*sy);
  stroke(255, 0, 0);
  line(k*sx, sumy*sy, (k-kstep)*sx, psumy*sy);
  stroke(0, 0, 255);
  line(k*sx, dist*sy, (k-kstep)*sx, pdist*sy);
  psumx=sumx;
  psumy=sumy;
  pdist=dist;
  k=kstep*t;
  //value[t]=dist;
  t++;
}

PVector pos(float theta, float k) {
  PVector v = PVector.fromAngle(theta*k);
  v.mult(wave[(int)theta%wave.length]);

  return v;
}

Table Result(){
  Table table=new Table();
  table.addColumn("index");
  table.addColumn("freq");
  table.addColumn("amp");
  for(int y=1000;y<0;y++){
    for(int x=0;x<value.length;x++){
      TableRow newRow = table.addRow();
      
    }
    
  }
  return table;
}

boolean isBlue(color c){
  return blue(c)-red(c)-green(c)>0;
}
void mousePressed(){
  delay(1000);
  
}
