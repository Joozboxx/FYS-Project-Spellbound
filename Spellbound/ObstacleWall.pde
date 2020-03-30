class ObstacleWall {

  float xwall, ywall, xSize, ySize, speed, speedMultiplier, speedcap, maxSpawnPosition,minSpawnPosition;
  PImage wall = loadImage("elementWALL.png");

  ObstacleWall() {
    maxSpawnPosition= 450;
    minSpawnPosition=20;
    xwall =width+xSize;                
    ywall = random(minSpawnPosition, (height-maxSpawnPosition));
    xSize = 65;
    ySize = 400;
    speed = 8;
    // Speed multiplier after you hit an obstacle
    speedMultiplier = 1.02;
    // Speed cap for what the maximum speed is
    speedcap = 30;
  }

  void draw() {
    image(wall, xwall, ywall, xSize, ySize);
  }

  void update() {
    xwall -= speed; 

    // Speed cap for obstacle
    if (speed >= speedcap) {
      speed = speedcap;
    }

    // Calls void for when obstacle hits border of screen
    borderHit();
    // Calls void for when player gets hit
    collisionplayer();

    // What happens when the obstacle gets destroyed
    if (BoolObs.wall == false) {
      xwall=width+xSize;
      ywall=random(minSpawnPosition, (height-maxSpawnPosition));
    }
  }

  void borderHit() {
    if (xwall + xSize < 0 ) {
      xwall = width+xSize;
      ywall = random(minSpawnPosition, (height-maxSpawnPosition));

      // Accelerates obstacle speed everytime the edge of screen gets hit
      speed *=speedMultiplier;
      EnemyEarth.speed *=speedMultiplier;
      EnemyWater.speed *= speedMultiplier;
      EnemyFire.speed *= speedMultiplier;
      EnemyLife.speed *= speedMultiplier;

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

  void collisionplayer() {
    // Checks if the player hits the obstacle wall
    if ((myPlayer.xPlayer + myPlayer.PlayerSizeW >= EnemyWall.xwall)
      &&(myPlayer.xPlayer <= EnemyWall.xwall + EnemyWall.xSize)
      &&(myPlayer.yPlayer+myPlayer.PlayerSizeH >= EnemyWall.ywall)
      &&(myPlayer.yPlayer<=EnemyWall.ywall + EnemyWall.ySize))
    {
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
      // Removes one heart which represents your life
      Lives.lifeCount--;
    }
  }
}
