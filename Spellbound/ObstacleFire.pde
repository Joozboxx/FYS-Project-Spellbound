class ObstacleFire {

  float xfire, yfire, xSize, ySize, speed, speedx;
  //zorgt ervoor dat eerst de basis elementen komen. 
  int maxObstacle = 3;
  boolean redparticles = false;
  PImage fire = loadImage("elementfire.png");

  ObstacleFire() {
    xfire = width+xSize;
    yfire = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 10;
    speedx = 1.03;
  }

  void draw() {
    image(fire, xfire, yfire, xSize, ySize);
  }



  void update() {
    xfire -= speed; 

    if (points >= 10) {
      maxObstacle = 4;
    }

    //speed cap for obstacle
    if (speed >= 30) {
      speed = 30;
    }

    //calls void for when obstacle hits border of screen
    borderHit();
    //calls void when correct bullet hits obstacle
    bulletHit();
    //calls void for when player gets hit
    collisionplayer();

    //what happens when the obstacle gets destroyed
    if (BoolObs.fire == false) {
      xfire=width+xSize;
      yfire=random(20, (height-450));
    }
  }



  //particle effect when obstacle gets destroyed
  void particlefx() {
    for (int i = 0; i < 20; i++) {
      particles.add(new Particle(xfire, yfire+200, random(10) - 5, random(30)-10, 20));
    }
  }



  void borderHit() {
    if (xfire + xSize < 0 ) {
      xfire = width+xSize;
      yfire = random(20, (height-450));

      //accelerates obstacle speed everytime the edge of screen gets hit
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
    //COLLISION MET LIFEBULLET
    for (int i = 0; i < fireBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (fireBullets.size()>0) {
        BulletFire b = fireBullets.get(i);

        //pakt de waarden
        if ((b.bulletX+b.sizeX)> xfire && (b.bulletY+b.sizeY)>yfire && (b.bulletY-b.sizeY)<(yfire+ySize)) {

          fireBullets.remove(i);
          points++;
          //boolean which activates the right color for the particles: red
          
          EnemyWater.blueparticles = false;
          EnemyLife.greenparticles = false;
          EnemyEarth.yellowparticles = false;
          redparticles = true;
          //calls void of particles
          particlefx();

          //speed of all obstacles get increased when destroyed
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

      Lives.lifeCount--;
    }
  }
}
