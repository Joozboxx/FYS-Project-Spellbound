class ObstacleFire {

  float xfire, yfire, xSize, ySize, speed,speedx;
  PImage fire = loadImage("elementfire.png");

  ObstacleFire() {
    xfire = width+width/2;
    yfire = random(0, (height-500));
    xSize = 65;
    ySize = 400;
    speed = 15;
    speedx = 1.05;
  }

  void draw() {
    fill(255, 0, 0);
    image(fire, xfire, yfire, xSize, ySize);
  }

  void update() {
    xfire -= speed; 

    if (xfire + xSize < 0) {
      xfire = width;
      yfire = random(20, height-500);
      speed *=speedx;
      EnemyEarth.speed *=speedx;
      EnemyWater.speed *= speedx;
      EnemyLife.speed *= speedx;

      int elementType = (int)random(0, 3);

      // Every case switches the element randomly when hit by bullet
      switch(elementType)
      {
      case 0:
        ArrayObs.earth = true;
        ArrayObs.fire = false;
        println("fire");
        break;
      case 1:
        ArrayObs.water = true;
        ArrayObs.fire = false;
        println("water");
        break;
      case 2:
        ArrayObs.life = true;
        ArrayObs.fire = false;
        println("life");
        break;
      }
    }

    if (speed >= 30) {
      speed = 30;
    }
    //COLLISION MET LIFEBULLET
    for (int i = 0; i < fireBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (lifeBullets.size()>0) {
        BulletFire f = fireBullets.get(i);
        //pakt de waarden
        if ((f.bulletX+f.diameter/2)> xfire && (f.bulletY+f.diameter/2)>yfire && (f.bulletY-f.diameter/2)<(yfire+ySize)) {
          //als de x waarde van de bullet groter is dan de x van het obstakel, 
          //EN de y waarde van de bullet tussen de y waarde (bovenste punt) en de y waarde+size (onderste punt) zit. 
          //de diameter/2 zorgt ervoor dat de collision rekening houdt met de grootte van het balletje
          xfire=width+width/2;
          yfire=random(0, (height-ySize));
          fireBullets.remove(i);
          speed *=speedx;
          EnemyEarth.speed *=speedx;
          EnemyWater.speed *= speedx;
          EnemyLife.speed *= speedx;
          myPlayer.playerSpeed *= 1.04;
          points++;
          println(speed);
          //Voeg hier de dingen toe die je wilt dat er gebeuren als er collision is, op het moment verandert hij alleen de x, en y van het obstakel. Je kan hier bijvoorbeeld de bullet removen, of punten geven
          int elementType = (int)random(0, 3);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            ArrayObs.earth = true;
            ArrayObs.fire = false;
            println("fire");
            break;
          case 1:
            ArrayObs.water = true;
            ArrayObs.fire = false;
            println("water");
            break;
          case 2:
            ArrayObs.life = true;
            ArrayObs.fire = false;
            println("life");
            break;
          }
        }
      }
    }
  }
}
