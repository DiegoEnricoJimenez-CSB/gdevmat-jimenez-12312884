Walker[] walkers = new Walker[10];
PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < 10; i++)
  {
    walkers[i] = new Walker();
    walkers[i].mass = i+1; // mass value from 1 to 10
    walkers[i].scale = walkers[i].mass * 15; // scale of mass * 15
    walkers[i].walkerColor = color(random(0,256), random(0,256), random(0,256) , 255); // random color
    walkers[i].position = new PVector(-500,200); // all start at -500,200    
  }
}

void draw()
{
  background(80);
  
  for (Walker eachWalker : walkers)
  {
    eachWalker.render();
    eachWalker.update();
    eachWalker.applyForce(wind);
    eachWalker.applyForce(gravity);
    eachWalker.bounceOnEdges();
  }

}
