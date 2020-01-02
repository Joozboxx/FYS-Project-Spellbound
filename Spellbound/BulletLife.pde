class BulletLife {
  // Properties of the bullet
  float bulletX, bulletY;
  float diameter;
  float vx, vy;
  boolean isFired, ableToFire;
  int cooldownTimer;
 PImage waterBulletIm = loadImage("waterbullet.png");
  // Giving the bullet initial values
  BulletLife() {
    lifeBullets.add(this);
    diameter = 30;
  }


  // Call this method to signify that the bullet has been fired
  void fire(float angle, float speed) {   
    isFired = true;
    ableToFire = false;

    // Start the bullet at the player position
    bulletX = (myPlayer.xPlayer + 220);
    bulletY = (myPlayer.yPlayer + 87) ;

    vx = speed * cos(angle);
  }
  void cooldown() {
    if (isFired == true) {
      cooldownTimer = 10;
    }
  }
  // Whenever you want to update a bullet, call this method
  void update() {
    // If the bullet is being fired
    // Use the velocity to calculate the new position
    bulletX += vx;
    bulletY += vy;
  }
  void die() {
    for (int i = 0; i < lifeBullets.size(); i++) {
      BulletLife l = lifeBullets.get(i);
      if (bulletX > width - 500) {
        lifeBullets.remove(i);
      }
    }
  }

  void collisionWithObject() {
  }

  // This method draws the bullet
  void draw() {
    tint(0,255,0);
    image(waterBulletIm, bulletX, bulletY, diameter+100, diameter);
    noTint();
  }
}
