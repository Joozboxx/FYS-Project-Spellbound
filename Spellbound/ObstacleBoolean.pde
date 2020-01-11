class booleanObs {


  // Boolean for all element obstacles
  boolean water = true;
  boolean fire = false;
  boolean earth = false;
  boolean life = false;
  boolean wall = false;

  void Check() {
    // Calls the fire class
    if (fire == true) {
      EnemyFire.update();
      EnemyFire.draw();
    } 
    // Calls the earth class
    if (earth == true) {
      EnemyEarth.update();
      EnemyEarth.draw();
    } 
    // Calls the life class
    if (life == true) {
      EnemyLife.update();
      EnemyLife.draw();
    } 
    // Calls the water class
    if (water ==true) { 
      EnemyWater.update();
      EnemyWater.draw();
    } 
    if (wall ==true) { 
      EnemyWall.update();
      EnemyWall.draw();
    } 
  }
}
