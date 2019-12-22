class ObstacleWall {

  float xwall, ywall, xSize, ySize, speed, speedx;
  PImage wall = loadImage("elementWALL.png");

  ObstacleWall() {
    xwall =width+width/2;                
    ywall = random(0, (height-500));
    xSize = 65;
    ySize = 400;
    speed = 12;
    speedx = 1.05;
  }

  void draw() {
    fill(255, 0, 0);
    image(wall, xwall, ywall, xSize, ySize);
  }

  void update() {
    xwall -= speed; 

    if (xwall + xSize <0) {
      xwall = width;
      ywall = random(20, height-500);
      
      //speed of all obstacles get increased when passed the border
      speed *=speedx; 
      EnemyEarth.speed *=speedx;
      EnemyWater.speed *= speedx;
      EnemyFire.speed *= speedx;
      EnemyLife.speed *= speedx;

      int elementType = (int)random(0, 4);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.fire = true;
        BoolObs.wall = false;
        println("fire");
        break;
      case 1:
        BoolObs.water = true;
        BoolObs.wall = false;
        println("water");
        break;
      case 2:
        BoolObs.earth = true;
        BoolObs.wall = false;
        println("life");
        break;
        case 3:
        BoolObs.life = true;
        BoolObs.wall = false;
        println("life");
        break;
      }
    }

    if (speed >= 30) {
      speed = 30;
    }
  }
}
