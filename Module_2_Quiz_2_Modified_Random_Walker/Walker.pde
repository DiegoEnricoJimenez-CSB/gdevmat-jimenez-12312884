class Walker
{
  float x;
  float y;
  float step = 10;
  
  void render()
  {
    circle(x, y, 30);
  }
  
  void randomWalk() // Quiz2 #1
  {
    int rng = int(random(8)); // generate 0-7
    
    if (rng == 0) // up
    {
      y += step;
      
    }
    else if (rng == 1) // up + right
    {
      y += step;
      x += step;
    }
    else if (rng == 2) // right
    {
      x += step;
      
    }
    else if (rng == 3) // right + down
    {
      x += step;
      y -= step;
    }
    else if (rng == 4) // down
    {
      y -= step;
      
    }
    else if (rng == 5) // down + left
    {
      y -= step;
      x -= step;
    }
    else if (rng == 6) // left
    {
      x -= step;
      
    }
    else if (rng == 7) // left + up
    {
      x -= step;
      y += step;
    }
    
  }
  
  void randomWalkBiased() // Quiz2 #2
  {
    int rng = int(random(100)) + 1; // generate 1-100 (the +1 for readability)
    
    if (rng <= 40) // right
    {
      x += step;
        
    }
    else if (rng <= 60) // left
    {
      x -= step;
      
    }
    else if (rng <= 80) // up
    {
      y += step;
      
    }
    else if (rng <= 96) // down
    {
      y -= step;
      
    }
    
    else if (rng <= 97) // right + up
    {
      x += step;
      y += step;
    }
    else if (rng <= 98) // right + down
    {
      x += step;
      y -= step;
    }
    else if (rng <= 99) // left + up
    {
      x -= step;
      y += step;
    }
    else if (rng <= 100) // down + left
    {
      y -= step;
      x -= step;
    }

  }
  
  void randomizeColor() // Quiz2 #3
  {
    fill(
      int(random(256)), // R: 0-255
      int(random(256)), // G: 0-255
      int(random(256)), // B: 0-255
      50 + int(random(51)) // Alpha: 50-100
      );
      
  }
  
}
