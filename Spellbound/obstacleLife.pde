class ObstacleLife {

  float xlife, ylife, xSize, ySize, speed, speedx;
  PImage life = loadImage("elementlife.png");

  ObstacleLife() {
    xlife =width+width/2;                
    ylife = random(0, (height-500));
    xSize = 65;
    ySize = 400;
    speed = 15;
    speedx = 1.05;
  }

  void draw() {
    image(life, xlife, ylife, xSize, ySize);
  }

  void update() {
    xlife -= speed; 

    if (xlife + xSize <0) {
      xlife = width;
      ylife = random(20, height-500);

      //speed of all obstacles get increased when passed the border
      speed *=speedx; 
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
        BoolObs.water = true;
        BoolObs.life = false;
        println("water");
        break;
      case 2:
        BoolObs.earth = true;
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

          //speed of all obstacles get increased when destroyed
          speed *=speedx;
          EnemyEarth.speed *=speedx;
          EnemyWater.speed *= speedx;
          EnemyFire.speed *= speedx;
          EnemyWall.speed *= speedx;


          lifeBullets.remove(i);
          myPlayer.playerSpeed *= 1.04;
          points++;
   
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
            BoolObs.water = true;
            BoolObs.life = false;
            println("water");
            break;
          case 2:
            BoolObs.earth = true;
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
