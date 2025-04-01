Walker[] allMatter = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < 10; i++)
  {
    allMatter[i] = new Walker();
    
    allMatter[i].walkerColor = color(random(0,256),random(0,256),random(0,256) , 10); // random color
    allMatter[i].mass = random(5, 11); // random mass
    allMatter[i].scale = allMatter[i].mass * 10; // random scale accdg to mass
    
    // = standardDeviation * gaussian + mean;
    allMatter[i].position.x = (Window.w / 2) * randomGaussian() + 0; // 
    allMatter[i].position.y = (Window.h / 2) * randomGaussian() + 0; // random initial positions
  }
}

void draw()
{
  background(255);
  noStroke();
  
  for (Walker eachMatter : allMatter)
  {
    for (Walker otherMatter : allMatter)
    {
      eachMatter.update();
      eachMatter.render();
      
      //smallMatter.applyForce(bigMatter.calculateAttraction(smallMatter));
      //bigMatter.applyForce(smallMatter.calculateAttraction(bigMatter));
      if (eachMatter != otherMatter) eachMatter.applyForce(otherMatter.calculateAttraction(eachMatter)); // They must all be gravitationally attracted to each other
    }
  }
  
}
