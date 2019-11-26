class ObstacleLife {

  float xlife, ylife, xSize, ySize, speed;
  PImage life = loadImage("elementlife.png");
  
  ObstacleLife() {
    xlife = width;                
    ylife = random(20, height-500);
    xSize = 65;
    ySize = 400;
    speed = 15;
  }

  void draw() {
    fill(255, 0, 0);
    image(life, xlife, ylife, xSize, ySize);
  }

  void update() {
    xlife -= speed; 

    if (xlife + xSize <0) {
      xlife = width;
      ylife = random(20, height-500);
      speed *=1.05; 
      ArrayObs.life = false;
      ArrayObs.fire = true;
    }

    if (speed >= 35) {
      speed = 35;
    }
  }
}
