class ArrayObstacle {

  boolean water = true;
  boolean fire = false;
  boolean earth = false;
  boolean life = false;

  void Check() {
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
    if (life == true) {
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
}
