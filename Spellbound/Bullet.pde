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
    // if the bullet is being fired
    
      
       // use the velocity to calculate the new position
      bulletX += vx;
      bulletY += vy;
      
    
  }
  
  // this method draws the bullet
  void draw() {
    fill(255,0,0);
    ellipse(bulletX,bulletY,diameter,diameter);
  }




}
