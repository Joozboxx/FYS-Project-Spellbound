class ArrayObstacle{
  
  void update(){
    if(EnemyFire.xfire <0 || EnemyWater.xwater <0 || EnemyLife.xlife <0){
      myPlayer.playerSpeed *= 1.30;
    }
  }

}
