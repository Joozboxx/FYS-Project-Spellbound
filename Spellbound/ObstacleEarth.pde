class ObstacleEarth {

  float xearth, yearth, xSize, ySize, speed, speedMultiplier, speedcap, maxSpawnPosition, minSpawnPosition,screenShakeTimer;
  // Makes the basic elements come first
  int maxObstacle = 3;
  // Decides the color of the particles
  boolean yellowparticles = false;
  PImage earth = loadImage("elementearth.png");
  // Reduces the cooldown time by a certain ammount
  float cooldowndecrease = 5;

  ObstacleEarth() {
    maxSpawnPosition=450;
    minSpawnPosition =20;
    xearth = width+xSize;                
    yearth = random(minSpawnPosition, (height-maxSpawnPosition));
    xSize = 65;
    ySize = 400;
    speed = 10;
    // Speed multiplier after you hit an obstacle
    speedMultiplier = 1.02;
    // Speed cap for what the maximum speed is
    speedcap=32;
  }

  void draw() {
    // Draws the obstacle
    image(earth, xearth, yearth, xSize, ySize);
  }

  void update() {
    // Makes the obstacle move
    xearth -= speed; 
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
    if (BoolObs.earth == false) {
      xearth=width+xSize;
      yearth=random(minSpawnPosition, (height-maxSpawnPosition));
    }
  }

  // Particle effect when obstacle gets destroyed
  void particlefx() {
    // For loop which decides how many particles will spawn on screen
     float particleAmount = 20;
    float particleStartLocation = 200;
    float particleSize =20;
    for (int i = 0; i < particleAmount; i++) {
      // Particles( X position, Y position, particles going right, (particles going verticle/how much it spreads)-which direction it goes(higher or lower), size)
      particles.add(new Particle(xearth, yearth+particleStartLocation, random(10) - 5, random(30)-10, particleSize));
    }
  }

  void borderHit() {
    // If the obstacle hits the border: do this
    if (xearth + xSize < 0 ) {
      xearth = width+xSize;
      yearth = random(minSpawnPosition, (height-maxSpawnPosition));

      // Accelerates obstacle speed everytime the edge of screen gets hit
      speed *=speedMultiplier;
      EnemyFire.speed *=speedMultiplier;
      EnemyWater.speed *= speedMultiplier;
      EnemyLife.speed *= speedMultiplier;
      EnemyWall.speed *= speedMultiplier;

      // Integer which will be able to switch the cases
      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.life = true;
        BoolObs.earth = false;

        break;
      case 1:
        BoolObs.fire = true;
        BoolObs.earth = false;

        break;
      case 2:
        BoolObs.water = true;
        BoolObs.earth = false;

        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.earth = false;

        break;
      }
    }
  }

  // COLLISION WITH EARTHBULLET
  void bulletHit() {

    for (int i = 0; i < earthBullets.size(); i++) {
      // Will check the if there are more than 0 bullets in the game
      if (earthBullets.size()>0) {
        BulletEarth b = earthBullets.get(i);

        // This is the collision check for when a bullet hits an obstacle. if collision is true: do this
        if ((b.bulletX+b.sizeX)> xearth && (b.bulletY+b.sizeY)>yearth && (b.bulletY-b.sizeY)<(yearth+ySize)) {

          // Removes the bullet
          earthBullets.remove(i);
          // Adds a point to your score
          points++;
          // Boolean which activates the right color for the particles: yellow

          EnemyWater.blueparticles = false;
          EnemyFire.redparticles = false;
          EnemyLife.greenparticles = false;
          yellowparticles = true;
          // Calls void of particles
          particlefx();
          // Decides the duration of the screen shake
          screenShakeTimer = 1.3;
          // Reduces the cooldown
          myPlayer.bulletCooldown-=cooldowndecrease;

          // Speed of all obstacles get increased when destroyed
          speed *= speedMultiplier;
          EnemyFire.speed *=speedMultiplier;
          EnemyWater.speed *= speedMultiplier;
          EnemyLife.speed *= speedMultiplier;
          EnemyWall.speed *= speedMultiplier;
          myPlayer.playerSpeed *= speedMultiplier;

          // Integer which will be able to switch the cases
          int elementType = (int)random(0, maxObstacle);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            BoolObs.life = true;
            BoolObs.earth = false;

            break;
          case 1:
            BoolObs.fire = true;
            BoolObs.earth = false;

            break;
          case 2:
            BoolObs.water = true;
            BoolObs.earth = false;

            break;
          case 3:
            BoolObs.wall = true;
            BoolObs.earth = false;

            break;
          }
        }
      }
    }
  }

  void collisionplayer() {
    // Checks if the player hits the obstacle earth
    if ((myPlayer.xPlayer + myPlayer.PlayerSizeW >= EnemyEarth.xearth)
      &&(myPlayer.xPlayer <= EnemyEarth.xearth + EnemyEarth.xSize)
      &&(myPlayer.yPlayer+myPlayer.PlayerSizeH >= EnemyEarth.yearth)
      &&(myPlayer.yPlayer<=EnemyEarth.yearth + EnemyEarth.ySize))
    {

      // Integer which will be able to switch the cases
      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.life = true;
        BoolObs.earth = false;

        break;
      case 1:
        BoolObs.fire = true;
        BoolObs.earth = false;

        break;
      case 2:
        BoolObs.water = true;
        BoolObs.earth = false;

        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.earth = false;

        break;
      }
      // Removes one heart which represents your life
      Lives.lifeCount--;
    }
  }
}
