void setup()
{
  size(1020, 720, P3D);
  background(255);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker perlinWalker = new Walker();

void draw()
{
  //fill(0);
  noStroke();
  perlinWalker.render();
  perlinWalker.perlinWalk(); // Quiz4 #1
  perlinWalker.perlinScale(); // Quiz4 #2
  perlinWalker.perlinColor(); // Quiz4 #3
}
