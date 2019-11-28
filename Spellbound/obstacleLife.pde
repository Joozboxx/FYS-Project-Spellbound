class ObstacleLife {

  float xlife, ylife, xSize, ySize, speed;
  PImage life = loadImage("elementlife.png");
  
  ObstacleLife() {
    xlife = width;                
    ylife = random(0, (height-ySize));
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
      speed *=1.05; 
      ArrayObs.life = false;
      ArrayObs.fire = true;
    }

    if (speed >= 35) {
      speed = 35;
    }
    
    //COLLISION MET LIFEBULLET
    for (int i = 0; i < lifeBullets.size(); i++) {
      //Zorgt ervoor dat hij collision checkt als je meer dan 0 bullets ingame hebt
      if (lifeBullets.size()>0) {
        LifeBullet b = lifeBullets.get(i);
        //pakt de waarden
        if ((b.bulletX+b.diameter/2)> xlife && (b.bulletY+b.diameter/2)>ylife && (b.bulletY-b.diameter/2)<(ylife+ySize)) {
          //als de x waarde van de bullet groter is dan de x van het obstakel, 
          //EN de y waarde van de bullet tussen de y waarde (bovenste punt) en de y waarde+size (onderste punt) zit. 
          //de diameter/2 zorgt ervoor dat de collision rekening houdt met de grootte van het balletje
          xlife=width+500;
          ylife=random(0, (height-ySize));
          lifeBullets.remove(i);
          ArrayObs.life = false;
      ArrayObs.earth = true;
          //Voeg hier de dingen toe die je wilt dat er gebeuren als er collision is, op het moment verandert hij alleen de x, en y van het obstakel. Je kan hier bijvoorbeeld de bullet removen, of punten geven
        }
      }
    }
  }
}
