class ObstacleEarth {

  float xearth, yearth, xSize, ySize, speed;
  PImage earth = loadImage("elementearth.png");
  
  ObstacleEarth() {
    xearth = width;                
    yearth = random(20, height-500);
    xSize = 65;
    ySize = 400;
    speed = 15;
  }

  void draw() {
    fill(255, 0, 0);
    image(earth, xearth, yearth, xSize, ySize);
  }

  void update() {
    xearth -= speed; 

    if (xearth + xSize < 0) {
      xearth = width;
      yearth = random(20, height-500);
      speed *=1.05;
      ArrayObs.earth = false;  
      ArrayObs.water = true;
    }

    if (speed >= 35) {
      speed = 35;
    }
  }
}
