PVector v[];

int n=10;
float s=400;
void start(){
  size(800,800);
  background(255);
  v=new PVector[n];
  
  for(int i=0;i<n;i++){
    v[i]=PVector.fromAngle((2*PI*(i/n)));
    v[i].mult(s);
    v[i].add(new PVector(s,s));
  }
}
void draw(){
  for(int i=0;i<n;i++){
    point(v[i].x,v[i].y);
  }

}