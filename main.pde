OpenSimplexNoise nois; //I'm using OpenSimplexNoise, a library external to Processing
int period;
float scale;

void setup() {
  size(600, 600);
  
  nois = new OpenSimplexNoise();
  period = 120;
  scale = .01;
}

void draw() {
 loadPixels();
 
 for (int x = 0; x < width; x++)
   for (int y = 0; y < height; y++) {
     float rand = (float)nois.eval(scale * x, scale * y, cos(TWO_PI * frameCount / period), sin(TWO_PI * frameCount / period));
     color colour;
     if (rand < -.5)
       colour = color(#603e95);
      else if (-.5 < rand && rand < 0)
        colour = color(#009da1);
      else if (0 < rand && rand < .5)
        colour = color(#fac22b);
      else
        colour = color(#d7255d);
      
      pixels[x + y * width] = colour;
   }
 
 updatePixels();
}
