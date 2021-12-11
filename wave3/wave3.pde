float wave[];
float value[];
float  l=0;
float sx=1;
float sy=-0.1;

void setup() {
  
  size(1600, 800);
  background(0);
  noFill();
  textSize(30);
  PImage image=loadImage("wave10.png");
  wave=new float[image.width];
  for (int x=0; x<image.width; x++) {
    for (int y=0; true; y++) {
      if (isBlue(image.get(x, y))) {
        wave[x]=map(y,0, image.height,0,1);
        break;
      }
      if (!(y<image.height)) {
        println("line not found at x="+x);
        break;
      }
    }
  }
  stroke(100,50,0);
  for (int x=0; x<1600; x+=100) {
    line(x, 0, x, 800);
  }
  for (int y=0; y<800; y+=100) {
    line(0, y, 1600, y);
  }
  stroke(0,255,0);
  translate(0,400);
  Settings.samples=2000;
  Settings.repeats=40;
  value=transform(wave);
  sx=width/value.length;
  beginShape();
  for(int i=0;i<value.length;i++){
    vertex(i*sx,value[i]*sy);
  }
  endShape();
}
int t=0;
void draw() {
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