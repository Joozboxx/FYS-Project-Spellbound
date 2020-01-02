class ObstacleWater {

  float xwater, ywater, xSize, ySize, speed, speedx;
  PImage water = loadImage("elementwater.png");

  ObstacleWater() {
    xwater = width+width/2;
    ywater = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 15;
    speedx = 1.05;
  }

  void draw() {
    image(water, xwater, ywater, xSize, ySize);
  }



  void update() {
    xwater -= speed; 

    //speed cap for obstacle
    if (speed >= 30) {
      speed = 30;
    }

    //calls void for when obstacle hits border of screen
    borderHit();
    //calls void when correct bullet hits obstacle
    bulletHit();

    //what happens when the obstacle gets destroyed
    if (BoolObs.water == false) {
      xwater=width+xSize;
      ywater=random(20, (height-450));
    }
  }



  //particle effect when obstacle gets destroyed
  void particlefx() {
    for (int i = 0; i < 30; i++) {
      //particles( X position, Y position, particles going right, (particles going verticle/how much it spreads)-which direction it goes(higher or lower), size)
      particles.add(new Particle(xwater, ywater+200, random(10) - 5,random(30)-10, 20));
    }
  }



  void borderHit() {
    if (xwater + xSize < 0 ) {
      xwater = width+xSize;
      ywater = random(20, (height-450));

      //accelerates obstacle speed everytime the edge of screen gets hit
      speed *=1.15;
      EnemyEarth.speed *=speedx;
      EnemyLife.speed *= speedx;
      EnemyFire.speed *= speedx;
      EnemyWall.speed *= speedx;

      int elementType = (int)random(0, 4);

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


//COLLISION with Waterbullet
  void bulletHit() {
    
    for (int i = 0; i < waterBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (waterBullets.size()>0) {
        BulletWater b = waterBullets.get(i);

        //pakt de waarden
        if ((b.bulletX+b.diameter/2)> xwater && (b.bulletY+b.diameter/2)>ywater && (b.bulletY-b.diameter/2)<(ywater+ySize)) {
          //als de x waarde van de bullet groter is dan de x van het obstakel, 
          //EN de y waarde van de bullet tussen de y waarde (bovenste punt) en de y waarde+size (onderste punt) zit. 
          //de diameter/2 zorgt ervoor dat de collision rekening houdt met de grootte van het balletje
         
          
          waterBullets.remove(i);
          points++;
          //calls void of particles
          particlefx();

          //speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyEarth.speed *=speedx;
          EnemyLife.speed *= speedx;
          EnemyFire.speed *= speedx;
          EnemyWall.speed *= speedx;
          myPlayer.playerSpeed *= 1.04;





          int elementType = (int)random(0, 4);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            BoolObs.water = false;
            BoolObs.fire = true;
            println("fire");
            break;
          case 1:
            BoolObs.water = false;
            BoolObs.earth = true;
            println("water");
            break;
          case 2:
            BoolObs.water = false;
            BoolObs.life = true;
            println("life");
            break;
          case 3:
            BoolObs.water = false;
            BoolObs.wall = true;
            println("wall");
            break;
          }
        }
      }
    }
  }
}
