public class Walker
{
  PVector position = new PVector(); // x & y
  PVector speed = new PVector(5, 8);

  void render()
  {
    fill(182, 52, 100);
    circle(position.x, position.y, 50);
  }
  
  void moveAndBounce()
  {
    // add speed to the current position
    position.add(speed);
    
    // conditions for bouncing
    if ( (position.x > Window.right) || (position.x < Window.left) )
    {
      speed.x *= -1;
    }
    if ( (position.y > Window.top) || (position.y < Window.bottom) )
    {
      speed.y *= -1;
    }
    
  }
  
  
}
