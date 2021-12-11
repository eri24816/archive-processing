class a{
  float Maxloss=0.1;
  ComplexNumber loss;
  a(){
    
  }
  void _draw(){
    //loadPixels();
    for (int x =  0; x < height; x++) {
  
      for (int y = 0; y < width; y++) {
        loss=n[x][y];
        //loss.add(new ComplexNumber(1,0));
         if(loss.mod()<=Maxloss){
           pixels[x+y*width]=color(0,0,0);
         }
      }
    }
  
  //updatePixels();
  }
  
  
  
}