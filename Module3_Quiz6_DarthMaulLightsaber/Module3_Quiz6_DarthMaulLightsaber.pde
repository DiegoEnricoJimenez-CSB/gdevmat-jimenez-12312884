void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void drawLightsaber(PVector direction)
{
  // outer glow
  strokeWeight(10);
  stroke(255, 0, 0);
  
  PVector lightsaberMag = direction.normalize().mult(400);
  println(lightsaberMag.mag());

  line(0, 0, direction.x, direction.y);
  
  
  // inner glow
  strokeWeight(5);
  stroke(255, 255, 255);
  
  line(0, 0, direction.x, direction.y);
  
  
  // handle
  strokeWeight(10);
  stroke(0, 0, 0);
  
  direction.normalize().mult(100);
  line(0, 0, direction.x, direction.y);
}

void draw()
{
  background(130);
  
  PVector mouse = mousePos();
  
  drawLightsaber(mouse);
  drawLightsaber( mouse.mult(-1) ); // opposite direction lightsber
  
}
