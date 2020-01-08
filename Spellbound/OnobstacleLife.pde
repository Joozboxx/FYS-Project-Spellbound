class ObstacleLife {

  float xlife, ylife, xSize, ySize, speed, speedx;
  boolean greenparticles = false;
  PImage life = loadImage("elementlife.png");

  ObstacleLife() {
    xlife =width+xSize;                
    ylife = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 15;
    speedx = 1.03;
  }

  void draw() {
    image(life, xlife, ylife, xSize, ySize);
  }



  void update() {
    xlife -= speed; 

    //speed cap for obstacle
    if (speed >= 30) {
      speed = 30;
    }

    //calls void for when obstacle hits border of screen
    borderHit();
    //calls void when correct bullet hits obstacle
    bulletHit();

    //what happens when the obstacle gets destroyed
    if (BoolObs.life == false) {
      xlife=width+xSize;
      ylife=random(20, (height-450));
    }
  }



  //particle effect when obstacle gets destroyed
  void particlefx() {
    for (int i = 0; i < 30; i++) {
      particles.add(new Particle(xlife, ylife+200, random(10) - 5, random(30)-10, 20));
    }
  }



  void borderHit() {
    if (xlife + xSize < 0 ) {
      xlife = width+xSize;
      ylife = random(20, (height-450));

      //accelerates obstacle speed everytime the edge of screen gets hit
      speed *=1.15;
      EnemyEarth.speed *=speedx;
      EnemyWater.speed *= speedx;
      EnemyFire.speed *= speedx;
      EnemyWall.speed *= speedx;

      int elementType = (int)random(0, 4);

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


  //COLLISION with LIFEBULLET
  void bulletHit() {

    for (int i = 0; i < lifeBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (lifeBullets.size()>0) {
        BulletLife b = lifeBullets.get(i);

        //pakt de waarden
        if ((b.bulletX+b.sizeX)> xlife && (b.bulletY+b.sizeY)>ylife && (b.bulletY-b.sizeY)<(ylife+ySize)) {


          lifeBullets.remove(i);
          points++;
          //boolean which activates the right color for the particles: green
          greenparticles = true;
          EnemyWater.blueparticles = false;
          EnemyFire.redparticles = false;
          EnemyEarth.yellowparticles = false;
          //calls void of particles
          particlefx();

          //speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyEarth.speed *=speedx;
          EnemyWater.speed *= speedx;
          EnemyFire.speed *= speedx;
          EnemyWall.speed *= speedx;
          myPlayer.playerSpeed *= 1.03;





          int elementType = (int)random(0, 4);

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
}
