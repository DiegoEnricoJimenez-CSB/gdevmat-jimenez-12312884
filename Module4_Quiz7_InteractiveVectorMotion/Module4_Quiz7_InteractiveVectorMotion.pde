//Walker myWalker = new Walker();
Walker[] walkers = new Walker[0];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //myWalker.acceleration = new PVector(-0.01, 0.1);
  //myWalker.scale = 50;
  
  fill(128);
  
  for (int i = 0; i < 100; i++)
  {
    Walker walker = new Walker();
    walker.randomizePosition();
    walker.randomizeScale();
    
    walkers = (Walker[]) append (walkers, walker); // add instantiated Walker to the array
  }
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

PVector accelerateToMouse(PVector origin)
{
  // Use static PVector. to not affect the variables
  // normalize the difference between mousePos & originalPos
  // multiply the normalize vector by 0.2
  return PVector.sub(mousePos(),origin).normalize().mult(0.2);
}

/* Vector Motion 101
  1. Add velocity to position
  2. Draw the object at position
*/  

void draw()
{
  background(80);
  
  for (Walker walker : walkers)
  {
    walker.acceleration = accelerateToMouse(walker.position);
    walker.update();
    walker.render();
  }
  
  //myWalker.checkEdges();
}
