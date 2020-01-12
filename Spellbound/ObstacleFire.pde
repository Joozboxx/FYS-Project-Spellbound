class ObstacleFire {

  float xfire, yfire, xSize, ySize, speed, speedx, speedcap, screenShakeTimer;
  // Makes the basic elements come first
  int maxObstacle = 3;
  boolean redparticles = false;
  PImage fire = loadImage("elementfire.png");

  ObstacleFire() {
    xfire = width+xSize;
    yfire = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 10;
    // Speed multiplier after you hit an obstacle
    speedx = 1.02;
    // Speed cap for what the maximum speed is
    speedcap=32;
  }

  void draw() {
    image(fire, xfire, yfire, xSize, ySize);
  }

  void update() {
    xfire -= speed; 
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
    if (BoolObs.fire == false) {
      xfire=width+xSize;
      yfire=random(20, (height-450));
    }
  }

  // Particle effect when obstacle gets destroyed
  void particlefx() {
    for (int i = 0; i < 20; i++) {
      particles.add(new Particle(xfire, yfire+200, random(10) - 5, random(30)-10, 20));
    }
  }

  void borderHit() {
    if (xfire + xSize < 0 ) {
      xfire = width+xSize;
      yfire = random(20, (height-450));

      // Accelerates obstacle speed everytime the edge of screen gets hit
      speed *=1.15;
      EnemyEarth.speed *=speedx;
      EnemyWater.speed *= speedx;
      EnemyLife.speed *= speedx;
      EnemyWall.speed *= speedx;

      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.life = true;
        BoolObs.fire = false;
        println("fire");
        break;
      case 1:
        BoolObs.earth = true;
        BoolObs.fire = false;
        println("water");
        break;
      case 2:
        BoolObs.water = true;
        BoolObs.fire = false;
        println("life");
        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.fire = false;
        println("wall");
        break;
      }
    }
  }

  void bulletHit() {
    // COLLISION WITH FIREBULLET
    for (int i = 0; i < fireBullets.size(); i++) {
      // Checks if there is collision when there are more than 0 bullets ingame
      if (fireBullets.size()>0) {
        BulletFire b = fireBullets.get(i);

        // Uses the values 
        if ((b.bulletX+b.sizeX)> xfire && (b.bulletY+b.sizeY)>yfire && (b.bulletY-b.sizeY)<(yfire+ySize)) {

          fireBullets.remove(i);
          points++;
          // Boolean which activates the right color for the particles: red

          EnemyWater.blueparticles = false;
          EnemyLife.greenparticles = false;
          EnemyEarth.yellowparticles = false;
          redparticles = true;
          // Calls void of particles
          particlefx();

          screenShakeTimer = 1.3;

          // Speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyEarth.speed *=speedx;
          EnemyWater.speed *= speedx;
          EnemyLife.speed *= speedx;
          EnemyWall.speed *= speedx;
          myPlayer.playerSpeed *= speedx;

          int elementType = (int)random(0, maxObstacle);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            BoolObs.life = true;
            BoolObs.fire = false;
            println("fire");
            break;
          case 1:
            BoolObs.earth = true;
            BoolObs.fire = false;
            println("water");
            break;
          case 2:
            BoolObs.water = true;
            BoolObs.fire = false;
            println("life");
            break;
          case 3:
            BoolObs.wall = true;
            BoolObs.fire = false;
            println("wall");
            break;
          }
        }
      }
    }
  }

  void collisionplayer() {
    // Checks if the player hits the obstacle
    if ((myPlayer.xPlayer + myPlayer.PlayerSizeW >= EnemyFire.xfire)
      &&(myPlayer.xPlayer <= EnemyFire.xfire + EnemyFire.xSize)
      &&(myPlayer.yPlayer+myPlayer.PlayerSizeH >= EnemyFire.yfire )
      &&(myPlayer.yPlayer<=EnemyFire.yfire + EnemyFire.ySize))
    {
      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.life = true;
        BoolObs.fire = false;
        println("fire");
        break;
      case 1:
        BoolObs.earth = true;
        BoolObs.fire = false;
        println("water");
        break;
      case 2:
        BoolObs.water = true;
        BoolObs.fire = false;
        println("life");
        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.fire = false;
        println("wall");
        break;
      }
      // Removes one heart which represents your life
      Lives.lifeCount--;
    }
  }
}
