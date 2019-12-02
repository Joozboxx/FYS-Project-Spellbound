class Bullet {
  // Properties of the bullet
  float bulletX, bulletY;
  float diameter;
  float vx, vy;
  boolean isFired, ableToFire;
  int cooldownTimer;
  color fireBulletColor = color(255,0,0);
  int radius = 15;
  float xfire = EnemyFire.xfire;
  float yfire = EnemyFire.yfire;
  float xSize = 65;
  float ySize = 400;
  // Giving the bullet initial values
  Bullet() {
    bullets.add(this);
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
  void cooldown(){
    if (isFired == true){
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
  void die(){
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      if (bulletX > width){
        bullets.remove(i);
      }   
    }
  
  }
  
  
   

  
   
  
  
  
  
  // This method draws the bullet
  void draw() {
    fill(fireBulletColor);
    ellipse(bulletX, bulletY, diameter, diameter);
    textSize(40);
    text(cooldownTimer, 1800,100);
    boolean hit = circleRect(bulletX,bulletY,radius, xfire,yfire,xSize,ySize);
    if (hit){
      println("collision");
    }
   }  
      boolean circleRect(float bulletX, float bulletY, float radius, float xfire, float yfire, float xSize, float ySize) {
    
    // temporary variables to set edges for testing
      float testX = bulletX;
      float testY = bulletY;

  // which edge is closest?
      if (bulletX < xfire)         testX = xfire;      // test left edge
      else if (bulletX > xfire+ xSize) testX = xfire+xSize;   // right edge
      if (bulletY < yfire)         testY = yfire;      // top edge
      else if (bulletY > yfire+ySize) testY = yfire+ySize;   // bottom edge

  // get distance from closest edges
      float distX = bulletX-testX;
      float distY = bulletY-testY;
      float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
      if (distance <= radius) {
        return true;
      }
      return false;
    }
  
}
