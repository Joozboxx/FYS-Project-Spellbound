class booleanObs {

  
  // Boolean for all element obstacles
  boolean water = true;
  boolean fire = false;
  boolean earth = false;
  boolean life = false;

  void Check() {
    // Calls the fire class
    if (fire == true) {
      EnemyFire.draw();
      EnemyFire.update();
    } else
    {
    }
    // Calls the earth class
    if (earth == true) {
      EnemyEarth.draw();
      EnemyEarth.update();
    } else
    {
    }
    // Calls the life class
    if (life == true) {
      EnemyLife.draw();
      EnemyLife.update();
    } else
    {
    }
    // Calls the water class
    if (water ==true) { 
      EnemyWater.draw();
      EnemyWater.update();
    } else
    {
    }
  }
  
}
