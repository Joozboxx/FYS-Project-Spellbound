class LifeBullet {
  // Properties of the bullet
  float bulletX, bulletY;
  float diameter;
  float vx, vy;
  boolean isFired, ableToFire;
  int cooldownTimer;
  color lifeBulletColor = color(0, 255, 0);
  // Giving the bullet initial values
  LifeBullet() {
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
    die();
  }
  void die() {
    for (int i = 0; i < lifeBullets.size(); i++) {
      LifeBullet b = lifeBullets.get(i);
      if (bulletX > width) {
        lifeBullets.remove(i);
      }
    }
  }

  void collisionWithObject() {
  }

  // This method draws the bullet
  void draw() {
    fill(lifeBulletColor);
    ellipse(bulletX, bulletY, diameter, diameter);
  }
}
