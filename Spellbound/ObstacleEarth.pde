class ObstacleEarth {

  float xearth, yearth, xSize, ySize, speed, speedx;
  PImage earth = loadImage("elementearth.png");

  ObstacleEarth() {
    xearth = width+width/2;                
    yearth = random(0, (height-500));
    xSize = 65;
    ySize = 400;
    speed = 15;
    speedx = 1.05;
  }

  void draw() {
    fill(255, 0, 0);
    image(earth, xearth, yearth, xSize, ySize);
  }

  void update() {
    xearth -= speed; 

    if (xearth + xSize < 0) {
      xearth = width+width/2;
      yearth = random(20, height-500);

      //speed of all obstacles get increased when passed the border
      speed *=speedx;
      EnemyFire.speed *=speedx;
      EnemyWater.speed *= speedx;
      EnemyLife.speed *= speedx;
      EnemyWall.speed *= speedx;

      int elementType = (int)random(0, 4);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        ArrayObs.fire = true;
        ArrayObs.earth = false;
        println("fire");
        break;
      case 1:
        ArrayObs.water = true;
        ArrayObs.earth = false;
        println("water");
        break;
      case 2:
        ArrayObs.life = true;
        ArrayObs.earth = false;
        println("life");
        break;
      case 3:
        ArrayObs.wall = true;
        ArrayObs.earth = false;
        println("wall");
        break;
      }
    }

    if (speed >= 30) {
      speed = 30;
    }

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
          xearth=width+width/2;
          yearth=random(0, (height-ySize));

          //speed of all obstacles get increased when destroyed
          speed *=speedx;
          EnemyFire.speed *=speedx;
          EnemyWater.speed *= speedx;
          EnemyLife.speed *= speedx;
          EnemyWall.speed *= speedx;


          earthBullets.remove(i);
          myPlayer.playerSpeed *= 1.04;
          points++;
          println(speed);
          int elementType = (int)random(0, 4);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            ArrayObs.fire = true;
            ArrayObs.earth = false;
            println("fire");
            break;
          case 1:
            ArrayObs.water = true;
            ArrayObs.earth = false;
            println("water");
            break;
          case 2:
            ArrayObs.life = true;
            ArrayObs.earth = false;
            println("life");
            break;
          case 3:
            ArrayObs.wall = true;
            ArrayObs.earth = false;
            println("wall");
            break;
          }
        }
      }
    }
  }
}
