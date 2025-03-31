Walker walkers[] = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  int posY = 0;
  for (int i = 0; i < 8; i++)
  {
    walkers[i] = new Walker();
    
    posY = 2 * (Window.h / 8) * (i - (8 / 2)); // posY = 2 (Window Height / number of walkers)  * (n - (number of walkers / 2))
    walkers[i].walkerColor = color( random(0,256), random(0,256), random(0,256) , random(150,256) ); // random colors
    
    walkers[i].mass = 10 - i; // increasing mass
    walkers[i].scale = walkers[i].mass * 10; // increasing scale

    walkers[i].position = new PVector(-500, posY); // initial position to the left
  }
  
}

void draw()
{
  background(255);
  
  for (Walker w : walkers)
  {
    noStroke();
    
      // apply friction
    // Friction = -1 * mew * N * v
    float mew = 0.01f; // coefficient of friction
    if (w.position.x >= 0) mew = 0.4f; // when the walker goes beyond the middle of the screen, make the coefficient value 0.4f
    float normal = 1;
    float frictionMagnitude = mew * normal;
    
    PVector friction = w.velocity.copy(); // copy copies the velocity of our walker
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    
    w.applyForce(friction); // Apply the friction in the beginning, not when it just hits the midpoint
      // apply friction
    
    
      // apply forward force
    //PVector gravity = new PVector(0, -0.15 * w.mass);
    PVector forwardAcceleration = new PVector(0.2, 0);
    w.update();
    w.render();
    w.applyForce(forwardAcceleration);
      // apply forward force


      // line in the middle
    strokeWeight(5);
    stroke(0,0,0 , 255);
    line(0, Window.top, 0, Window.bottom);
      // line in the middle

    
      // bounce
    if (w.position.x >= Window.right)
    {
      w.position.x = Window.right; // safeguard our position to not overflow toward the outside
      w.velocity.x *= -1;
    }
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
      // bounce
  }
  
}

void mouseClicked() // Reset everything when the mouse is clicked
{
  for (Walker w : walkers)
  {
    w.position.x = -500;
    w.velocity = new PVector(0,0);
  }
}
