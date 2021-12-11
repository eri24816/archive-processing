class Complex{
  float re;
  float im;
  Complex(float re,float im){
    this.re=re;
    this.im=im;
  }
  Complex power(int a){
    Complex result=new Complex(1,0);
    for(int i=0;i<a;i++){
      result=mult(this,result);
    }
    return result;
  }
  float arg(){
    return(atan2(re,im));
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

Complex mult(Complex a,Complex b){
  return new Complex(a.re*b.re-a.im*b.im,a.re*b.im+a.im*b.re);
}
Complex mult(Complex a,float b){
  return new Complex(a.re*b,a.im*b);
}
Complex mult(float b,Complex a){
  return new Complex(a.re*b,a.im*b);
}
Complex add(Complex a,Complex b){
  return new Complex(a.re+b.re,a.im+b.im);
}
Complex divide(Complex a,Complex b){
  return new Complex((a.re*b.re+a.im*b.im)/(b.re*b.re+b.im*b.im),(a.im*b.re-a.re*b.im)/(b.re*b.re+b.im*b.im));
}
Complex divide(Complex a,float b){
  return new Complex(a.re/b,a.im/b);
}
Complex power(Complex a,Complex b){
  float r=a.abs();
  float arg=a.arg();
  return mult(pow(r,b.re)*exp(arg*-b.im),cis(b.re*arg+b.im*log(r)/log(2.71828)));
}
Complex cis(float x){
  return new Complex(cos(x),sin(x));
}
