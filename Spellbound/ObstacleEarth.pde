class ObstacleEarth {

  float xearth, yearth, xSize, ySize, speed, speedx;
  PImage earth = loadImage("elementearth.png");

  ObstacleEarth() {
    xearth = width+xSize;                
    yearth = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 15;
    speedx = 1.05;
  }

  void draw() {
    image(earth, xearth, yearth, xSize, ySize);
  }



  void update() {
    xearth -= speed; 

    //speed cap for obstacle
    if (speed >= 30) {
      speed = 30;
    }

    //calls void for when obstacle hits border of screen
    borderHit();
    //calls void when correct bullet hits obstacle
    bulletHit();

    //what happens when the obstacle gets destroyed
    if (BoolObs.earth == false) {
      xearth=width+xSize;
      yearth=random(20, (height-450));
    }
  }



  //particle effect when obstacle gets destroyed
  void particlefx() {
    for (int i = 0; i < 30; i++) {
      particles.add(new Particle(xearth, yearth+200,random(10) - 5,random(30)-10, 20));
    }
  }



  void borderHit() {
    if (xearth + xSize < 0 ) {
      xearth = width+xSize;
      yearth = random(20, (height-450));

      //accelerates obstacle speed everytime the edge of screen gets hit
      speed *=1.15;
      EnemyFire.speed *=speedx;
      EnemyWater.speed *= speedx;
      EnemyLife.speed *= speedx;
      EnemyWall.speed *= speedx;

      int elementType = (int)random(0, 4);

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



  void bulletHit() {
    //COLLISION MET LIFEBULLET
    for (int i = 0; i < earthBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (earthBullets.size()>0) {
        BulletEarth b = earthBullets.get(i);

        //pakt de waarden
        if ((b.bulletX+b.diameter/2)> xearth && (b.bulletY+b.diameter/2)>yearth && (b.bulletY-b.diameter/2)<(yearth+ySize)) {
          //als de x waarde van de bullet groter is dan de x van het obstakel, 
          //EN de y waarde van de bullet tussen de y waarde (bovenste punt) en de y waarde+size (onderste punt) zit. 
          //de diameter/2 zorgt ervoor dat de collision rekening houdt met de grootte van het balletje


          earthBullets.remove(i);
          points++;
          //calls void of particles
          particlefx();


          //speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyFire.speed *=speedx;
          EnemyWater.speed *= speedx;
          EnemyLife.speed *= speedx;
          EnemyWall.speed *= speedx;
          myPlayer.playerSpeed *= 1.04;

   
   
   
   
          int elementType = (int)random(0, 4);

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
}
