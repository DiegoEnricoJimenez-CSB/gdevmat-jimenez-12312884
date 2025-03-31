public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public float velocityLimit = 10;
  public PVector acceleration = new PVector();

  public float mass = 100;

  public float scale = 15;
  public color walkerColor;
  
  public Walker()
  {
    
  }
  
  // Newton's Second Law of Motion
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }
  
  public void update()
  {
    //this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration); // velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // resets acceleration every frame
  }
  
  public void render()
  {
    fill(walkerColor);
    circle(position.x, position.y, scale);
  }
  
}
