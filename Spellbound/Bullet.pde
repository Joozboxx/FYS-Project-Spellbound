class Bullet {
  // properties of the bullet
  float bulletX, bulletY;
  float diameter;
  float vx, vy;
  boolean isFired;
  Bullet[] bullet = new Bullet[200];

  // giving the bullet initial values
  Bullet() {

    diameter = 30;
    reset();
  }

  void reset() {
    // the bullet is not being fired
    isFired = false;

    // the bullet starts outside of the screen
    bulletX = -700;
    bulletY = -700;

    // the bullet doesnt have any velocity yet
    vx = 0;
    vy = 0;
  }
}
