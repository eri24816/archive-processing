void setup(){
size(640, 360);
//noLoop();
background(255);
}
void draw(){

float w = 5;
float h = (w * height) / width;
float k = 0.1;
float l = 0.3;


float xmin = -w/2;
float ymin = -h/2;


loadPixels();
k=(mouseX-width/2);
l=(mouseY-height/2);

int maxiterations = 100;

// x goes from xmin to xmax
float xmax = xmin + w;
// y goes from ymin to ymax
float ymax = ymin + h;

// Calculate amount we increment x,y for each pixel
float dx = (xmax - xmin) / (width);
float dy = (ymax - ymin) / (height);

// Start y
float y = ymin;
for (int j = 0; j < height; j++) {
  // Start x
  float x = xmin;
  for (int i = 0; i < width; i++) {

    // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
    float a = x;
    float b = y;

    int n = 0;
    while (n < maxiterations) {
      float aa = a * a;
      float bb = b * b;
      float twoab = 2.0 * a * b;
      a = aa - bb + x+k/100;
      b = twoab + y+l/100;
      // Infinty in our finite world is simple, let's just consider it 16
      if (aa + bb > 16.0) {
        break;  // Bail
      }
      n++;
    }

    // We color each pixel based on how long it takes to get to infinity
    // If we never got there, let's pick the color black
    if (n == maxiterations) {
      pixels[i+j*width] = color(0);
    } else {
      // Gosh, we could make fancy colors here if we wanted
      pixels[i+j*width] = color(n*16 % 255,n*16 % 255,n*16 % 255);
    }
    x += dx;
  }
  y += dy;
}
updatePixels();}