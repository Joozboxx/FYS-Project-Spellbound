class ObstacleEarth {

  float xearth, yearth, xSize, ySize, speed, speedx, screenShakeTimer;
  // Xorgt ervoor dat eerst de basis elementen komen
  int maxObstacle = 3;
  boolean yellowparticles = false;
  PImage earth = loadImage("elementearth.png");

  ObstacleEarth() {
    xearth = width+xSize;                
    yearth = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 10;
    speedx = 1.03;
  }

  void draw() {
    image(earth, xearth, yearth, xSize, ySize);
  }

  void update() {
    xearth -= speed; 

    if (points >= 10) {
      maxObstacle = 4;
    }

    // Speed cap for obstacle
    if (speed >= 30) {
      speed = 30;
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
      yearth=random(20, (height-450));
    }
  }

  // Particle effect when obstacle gets destroyed
  void particlefx() {
    for (int i = 0; i < 20; i++) {
      particles.add(new Particle(xearth, yearth+200, random(10) - 5, random(30)-10, 20));
    }
  }

  void borderHit() {
    if (xearth + xSize < 0 ) {
      xearth = width+xSize;
      yearth = random(20, (height-450));

      // Accelerates obstacle speed everytime the edge of screen gets hit
      speed *=1.15;
      EnemyFire.speed *=speedx;
      EnemyWater.speed *= speedx;
      EnemyLife.speed *= speedx;
      EnemyWall.speed *= speedx;

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

  //COLLISION WITH EARTHBULLET
  void bulletHit() {

    for (int i = 0; i < earthBullets.size(); i++) {
      // Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (earthBullets.size()>0) {
        BulletEarth b = earthBullets.get(i);

        // Pakt de waarden
        if ((b.bulletX+b.sizeX)> xearth && (b.bulletY+b.sizeY)>yearth && (b.bulletY-b.sizeY)<(yearth+ySize)) {

          earthBullets.remove(i);
          points++;
          // Boolean which activates the right color for the particles: red
          
          EnemyWater.blueparticles = false;
          EnemyFire.redparticles = false;
          EnemyLife.greenparticles = false;
          yellowparticles = true;
          // Calls void of particles
          particlefx();

          screenShakeTimer = 1.3;

          // Speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyFire.speed *=speedx;
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
            BoolObs.earth = false;
            println("earth");
            break;
          case 1:
            BoolObs.fire = true;
            BoolObs.earth = false;
            println("water");
            break;
          case 2:
            BoolObs.water = true;
            BoolObs.earth = false;
            println("life");
            break;
          case 3:
            BoolObs.wall = true;
            BoolObs.earth = false;
            println("wall");
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
      int elementType = (int)random(0, maxObstacle);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        BoolObs.life = true;
        BoolObs.earth = false;
        println("earth");
        break;
      case 1:
        BoolObs.fire = true;
        BoolObs.earth = false;
        println("water");
        break;
      case 2:
        BoolObs.water = true;
        BoolObs.earth = false;
        println("life");
        break;
      case 3:
        BoolObs.wall = true;
        BoolObs.earth = false;
        println("wall");
        break;
      }

      Lives.lifeCount--;
    }
  }
}
