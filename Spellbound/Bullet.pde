class Bullet {
  // Properties of the bullet
  float bulletX, bulletY;
  float diameter;
  float vx, vy;
  boolean isFired;
  Bullet[] bullet = new Bullet[200];

  // Giving the bullet initial values
  Bullet() {
    bullets.add(this);

    diameter = 30;
    reset();
  }

  void reset() {
    // The bullet is not being fired
    isFired = false;

    // the bullet starts outside of the screen
    bulletX = -700;
    bulletY = -700;

    // the bullet doesnt have any velocity yet
    vx = 0;
    vy = 0;
  }
  void keyPressed(){
 
  }
  // Call this method to signify that the bullet has been fired
  void fire(float angle, float speed) {   
    isFired = true;
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
  }
  void die(){
    for (int i = 0; i < bullets.size(); i++) {
      bullets.get(i);
      if (bulletX > width) {
        bullets.remove(i);
        i--;      
      }
  
    }
  
  }
  // This method draws the bullet
  void draw() {
    fill(255, 0, 0);
    ellipse(bulletX, bulletY, diameter, diameter);
  }
}
