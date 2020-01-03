class ObstacleWall {

  float xwall, ywall, xSize, ySize, speed, speedx;
  PImage wall = loadImage("elementWALL.png");

  ObstacleWall() {
    xwall =width+xSize;                
    ywall = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 12;
    speedx = 1.05;
  }

  void draw() {
    image(wall, xwall, ywall, xSize, ySize);
  }

  void update() {
    xwall -= speed; 

    //speed cap for obstacle
    if (speed >= 25) {
      speed = 25;
    }

    //calls void for when obstacle hits border of screen
    borderHit();
    

    //what happens when the obstacle gets destroyed
    if (BoolObs.wall == false) {
      xwall=width+xSize;
      ywall=random(20, (height-450));
    }
  }




  void borderHit() {
    if (xwall + xSize < 0 ) {
      xwall = width+xSize;
      ywall = random(20, (height-450));

      //accelerates obstacle speed everytime the edge of screen gets hit
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
        break;
      case 1:
        BoolObs.earth = true;
        BoolObs.wall = false;
        break;
      case 2:
        BoolObs.water = true;
        BoolObs.wall = false;
        break;
      case 3:
        BoolObs.life = true;
        BoolObs.wall = false;
        break;
      }
    }
  }


}
