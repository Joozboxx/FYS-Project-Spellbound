class ObstacleWater {

  float xwater, ywater, xSize, ySize, speed, speedx, speedcap, screenShakeTimer;
  // Makes the basic elements come first
  int maxObstacle = 3;
  boolean blueparticles = false;
  PImage water = loadImage("elementwater.png");

  ObstacleWater() {
    xwater = width+width/2;
    ywater = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 10;
    speedx = 1.03;
    speedcap=32;
  }

  // Draws the obstacle
  void draw() {
    image(water, xwater, ywater, xSize, ySize);
  }

  void update() {
    xwater -= speed;

    if (points >= 10) {
      maxObstacle = 4;
    }

    // Speed cap for obstacle
    if (speed >= speedcap) {
      speed = speedcap;
    }

    // Calls void for when obstacle hits border of screen
    borderHit();
    // Calls void when correct bullet hits obstacle
    bulletHit();
    // Calls void for when player gets hit
    collisionplayer();

    // What happens when the obstacle gets destroyed
    if (BoolObs.water == false) {
      xwater=width+xSize;
      ywater=random(20, (height-450));
    }
  }

  // Particle effect when obstacle gets destroyed
  void particlefx() {

    for (int i = 0; i < 20; i++) {
      // Particles( X position, Y position, particles going right, (particles going verticle/how much it spreads)-which direction it goes(higher or lower), size)
      particles.add(new Particle(xwater, ywater+200, random(10) - 5, random(30)-10, 20));
    }
  }

  void borderHit() {
    if (xwater + xSize < 0 ) {
      xwater = width+xSize;
      ywater = random(20, (height-450));

      // Accelerates obstacle speed everytime the edge of screen gets hit
      speed *=1.15;
      EnemyEarth.speed *=speedx;
      EnemyLife.speed *= speedx;
      EnemyFire.speed *= speedx;
      EnemyWall.speed *= speedx;

      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.fire = true;
        BoolObs.water = false;
        println("fire");
        break;
      case 1:
        BoolObs.earth = true;
        BoolObs.water = false;
        println("water");
        break;
      case 2:
        BoolObs.life = true;
        BoolObs.water = false;
        println("life");
        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.water = false;
        println("wall");
        break;
      }
    }
  }

  // Collision with Waterbullet
  void bulletHit() {

    for (int i = 0; i < waterBullets.size(); i++) {
      // Ensures a collision check as long as there is more than 0 bullets in the game
      if (waterBullets.size()>0) {
        BulletWater b = waterBullets.get(i);

        // Collision check for bullet vs correct obstacle
        if ((b.bulletX+b.sizeX)> xwater && (b.bulletY+b.sizeY)>ywater && (b.bulletY-b.sizeY)<(ywater+ySize)) {

          waterBullets.remove(i);
          points++;

          // Boolean which activates the right color for the particles: blue

          EnemyLife.greenparticles = false;
          EnemyFire.redparticles = false;
          EnemyEarth.yellowparticles = false;
          blueparticles=true;
          // Calls void of particles
          particlefx();
          
          screenShakeTimer = 1.3;
          
          // Speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyEarth.speed *=speedx;
          EnemyLife.speed *= speedx;
          EnemyFire.speed *= speedx;
          EnemyWall.speed *= speedx;
          myPlayer.playerSpeed *= speedx;

          int elementType = (int)random(0, maxObstacle);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            BoolObs.water = false;
            BoolObs.fire = true;
            break;
          case 1:
            BoolObs.water = false;
            BoolObs.earth = true;
            break;
          case 2:
            BoolObs.water = false;
            BoolObs.life = true;
            break;
          case 3:
            BoolObs.water = false;
            BoolObs.wall = true;
            break;
          }
        }
      }
    }
  }

  void collisionplayer() {
    // Checks if the player hits the obstacle
    if ((myPlayer.xPlayer + myPlayer.PlayerSizeW >= EnemyWater.xwater)
      &&(myPlayer.xPlayer <= EnemyWater.xwater + EnemyWater.xSize)
      &&(myPlayer.yPlayer+myPlayer.PlayerSizeH >= EnemyWater.ywater)
      &&(myPlayer.yPlayer<=EnemyWater.ywater + EnemyWater.ySize))
    {
      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.water = false;
        BoolObs.fire = true;
        break;
      case 1:
        BoolObs.water = false;
        BoolObs.earth = true;
        break;
      case 2:
        BoolObs.water = false;
        BoolObs.life = true;
        break;
      case 3:
        BoolObs.water = false;
        BoolObs.wall = true;
        break;
      }

      Lives.lifeCount--;
    }
  }
}
