class ObstacleWater {

  float xwater, ywater, xSize, ySize, speed;
  PImage water = loadImage("elementwater.png");

  ObstacleWater() {
    xwater = width+width/2;
    ywater = random(0, (height-500));
    xSize = 65;
    ySize = 400;
    speed = 15;
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
      speed *=1.1;
      ArrayObs.water = false;
      ArrayObs.life = true;
    }

    if (speed >= 35) {
      speed = 35;
    }

    //COLLISION MET LIFEBULLET
    for (int i = 0; i < waterBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (lifeBullets.size()>0) {
        WaterBullet b = waterBullets.get(i);
        //pakt de waarden
        if ((b.bulletX+b.diameter/2)> xwater && (b.bulletY+b.diameter/2)>ywater && (b.bulletY-b.diameter/2)<(ywater+ySize)) {
          //als de x waarde van de bullet groter is dan de x van het obstakel, 
          //EN de y waarde van de bullet tussen de y waarde (bovenste punt) en de y waarde+size (onderste punt) zit. 
          //de diameter/2 zorgt ervoor dat de collision rekening houdt met de grootte van het balletje
          xwater=width+500;
          ywater=random(0, (height-ySize));
          speed *=1.1;
          waterBullets.remove(i);
          ArrayObs.water = false;
          ArrayObs.life = true;
          myPlayer.playerSpeed *= 1.01;
          points++;
          //Voeg hier de dingen toe die je wilt dat er gebeuren als er collision is, op het moment verandert hij alleen de x, en y van het obstakel. Je kan hier bijvoorbeeld de bullet removen, of punten geven
        }
      }
    }
  }
}
