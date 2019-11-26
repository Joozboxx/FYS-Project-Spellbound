Background backgroundLevel;
Player myPlayer;
ObstacleFire EnemyFire;
ObstacleWater EnemyWater;
ObstacleLife EnemyLife;
ObstacleEarth EnemyEarth;
Bullet bullet;
ArrayObstacle ArrayObs;
ArrayList<Bullet> bullets ;

void setup() {
  //Set window size
  size(1920, 1080, P2D);

  myPlayer = new Player();
  EnemyFire = new ObstacleFire();
  EnemyWater = new ObstacleWater();
  bullet = new Bullet();
  EnemyLife = new ObstacleLife(); 
  EnemyEarth = new ObstacleEarth();
  bullets = new ArrayList<Bullet>();

  for (int i = 0; i <10; i++) {
    bullets.add(new Bullet());
  }

  backgroundLevel = new Background();
  ArrayObs = new ArrayObstacle();
}

void draw() {
  //Set background color
  background(150, 100, 250);

  // Draw player class
  backgroundLevel.draw();
  backgroundLevel.drawSun();
  myPlayer.draw();
  myPlayer.update();

  EnemyFire.draw();
  EnemyFire.update();

  EnemyWater.draw();
  EnemyWater.update();

  EnemyLife.draw();
  EnemyLife.update();

  EnemyEarth.draw();
  EnemyEarth.update();

  for (Bullet b : bullets) {
    b.update();
    b.draw();
  }

  ArrayObs.update();

  text(round(frameRate), 10, 20);
}

void keyPressed() {
  myPlayer.keyPressed();
}

void keyReleased() {
  myPlayer.keyReleased();
}
