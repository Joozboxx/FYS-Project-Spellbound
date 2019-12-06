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
      speed *=1.15;
      EnemyEarth.speed *=1.15;
      EnemyLife.speed *= 1.15;
      EnemyFire.speed *= 1.15;
      
      int elementType = (int)random(0, 3);

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
          speed *= speedx;
          EnemyEarth.speed *=speedx;
          EnemyLife.speed *= speedx;
          EnemyFire.speed *= speedx;
          waterBullets.remove(i);
          myPlayer.playerSpeed *= 1.04;
          points++;
          println(speed);
          //Voeg hier de dingen toe die je wilt dat er gebeuren als er collision is, op het moment verandert hij alleen de x, en y van het obstakel. Je kan hier bijvoorbeeld de bullet removen, of punten geven
          int elementType = (int)random(0, 3);

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
          }
        }
      }
    }
  }
}
