class ArrayObstacle {

  //adjusts the speed of the player when all obstacles have despawned
  void update() {
    if (EnemyFire.xfire <0 || EnemyWater.xwater <0 || EnemyLife.xlife <0) {
      myPlayer.playerSpeed *= 1.30;
    }
  }
}
