Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker walkers[] = new Walker[10];
//Walker myWalker = new Walker();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < 10; i++)
  {
    walkers[i] = new Walker();
    float posX = 2 * (Window.w / 10) * (i - (10 / 2));
    walkers[i].walkerColor = color( random(0,256), random(0,256), random(0,256) , 255 ); // random colors
    
    walkers[i].mass = 10 - i; // increasing mass
    walkers[i].scale = 10 + walkers[i].mass * 10; // increasing scale
    
    walkers[i].position = new PVector(posX, 300); // initial position to the top
  }

}

void draw()
{
  background(255); 
  ocean.render();
  
  float c = 0.1f;
  float normal = 1;
  float frictionMagnitude = c * normal;
  
  for (Walker myWalker : walkers)
  {
    noStroke();
    myWalker.render();
    myWalker.update();
    
    
      // apply gravity
    PVector gravity = new PVector(0, -0.15 * myWalker.mass);
    myWalker.applyForce(gravity); // applying gravity to our Walker
      // apply gravity
      
      
      // apply friction to our Walker
    PVector friction = myWalker.velocity.copy();
    // F = -uNv
    myWalker.applyForce(
      friction.mult(-1).normalize().mult(frictionMagnitude)
      );
      // applying friction to our Walker
    
    
      // bounce on edges
    if (myWalker.position.y <= Window.bottom)
    {
      myWalker.position.y = Window.bottom;
      myWalker.velocity.y *= -1;
    }
    if (myWalker.position.x >= Window.right)
    {
      myWalker.position.x = Window.right;
      myWalker.velocity.x *= -1;
    }
      // bounce on edges
    
    
      // applying drag force
    if (ocean.isCollidingWith(myWalker))
    {
      PVector dragForce = ocean.calculateDragForce(myWalker);
      myWalker.applyForce(dragForce);
    }
    else // apply wind only outside water
    {
        // apply wind
      PVector wind = new PVector(0.1, 0);
      myWalker.applyForce(wind); // applying wind to our Walker
        // apply wind
    }
      // applying drag force
  }
}
