class ObstacleWater {

  float xwater, ywater, xSize, ySize, speed,speedx;
  PImage water = loadImage("elementwater.png");

  ObstacleWater() {
    xwater = width+width/2;
    ywater = random(0, (height-500));
    xSize = 65;
    ySize = 400;
    speed = 15;
    speedx = 1.05;
  }

  void draw() {
    fill(255, 0, 0);
    image(water, xwater, ywater, xSize, ySize);
  }

  void update() {
    xwater -= speed; 

    if (xwater + xSize < 0 ) {
      xwater = width+width/2;
      ywater = random(20, height-500);
      
      //speed of all obstacles get increased when passed the border
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
        ArrayObs.fire = true;
        ArrayObs.water = false;
        println("fire");
        break;
      case 1:
        ArrayObs.earth = true;
        ArrayObs.water = false;
        println("water");
        break;
      case 2:
        ArrayObs.life = true;
        ArrayObs.water = false;
        println("life");
        break;
        case 3:
            ArrayObs.wall = true;
            ArrayObs.water = false;
            println("wall");
            break;
      }
    }

    if (speed >= 30) {
      speed = 30;
    }

    //COLLISION MET LIFEBULLET
    for (int i = 0; i < waterBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (lifeBullets.size()>0) {
        BulletWater b = waterBullets.get(i);
        //pakt de waarden
        if ((b.bulletX+b.diameter/2)> xwater && (b.bulletY+b.diameter/2)>ywater && (b.bulletY-b.diameter/2)<(ywater+ySize)) {
          //als de x waarde van de bullet groter is dan de x van het obstakel, 
          //EN de y waarde van de bullet tussen de y waarde (bovenste punt) en de y waarde+size (onderste punt) zit. 
          //de diameter/2 zorgt ervoor dat de collision rekening houdt met de grootte van het balletje
          xwater=width+500;
          ywater=random(0, (height-ySize));
          
          
           //speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyEarth.speed *=speedx;
          EnemyLife.speed *= speedx;
          EnemyFire.speed *= speedx;
          
          
          waterBullets.remove(i);
          myPlayer.playerSpeed *= 1.04;
          points++;
      
          int elementType = (int)random(0, 4);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            ArrayObs.fire = true;
            ArrayObs.water = false;
            println("fire");
            break;
          case 1:
            ArrayObs.earth = true;
            ArrayObs.water = false;
            println("water");
            break;
          case 2:
            ArrayObs.life = true;
            ArrayObs.water = false;
            println("life");
            break;
            case 3:
            ArrayObs.wall = true;
            ArrayObs.water = false;
            println("wall");
            break;
          }
        }
      }
    }
  }
}
