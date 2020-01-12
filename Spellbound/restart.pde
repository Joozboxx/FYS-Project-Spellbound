class RestartGame {

  // Restarts all these 
  void restart() {
    backgroundLevel.grassSpeed = 10;
    myPlayer = new Player();
    Lives = new PlayerLives();

    EnemyFire = new ObstacleFire();
    EnemyWater = new ObstacleWater();
    EnemyLife = new ObstacleLife(); 
    EnemyEarth = new ObstacleEarth();
    EnemyWall = new ObstacleWall();

    BoolObs.water = true;
    BoolObs.fire = false;
    BoolObs.life = false;
    BoolObs.earth = false;
    BoolObs.wall = false;

    fireBullets = new ArrayList<BulletFire>();
    earthBullets = new ArrayList<BulletEarth>();
    waterBullets = new ArrayList<BulletWater>();
    lifeBullets = new ArrayList<BulletLife>();
    particles = new ArrayList<Particle>();

    points = 0;
    BonusCoin = new Coin();
  }
}
