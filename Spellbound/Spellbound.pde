Background backgroundLevel;
Player myPlayer;
ObstacleFire EnemyFire;
ObstacleWater EnemyWater;
ObstacleLife EnemyLife;
ObstacleEarth EnemyEarth;
ArrayObstacle ArrayObs;
ArrayList<Bullet> bullets ;

void setup() {
  //Set window size
  size(1920, 980, P2D);
  myPlayer = new Player();
  EnemyFire = new ObstacleFire();
  EnemyWater = new ObstacleWater();
  
  EnemyLife = new ObstacleLife(); 
  EnemyEarth = new ObstacleEarth();
  bullets = new ArrayList<Bullet>();
  backgroundLevel = new Background();
  ArrayObs = new ArrayObstacle();
  
  for (int i = 0; i <10; i++) {
    bullets.add(new Bullet());
  }
  
}

void draw() {
  //Set background color
  background(150, 100, 250);
  
  // Draw player class
  backgroundLevel.draw();
  backgroundLevel.drawSun();
  myPlayer.draw();
  myPlayer.update();

  ArrayObs.Check();
  ArrayObs.update();

  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
 
    b.update();
    b.draw();
  
  }

}

void keyPressed() {
  myPlayer.keyPressed();
}

void keyReleased() {
  myPlayer.keyReleased();
}
