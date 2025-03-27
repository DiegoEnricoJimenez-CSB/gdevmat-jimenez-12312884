int framesPassed = 0;

Walker blackhole = new Walker();
Walker[] otherMatter = new Walker[0];

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
    
    // instantiate blackhole
  blackhole.randomizePosition();
  blackhole.scale = 50;
  blackhole.color_R = 255;
  blackhole.color_G = 255;
  blackhole.color_B = 255;
  blackhole.speed = 5;

    // instantiate attractable objects
  for (int i = 0; i < 100; i++)
  {
    Walker matter = new Walker();
    matter.randomizePosition();
    matter.randomizeScale();
    matter.randomizeColor();
    
    otherMatter = (Walker[]) append (otherMatter, matter); // add instantiated Walker to the array
  }
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(0); // flush screen every new frame

    // randomize everything again every N frames
  if (framesPassed >= 90)
  {
    blackhole.randomizePosition();
    
    for (Walker matter : otherMatter)
    {
      matter.randomizePosition();
      matter.randomizeScale();
      matter.randomizeColor();
    }
    
    framesPassed = 0;
  }
    // randomize everything again every N frames
  
  
  blackhole.moveToPosition(mousePos()); // blackhole follows the mouse
    
    // otherMatter follows the blackhole
  for (Walker matter : otherMatter)
  {      
    matter.moveToPosition(blackhole.position);
    matter.render();
    
    blackhole.render(); // we render blackhole last
  }
    // otherMatter follows the blackhole

  framesPassed++; // increment frame counter
  println(framesPassed);
}
