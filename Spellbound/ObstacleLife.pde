class ObstacleLife {

  float xlife, ylife, xSize, ySize, speed, speedMultiplier, speedcap, maxSpawnPosition,minSpawnPosition, screenShakeTimer;
  // Makes the basic elements come first
  int maxObstacle = 3;
  boolean greenparticles = false;
  PImage life = loadImage("elementlife.png");
  // Reduces the cooldown time by a certain ammount
  float cooldowndecrease = 5;

  ObstacleLife() {
    maxSpawnPosition=450;
    minSpawnPosition =20;
    xlife =width+xSize;                
    ylife = random(minSpawnPosition, (height-maxSpawnPosition));
    xSize = 65;
    ySize = 400;
    speed = 10;
    // Speed multiplier after you hit an obstacle
    speedMultiplier = 1.02;
    // Speed cap for what the maximum speed is
    speedcap = 32;
  }

  void draw() {
    image(life, xlife, ylife, xSize, ySize);
  }

  void update() {
    xlife -= speed; 
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
    if (BoolObs.life == false) {
      xlife=width+xSize;
      ylife=random(minSpawnPosition, (height-maxSpawnPosition));
    }
  }

  // Particle effect when obstacle gets destroyed
  void particlefx() {
     float particleAmount = 20;
    float particleStartLocation = 200;
    float particleSize =20;
    for (int i = 0; i < particleAmount; i++) {
      // Particles( X position, Y position, particles going right, (particles going verticle/how much it spreads)-which direction it goes(higher or lower), size)
      particles.add(new Particle(xlife, ylife+particleStartLocation, random(10) - 5, random(30)-10, particleSize));
    }
  }

  void borderHit() {
    if (xlife + xSize < 0 ) {
      xlife = width+xSize;
      ylife = random(minSpawnPosition, (height-maxSpawnPosition));

      // accelerates obstacle speed everytime the edge of screen gets hit
      speed *=speedMultiplier;
      EnemyEarth.speed *=speedMultiplier;
      EnemyWater.speed *= speedMultiplier;
      EnemyFire.speed *= speedMultiplier;
      EnemyWall.speed *= speedMultiplier;

      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.fire = true;
        BoolObs.life = false;

        break;
      case 1:
        BoolObs.earth = true;
        BoolObs.life = false;

        break;
      case 2:
        BoolObs.water = true;
        BoolObs.life = false;

        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.life = false;

        break;
      }
    }
  }

  // COLLISION WITH LIFEBULLET
  void bulletHit() {

    for (int i = 0; i < lifeBullets.size(); i++) {
      // Checks if there is collision when there are more than 0 bullets ingame
      if (lifeBullets.size()>0) {
        BulletLife b = lifeBullets.get(i);

        // This is the collision check for when a bullet hits an obstacle. if collision is true: do this
        if ((b.bulletX+b.sizeX)> xlife && (b.bulletY+b.sizeY)>ylife && (b.bulletY-b.sizeY)<(ylife+ySize)) {


          lifeBullets.remove(i);
          points++;

          // Boolean which activates the right color for the particles: green

          EnemyWater.blueparticles = false;
          EnemyFire.redparticles = false;
          EnemyEarth.yellowparticles = false;
          greenparticles = true;

          // Calls void of particles
          particlefx();
          // Decides the duration of the screen shake
          screenShakeTimer = 1.3;
          // Reduces the cooldown
          myPlayer.bulletCooldown-=cooldowndecrease;

          // Speed of all obstacles get increased when destroyed
          speed *= speedMultiplier;
          EnemyEarth.speed *=speedMultiplier;
          EnemyWater.speed *= speedMultiplier;
          EnemyFire.speed *= speedMultiplier;
          EnemyWall.speed *= speedMultiplier;
          myPlayer.playerSpeed *= speedMultiplier;

          int elementType = (int)random(0, maxObstacle);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            BoolObs.fire = true;
            BoolObs.life = false;
            break;
          case 1:
            BoolObs.earth = true;
            BoolObs.life = false;
            break;
          case 2:
            BoolObs.water = true;
            BoolObs.life = false;
            break;
          case 3:
            BoolObs.wall = true;
            BoolObs.life = false;
            break;
          }
        }
      }
    }
  }

  void collisionplayer() {
    // Checks if the player hits the obstacle life
    if ((myPlayer.xPlayer + myPlayer.PlayerSizeW >= EnemyLife.xlife)
      &&(myPlayer.xPlayer <= EnemyLife.xlife + EnemyLife.xSize)
      &&(myPlayer.yPlayer+myPlayer.PlayerSizeH >= EnemyLife.ylife)
      &&(myPlayer.yPlayer<=EnemyLife.ylife + EnemyLife.ySize))
    {
      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.fire = true;
        BoolObs.life = false;

        break;
      case 1:
        BoolObs.earth = true;
        BoolObs.life = false;

        break;
      case 2:
        BoolObs.water = true;
        BoolObs.life = false;

        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.life = false;

        break;
      }
      // Removes one heart which represents your life
      Lives.lifeCount--;
    }
  }
}
