class ObstacleWater {

  float xwater, ywater, xSize, ySize, speed, speedx, speedcap, screenShakeTimer, yspawn;
  // Makes the basic elements come first
  int maxObstacle = 3;
  // Decides the color of the particles
  boolean blueparticles = false;
  PImage water = loadImage("elementwater.png");
  // Reduces the cooldown time by a certain ammount
  float cooldowndecrease = 5;

  ObstacleWater() {
    yspawn = 450;
    xwater = width+width/2;
    ywater = random(20, (height-yspawn));
    xSize = 65;
    ySize = 400;
    speed = 10;
    // Speed multiplier after you hit an obstacle
    speedx = 1.03;
    // Speed cap for what the maximum speed is
    speedcap=32;
  }

  // Draws the obstacle
  void draw() {
    image(water, xwater, ywater, xSize, ySize);
  }

  void update() {
    // Makes the obstacle move
    xwater -= speed;
    // After you receive 10 points, another obstacle will be available to spawn; the wall obstacle
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
      ywater=random(20, (height-yspawn));
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
    // If the obstacle hits the border: do this
    if (xwater + xSize < 0 ) {
      xwater = width+xSize;
      ywater = random(20, (height-yspawn));

      // Accelerates obstacle speed everytime the edge of screen gets hit
      speed *=speedx;
      EnemyEarth.speed *=speedx;
      EnemyLife.speed *= speedx;
      EnemyFire.speed *= speedx;
      EnemyWall.speed *= speedx;

      // Integer which will be able to switch the cases
      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.fire = true;
        BoolObs.water = false;
        break;
      case 1:
        BoolObs.earth = true;
        BoolObs.water = false;
        break;
      case 2:
        BoolObs.life = true;
        BoolObs.water = false;
        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.water = false;
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

        // This is the collision check for when a bullet hits an obstacle. if collision is true: do this
        if ((b.bulletX+b.sizeX)> xwater && (b.bulletY+b.sizeY)>ywater && (b.bulletY-b.sizeY)<(ywater+ySize)) {
          // Removes the bullet
          waterBullets.remove(i);
          // Adds a point to your score
          points++;

          // Boolean which activates the right color for the particles: blue

          EnemyLife.greenparticles = false;
          EnemyFire.redparticles = false;
          EnemyEarth.yellowparticles = false;
          blueparticles=true;
          // Calls void of particles
          particlefx();
          // Decides the duration of the screen shake
          screenShakeTimer = 1.3;
          // Reduces the cooldown
          myPlayer.bulletCooldown-=cooldowndecrease;

          // Speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyEarth.speed *=speedx;
          EnemyLife.speed *= speedx;
          EnemyFire.speed *= speedx;
          EnemyWall.speed *= speedx;
          myPlayer.playerSpeed *= speedx;


          // Integer which will be able to switch the cases
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
    // Checks if the player hits the obstacle water
    if ((myPlayer.xPlayer + myPlayer.PlayerSizeW >= EnemyWater.xwater)
      &&(myPlayer.xPlayer <= EnemyWater.xwater + EnemyWater.xSize)
      &&(myPlayer.yPlayer+myPlayer.PlayerSizeH >= EnemyWater.ywater)
      &&(myPlayer.yPlayer<=EnemyWater.ywater + EnemyWater.ySize))
    {

      // Integer which will be able to switch the cases
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
      // Removes one heart which represents your life
      Lives.lifeCount--;
    }
  }
}
