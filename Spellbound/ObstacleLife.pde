class ObstacleLife {

  float xlife, ylife, xSize, ySize, speed, speedx,speedcap, screenShakeTimer;
  // Makes the basic elements come first
  int maxObstacle = 3;
  boolean greenparticles = false;
  PImage life = loadImage("elementlife.png");

  ObstacleLife() {
    xlife =width+xSize;                
    ylife = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 10;
    speedx = 1.02;
    speedcap = 32;
  }

  void draw() {
    image(life, xlife, ylife, xSize, ySize);
  }

  void update() {
    xlife -= speed; 

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
      ylife=random(20, (height-450));
    }
  }

  // Particle effect when obstacle gets destroyed
  void particlefx() {
    for (int i = 0; i < 20; i++) {
      particles.add(new Particle(xlife, ylife+200, random(10) - 5, random(30)-10, 20));
    }
  }



  void borderHit() {
    if (xlife + xSize < 0 ) {
      xlife = width+xSize;
      ylife = random(20, (height-450));

      // accelerates obstacle speed everytime the edge of screen gets hit
      speed *=1.15;
      EnemyEarth.speed *=speedx;
      EnemyWater.speed *= speedx;
      EnemyFire.speed *= speedx;
      EnemyWall.speed *= speedx;

      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.fire = true;
        BoolObs.life = false;
        println("fire");
        break;
      case 1:
        BoolObs.earth = true;
        BoolObs.life = false;
        println("water");
        break;
      case 2:
        BoolObs.water = true;
        BoolObs.life = false;
        println("life");
        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.life = false;
        println("wall");
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

        // Uses the values 
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

          screenShakeTimer = 1.3;

          // Speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyEarth.speed *=speedx;
          EnemyWater.speed *= speedx;
          EnemyFire.speed *= speedx;
          EnemyWall.speed *= speedx;
          myPlayer.playerSpeed *= speedx;

          int elementType = (int)random(0, maxObstacle);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            BoolObs.fire = true;
            BoolObs.life = false;
            println("fire");
            break;
          case 1:
            BoolObs.earth = true;
            BoolObs.life = false;
            println("water");
            break;
          case 2:
            BoolObs.water = true;
            BoolObs.life = false;
            println("life");
            break;
          case 3:
            BoolObs.wall = true;
            BoolObs.life = false;
            println("wall");
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
        println("fire");
        break;
      case 1:
        BoolObs.earth = true;
        BoolObs.life = false;
        println("water");
        break;
      case 2:
        BoolObs.water = true;
        BoolObs.life = false;
        println("life");
        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.life = false;
        println("wall");
        break;
      }

      Lives.lifeCount--;
    }
  }
}
