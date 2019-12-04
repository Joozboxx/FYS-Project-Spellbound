class ObstacleLife {

  float xlife, ylife, xSize, ySize, speed;
  PImage life = loadImage("elementlife.png");

  ObstacleLife() {
    xlife =width+width/2;                
    ylife = random(0, (height-500));
    xSize = 65;
    ySize = 400;
    speed = 15;
  }

  void draw() {
    fill(255, 0, 0);
    image(life, xlife, ylife, xSize, ySize);
  }

  void update() {
    xlife -= speed; 

    if (xlife + xSize <0) {
      xlife = width;
      ylife = random(20, height-500);
      speed *=1.15; 
      EnemyEarth.speed *=1.15;
      EnemyWater.speed *= 1.15;
      EnemyFire.speed *= 1.15;

      int elementType = (int)random(0, 3);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        ArrayObs.fire = true;
        ArrayObs.life = false;
        println("fire");
        break;
      case 1:
        ArrayObs.water = true;
        ArrayObs.life = false;
        println("water");
        break;
      case 2:
        ArrayObs.earth = true;
        ArrayObs.life = false;
        println("life");
        break;
      }
    }

    if (speed >= 30) {
      speed = 30;
    }

    //COLLISION MET LIFEBULLET
    for (int i = 0; i < lifeBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (lifeBullets.size()>0) {
        BulletLife b = lifeBullets.get(i);
        //pakt de waarden
        if ((b.bulletX+b.diameter/2)> xlife && (b.bulletY+b.diameter/2)>ylife && (b.bulletY-b.diameter/2)<(ylife+ySize)) {
          //als de x waarde van de bullet groter is dan de x van het obstakel, 
          //EN de y waarde van de bullet tussen de y waarde (bovenste punt) en de y waarde+size (onderste punt) zit. 
          //de diameter/2 zorgt ervoor dat de collision rekening houdt met de grootte van het balletje
          xlife=width+width/2;
          ylife=random(0, (height-ySize));
          speed *=1.15;
          EnemyEarth.speed *=1.15;
          EnemyWater.speed *= 1.15;
          EnemyFire.speed *= 1.15;
          lifeBullets.remove(i);
          myPlayer.playerSpeed *= 1.04;
          points++;
          //Voeg hier de dingen toe die je wilt dat er gebeuren als er collision is, op het moment verandert hij alleen de x, en y van het obstakel. Je kan hier bijvoorbeeld de bullet removen, of punten geven
          int elementType = (int)random(0, 3);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            ArrayObs.fire = true;
            ArrayObs.life = false;
            println("fire");
            break;
          case 1:
            ArrayObs.water = true;
            ArrayObs.life = false;
            println("water");
            break;
          case 2:
            ArrayObs.earth = true;
            ArrayObs.life = false;
            println("life");
            break;
          }
        }
      }
    }
  }
}
