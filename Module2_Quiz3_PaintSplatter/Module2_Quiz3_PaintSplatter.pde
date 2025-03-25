int flushTime = 0; // to flush screen after 300 frames

void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
    // position
  float gaussian = randomGaussian();
  println(gaussian);
  
  float standardDeviation = 100;
  float mean = 0;
  
  float x = constrain(
    standardDeviation * gaussian + mean , 
    -width/2, width/2); // bound x between left & right screen
  float y = random(-height/2, (height/2)+1); // between top & bottom
    
    // position
  
  
    // scale
  gaussian = randomGaussian();
  standardDeviation = 15;
  mean = 30;
  float size = standardDeviation * gaussian + mean;
  
    // scale
    
  
    // color
  noStroke();
  fill(
    random(0,256), // RGB: 0-255
    random(0,256),
    random(0,256), 
    random(10,101) ); // Alpha: 0-100
    
    // color
  
  
  circle(x, y, size);
  
  
    // bonus: flush screen
    
  flushTime++;
  if (flushTime >= 300) // flush screen after 300 frames
  {
    background(255);
    flushTime = 0;
  }
  
}
