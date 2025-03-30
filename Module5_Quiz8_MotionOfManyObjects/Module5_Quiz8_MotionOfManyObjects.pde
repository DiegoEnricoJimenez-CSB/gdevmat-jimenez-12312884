Walker[] walkers = new Walker[0];
PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < 10; i++)
  {
    Walker walker = new Walker();
    walker.mass = i+1; // mass value from 1 to 10
    walker.scale = walker.mass * 15; // scale of mass * 15
    walker.walkerColor = color(random(0,256), random(0,256), random(0,256) , 255); // random color
    walker.position = new PVector(-500,200); // all start at -500,200
    
    walkers = (Walker[]) append (walkers, walker); // add instantiated Walker to the array
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
