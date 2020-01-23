class BulletWater {
  // Properties of the bullet
  float bulletX, bulletY;
  float sizeX, sizeY;
  float vx, vy;
  PImage waterBulletIm = loadImage("waterbullet.png");

  // Giving the bullet initial values
  BulletWater() {
    waterBullets.add(this);
    sizeX = 130;
    sizeY = 30;
    bulletY -= sizeY;
  }

  // Call this method to signify that the bullet has been fired
  void fire(float angle, float speed) {   

    // Start the bullet at the player position
    bulletX = (myPlayer.xPlayer + 220);
    bulletY = (myPlayer.yPlayer + 87) ;

    vx = speed * cos(angle);
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
    for (int i = 0; i < waterBullets.size(); i++) {
      BulletWater w = waterBullets.get(i);
      if (bulletX > width - 500) {
        waterBullets.remove(i);
      }
    }
  }

  // This method draws the bullet
  void draw() {
    noTint();
    image(waterBulletIm, bulletX, bulletY, sizeX, sizeY);
    noTint();
  }
}
