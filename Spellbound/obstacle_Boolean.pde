class ArrayObstacle {
  
  void Check() {
  boolean water = true;
  boolean fire = false;
  boolean earth = false;
  boolean life = false;
  

  // if water
  if (water == true && EnemyWater.xwater <= 0) {
    water = false;
    life = true;
  } 
  if (life == true && EnemyLife.xlife <= 0) {
    life = false;
    fire = true;
  } 
  if (fire == true && EnemyFire.xfire <= 0) {
    fire = false;
    earth = true;
  } 
  if (earth == true && EnemyEarth.xearth <= 0) {
    earth = false;
    water = true;
  }

//calls the fire class
  if (fire == true) {
    EnemyFire.draw();
    EnemyFire.update();
  } else
  {
  }
// calls the earth class
  if (earth == true) {
    EnemyEarth.draw();
    EnemyEarth.update();
  } else
  {
  }
//calls the life class
  if (life == true && water == false) {
    EnemyLife.draw();
    EnemyLife.update();
  } else
  {
  }
//calls the water class
  if (water ==true) { 
    EnemyWater.draw();
    EnemyWater.update();
  } else
  {
  }
}

  // Adjusts the speed of the player when all obstacles have despawned
  void update() {
    if (EnemyFire.xfire <=0 || EnemyWater.xwater <=0 || EnemyLife.xlife <=0) {
      myPlayer.playerSpeed *= 1.30;
    }
  }
}
