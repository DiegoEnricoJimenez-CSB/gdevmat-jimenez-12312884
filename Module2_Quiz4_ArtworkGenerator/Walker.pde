public class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  
  public float scale;
  public float t_scale = 5150;
  
  public float t_r = 100;
  public float t_g = 200;
  public float t_b = 300;
  
  void render()
  {
    circle(x, y, scale);
  }
  
  void perlinWalk() // Quiz4 #1
  {
    x = map(noise(tx), 0, 1, -width/2, width/2);
    y = map(noise(ty), 0, 1, -height/2, height/2);
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
  void perlinScale() // Quiz4 #2
  {
    scale = map(noise(t_scale), 0, 1, 5, 150); // scale between 5-150
    
    t_scale += 0.01f;
  }
  
  void perlinColor() // Quiz4 #3
  {
    fill(
      map(noise(t_r), 0, 1, 0, 255),
      map(noise(t_g), 0, 1, 0, 255),
      map(noise(t_b), 0, 1, 0, 255),
      255
    );
    
    t_r += 0.01f;
    t_g += 0.01f;
    t_b += 0.01f;
  }
  
}
