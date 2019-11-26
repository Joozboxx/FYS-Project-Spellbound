class ObstacleFire {

  float xfire, yfire, xSize, ySize, speed;
  PImage fire = loadImage("elementfire.png");
  ObstacleFire() {
    xfire = width;
    yfire = random(20, height-500);
    xSize = 65;
    ySize = 400;
    speed = 15;
  }

  void draw() {
    fill(255, 0, 0);
    image(fire, xfire, yfire, xSize, ySize);
  }

  void update() {
    xfire -= speed; 


    if (xfire < 0) {
      xfire = width+30;
      yfire = random(20, height-500);
      speed *=1.05;
    }

    if (speed >= 35) {
      speed = 35;
    }
  }
}
