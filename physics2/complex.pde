class c{
  float re;
  float im;
  c(float re,float im){
    this.re=re;
    this.im=im;
  }
  c power(int a){
    c result=new c(1,0);
    for(int i=0;i<a;i++){
      result=mult(this,result);
    }
    return result;
  }
  float arg(){
    return(atan2(im,re));
  }

  float abs(){
    return(sqrt(re*re+im*im));
  }
}
float power(float x,int n){
  int r=1;
  for(int i=0;i<n;i++){
    r*=x;
  }
  return r;
}

c mult(c a,c b){
  return new c(a.re*b.re-a.im*b.im,a.re*b.im+a.im*b.re);
}
c mult(c a,float b){
  return new c(a.re*b,a.im*b);
}
c mult(float b,c a){
  return new c(a.re*b,a.im*b);
}
c add(c a,c b){
  return new c(a.re+b.re,a.im+b.im);
}
c minus(c a,c b){
  return new c(a.re-b.re,a.im-b.im);
}
c add(float a,c b){
  return new c(a+b.re,b.im);
}
c add(c a,float b){
  return new c(a.re+b,a.im);
}
c divide(c a,c b){
  return new c((a.re*b.re+a.im*b.im)/(b.re*b.re+b.im*b.im),(a.im*b.re-a.re*b.im)/(b.re*b.re+b.im*b.im));
}
c divide(c a,float b){
  return new c(a.re/b,a.im/b);
}
c divide(float b,c a){
  return new c(a.re/b,a.im/b);
}
c power(c a,c b){
  float r=a.abs();
  float arg=a.arg();
  return mult(pow(r,b.re)*exp(arg*-b.im),cis(b.re*arg+b.im*log(r)/log(2.71828)));
}
c power(float a,c b){
  float r=a;
  float arg=0;
  return mult(pow(r,b.re)*exp(arg*-b.im),cis(b.re*arg+b.im*log(r)/log(2.71828)));
}
c cis(float x){
  return new c(cos(x),sin(x));
}
float dist(c a,c b){
  return sqrt(sq(a.re-b.re)+sq(a.im-b.im));
}
float dir(c a,c b){
  return minus(b,a).arg();
}
c con(c a){
  return new c(a.re,-a.im);
}
