public class Walker
{
  public PVector position = new PVector();
  public float scale = 15;
  public float speed = 10;
  
  public float color_R = 0;
  public float color_G = 0;
  public float color_B = 0;
  public float color_A = 255;
  
  public Walker(){}
    
  public void randomizePosition()
  {
    float gaussian = randomGaussian();
    
    float standardDeviation_x = width / 4;
    float standardDeviation_y = height / 4;

    float mean = 0;
    
    position.x = constrain(
      standardDeviation_x * gaussian + mean , 
      -width/2, width/2); // bound x between left & right screen
      
    gaussian = randomGaussian(); // reroll gaussian
      
    position.y = constrain(
      standardDeviation_y * gaussian + mean , 
      -height/2, height/2); // bound y between top & bottom screen
  }
  
  public void randomizeScale()
  {
    float gaussian = randomGaussian();
    float standardDeviation = 10;
    float mean = 5;
    scale = standardDeviation * gaussian + mean;
  }
  
  public void randomizeColor()
  {
    color_R = random(0,256); // RGB: 0-255
    color_G = random(0,256);
    color_B = random(0,256); 
    color_A = random(100,201); // Alpha: 100-200
  }
    
  public void moveToPosition(PVector target)
  {
    // add speed to the current position
    //PVector movement = target.normalize().mult(speed);
    
    PVector movement = PVector.sub(target, this.position).normalize().mult(speed); // normalize then mult() to move at set speed
    position.add(movement);
  }
  
  public void render()
  {
    noStroke();
    fill(
      color_R,
      color_G,
      color_B,
      color_A
    );
    circle(position.x, position.y, scale);
  }
}
