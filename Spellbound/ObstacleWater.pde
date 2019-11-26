class ObstacleWater {

  float xwater, ywater, xSize, ySize, speed;
  PImage water = loadImage("elementwater.png");
  
  ObstacleWater() {
    xwater = width;
    ywater = random(20, height-500);
    xSize = 65;
    ySize = 400;
    speed = 15;
  }

  void draw() {
    fill(255, 0, 0);
    image(water, xwater, ywater, xSize, ySize);
  }

  void update() {
    xwater -= speed; 

    if (xwater + xSize < 0 ) {
      xwater = width;
      ywater = random(20, height-500);
      speed *=1.05;
      ArrayObs.water = false;
      ArrayObs.life = true;
    }

    if (speed >= 35) {
      speed = 35;
    }
  }
}
