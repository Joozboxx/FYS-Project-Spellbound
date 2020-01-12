class BulletFire {
  // Properties of the bullet
  float bulletX, bulletY;
  float sizeX, sizeY;
  float vx, vy;
  boolean isFired, ableToFire;
  int cooldownTimer;
  PImage fireBulletIm = loadImage("firebullet.png");

  // Giving the bullet initial values
  BulletFire() {
    fireBullets.add(this);
    sizeX = 130;
    sizeY = 30;
    bulletY -= sizeY;
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
    for (int i = 0; i < fireBullets.size(); i++) {
      BulletFire b = fireBullets.get(i);
      if (bulletX > width - 500) {
        fireBullets.remove(i);
      }
    }
  }

  // This method draws the bullet
  void draw() {
    image(fireBulletIm, bulletX, bulletY, sizeX, sizeY);
  }
}
