class ObstacleFire {

  float xfire, yfire, xSize, ySize, speed;
  PImage fire = loadImage("elementfire.png");

  ObstacleFire() {
    xfire = width;
    yfire = random(0, (height-500));
    xSize = 65;
    ySize = 400;
    speed = 15;
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
      speed *=1.1;
      ArrayObs.fire = false;
      ArrayObs.earth = true;
    }

    if (speed >= 35) {
      speed = 35;
    }
    //COLLISION MET LIFEBULLET
    for (int i = 0; i < bullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (lifeBullets.size()>0) {
        Bullet b = bullets.get(i);
        //pakt de waarden
        if ((b.bulletX+b.diameter/2)> xfire && (b.bulletY+b.diameter/2)>yfire && (b.bulletY-b.diameter/2)<(yfire+ySize)) {
          //als de x waarde van de bullet groter is dan de x van het obstakel, 
          //EN de y waarde van de bullet tussen de y waarde (bovenste punt) en de y waarde+size (onderste punt) zit. 
          //de diameter/2 zorgt ervoor dat de collision rekening houdt met de grootte van het balletje
          xfire=width+500;
          yfire=random(0, (height-ySize));
          bullets.remove(i);
          speed *=1.1;
          ArrayObs.fire = false;
          ArrayObs.water = true;
          myPlayer.playerSpeed *= 1.01;
          points++;
          //Voeg hier de dingen toe die je wilt dat er gebeuren als er collision is, op het moment verandert hij alleen de x, en y van het obstakel. Je kan hier bijvoorbeeld de bullet removen, of punten geven
        }
      }
    }
  }
}
