public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public float velocityLimit = 10;
  public PVector acceleration = new PVector();

  public float mass = 100;

  public float scale = 15;
  public color walkerColor = color(255,255,255 , 255);
  
  public float gravitationalConstant = 1;
  
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
  
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position); // direction
    float distance = force.mag();
    force.normalize(); // normalize to accurately get direction
    
    distance = constrain(distance, 5, 25); // solves divide by 0, and divide by really tiny values
    
    
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
}
