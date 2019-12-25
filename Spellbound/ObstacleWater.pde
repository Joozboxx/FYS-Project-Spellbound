class ObstacleWater {

  float xwater, ywater, xSize, ySize, speed, speedx, transparency, transpDecrease;
  PImage water = loadImage("elementwater.png");

  ObstacleWater() {
    xwater = width+width/2;
    ywater = random(20, (height-450));
    xSize = 65;
    ySize = 400;
    speed = 15;
    speedx = 1.05;
    transparency = 255;
    transpDecrease = 0;
  }

  void draw() {
    tint(255, transparency);
    image(water, xwater, ywater, xSize, ySize);
    noTint();
  }
  
      void activate(){
   for(int i = 0; i < 30; i++){
     fill(255,0,0);
    particles.add(new Particle(xwater,ywater+200,random(10) - 5,random(10) - 5,5));
    
    if(transparency <=10){
      particles.remove(i);
    }
  }
}

  void update() {
    xwater -= speed; 
    transparency -= transpDecrease;


    if (xwater + xSize < 0 ) {
      xwater = width+width/2;
      ywater = random(20, (height-450));

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

activate();

          //speed of all obstacles get increased when destroyed
          speed *= speedx;
          EnemyEarth.speed *=speedx;
          EnemyLife.speed *= speedx;
          EnemyFire.speed *= speedx;
          EnemyWall.speed *= speedx;


          waterBullets.remove(i);
          myPlayer.playerSpeed *= 1.04;
          points++;

          int elementType = (int)random(0, 4);

          // Every case switches the element randomly when hit by bullet
          switch(elementType)
          {
          case 0:
            BoolObs.fire = true;

            transpDecrease = 130;
            println("fire");
            break;
          case 1:
            BoolObs.earth = true;

            transpDecrease =130;
            println("water");
            break;
          case 2:
            BoolObs.life = true;
            transpDecrease = 130;
            println("life");
            break;
          case 3:
            BoolObs.wall = true;
            transpDecrease = 130;
            println("wall");
            break;
          }
        }
      }
      if (transparency <=10) {
        xwater=width+500;
        ywater=random(20, (height-450));
        transpDecrease = 0;
        transparency = 255;
        BoolObs.water = false;
       
      }
  


    }
  }
}
