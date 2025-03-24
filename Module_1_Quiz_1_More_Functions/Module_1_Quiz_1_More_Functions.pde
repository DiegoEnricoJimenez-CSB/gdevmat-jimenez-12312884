int framesPassed = 0;
int timeVariable = 0;

float frequency = 0.1;
float frequencyIncrement = 0.005;
float amplitude = 30.0;
float amplitudeIncrement = 2.0;

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D); // set window size to 1280 x 720
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

// the function that gets called every frame
void draw()
{
  background(130); // sets the background color of the whole window 
  
  //circle(0, 0, 15); // draws a circle at x,y with thickness
  
  //strokeWeight(2); // changes the thickness of the line below it 
  //color white = color(255, 255, 255); // declare a color variable
  //fill(white); // fills it with the color selected
  //stroke(white); // all the strokes will be the color selected
  //line(-75, -75, 75, 75); // draws a line x1, y1, x2, y2
  
  drawCartesianPlane();
  //drawLinearFunction();
  //drawQuadraticFunction();
  //drawCircle();
  
  passTime(1); // increment time variable every N frames

    // Quiz 1.1
  drawFunction1();
  
    // Quiz 1.2
  drawFunction2();
  
    // Quiz 1.3
  drawFunction3(frequency, amplitude);
    // arrow key up/down / left/right to change frequency & amplitude

}

void drawCartesianPlane()
{
  strokeWeight(1);
  color grey = color(94);
  fill(grey);
  stroke(grey);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i+= 10)
  {
    line(i, -5, i, 5);
    line(-5, i, 5, i);
  }
  
}

void passTime(int nFrames) // tick the time variable every N frames
{
  framesPassed += 1;
  
  if (framesPassed % nFrames == 0)
  {
    timeVariable += 1;
  }
  
}

void drawFunction1() // #1
{
  /*
  * f(x) = x^2 - 15x - 3 (yellow color)
  */
  
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  noStroke();
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x * 10, (float)Math.pow(x, 2) - (15 * x) - 3 , 5);
  }
  
}

void drawFunction2() // #2
{
  /*
  * f(x) = -5x + 30 (purple color)
  */
  
  color purple = color(255, 0, 255);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, (-5*x) + 30, 5);
  }
  
}

void drawFunction3(float frequency, float amplitude) // #3
{
  color blue = color(0, 0, 255);
  fill(blue);
  stroke(blue);
  
  for (float x = -300; x <= 300; x+=0.1)
  {
    circle(x, (float)Math.sin( (x + timeVariable) * frequency) * amplitude , 5);
  }

}

void keyPressed()
{
  if(keyPressed)
  {
    // modify amplitude
    if (keyCode == UP)
    {
      amplitude += amplitudeIncrement;
    }
    if (keyCode == DOWN)
    {
      amplitude -= amplitudeIncrement;
    }
    
    // modify frequency
    if (keyCode == LEFT)
    {
      frequency += frequencyIncrement;
    }
    if (keyCode == RIGHT)
    {
      frequency -= frequencyIncrement;
    }
  
  }
}

//void drawLinearFunction()
//{
//  /*
//    f(x) = x + 2
//    Let x be 4, then y = 6    (4, 6);
//    Let x be -5, then y = -3  (-5, -3);
//  */
  
//  color red = color(255, 0, 0);
//  fill(red);
//  noStroke();
  
//  for (int x = -200; x <= 200; x++)
//  {
//    circle(x, x + 2, 5);
//  }
  
//}

//void drawQuadraticFunction()
//{
//  /*
//  * f(x) = x^2 + 2x - 5;
//  * Let x be 2, then y = 3
//  * Let x be -1, then y = -6
//  */
  
//  color green = color(0, 255, 0);
//  fill(green);
//  stroke(green);
//  noStroke();
//  for (float x = -300; x <= 300; x += 0.1f)
//  {
//    circle(x * 10, (float)Math.pow(x, 2) + (2 * x) - 5 , 5);
//  }
  
//}

//void drawCircle()
//{
//  color yellow = color(255, 255, 0);
//  fill(yellow);
//  stroke(yellow);
//  float radius = 50;
  
//  for (int x = 0; x <= 360; x++)
//  {
//    circle( (float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
//  }
  
//}
