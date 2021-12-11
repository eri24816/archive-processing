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


Complex mult(Complex a,Complex b){
  return new Complex(a.re*b.re-a.im*b.im,a.re*b.im+a.im*b.re);
}
Complex mult(Complex a,float b){
  return new Complex(a.re*b,a.im*b);
}
Complex add(Complex a,Complex b){
  return new Complex(a.re+b.re,a.im+b.im);
}
Complex devide(Complex a,Complex b){
  return new Complex((a.re*b.re+a.im*b.im)/(b.re*b.re+b.im*b.im),(a.im*b.re-a.re*b.im)/(b.re*b.re+b.im*b.im));
}
Complex devide(Complex a,float b){
  return new Complex(a.re/b,a.im/b);
}
