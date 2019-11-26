class ObstacleEarth {

  float xearth, yearth, xSize, ySize, speed;
  PImage earth = loadImage("elementearth.png");
  
  ObstacleEarth() {
    xearth = width+300;                
    yearth = height+height;
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

    if (xearth < 0) {
      xearth = width+60;
      yearth = random(50, height-350);
      speed *=1.05;
    }

    if (speed >= 35) {
      speed = 35;
    }
  }
}
