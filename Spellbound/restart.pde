class RestartGame{
  
  void restart(){
  myPlayer = new Player();
  EnemyFire = new ObstacleFire();
  EnemyWater = new ObstacleWater();
  EnemyLife = new ObstacleLife(); 
  EnemyEarth = new ObstacleEarth();
  EnemyWall = new ObstacleWall();
  BoolObs = new booleanObs();
  
  fireBullets = new ArrayList<BulletFire>();
  earthBullets = new ArrayList<BulletEarth>();
  waterBullets = new ArrayList<BulletWater>();
  lifeBullets = new ArrayList<BulletLife>();
  particles = new ArrayList<Particle>();
  
  points = 0;
}
}
