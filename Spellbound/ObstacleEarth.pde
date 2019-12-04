class ObstacleEarth {

  float xearth, yearth, xSize, ySize, speed;
  PImage earth = loadImage("elementearth.png");

  ObstacleEarth() {
    xearth = width+width/2;                
    yearth = random(0, (height-500));
    xSize = 65;
    ySize = 400;
    speed = 15;
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
      speed *=1.1;

    }

    if (speed >= 35) {
      speed = 35;
    }

    //COLLISION MET LIFEBULLET
    for (int i = 0; i < earthBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (earthBullets.size()>0) {
        EarthBullet b = earthBullets.get(i);
        //pakt de waarden
        if ((b.bulletX+b.diameter/2)> xearth && (b.bulletY+b.diameter/2)>yearth && (b.bulletY-b.diameter/2)<(yearth+ySize)) {
          //als de x waarde van de bullet groter is dan de x van het obstakel, 
          //EN de y waarde van de bullet tussen de y waarde (bovenste punt) en de y waarde+size (onderste punt) zit. 
          //de diameter/2 zorgt ervoor dat de collision rekening houdt met de grootte van het balletje
          xearth=width+width/2;
          yearth=random(0, (height-ySize));
          speed *=1.1;
          earthBullets.remove(i);
          myPlayer.playerSpeed *= 1.01;
          points++;
          
          int elementType = (int)random(0, 3);
          
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
          }
        }

        //Voeg hier de dingen toe die je wilt dat er gebeuren als er collision is, op het moment verandert hij alleen de x, en y van het obstakel. Je kan hier bijvoorbeeld de bullet removen, of punten geven
      }
    }
  }
}
