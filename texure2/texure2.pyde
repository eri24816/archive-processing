def setup():
    size(640,640)
    background(20);
    loadPixels()
    for i in range(0,width*height,300):
        i+=int(random(-30,30)*(width+1))
        c=int(random(10,100))
        for k in range(-10,10):
            for j in range(int(-random(60)),int(random(60))): 
                pixels[(i+j+k*width)%(width*height)]=color((red(pixels[(i+j+k*width)%(width*height)])+c)/2.0)
    updatePixels()
