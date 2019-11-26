Background backgroundLevel;
Player myPlayer;
ObstacleFire EnemyFire;
ObstacleWater EnemyWater;
ObstacleLife EnemyLife;
ObstacleEarth EnemyEarth;
ArrayObstacle ArrayObs;
ArrayList<Bullet> bullets ;
ArrayList<EarthBullet> earthBullets ;
ArrayList<LifeBullet> lifeBullets ;
ArrayList<WaterBullet> waterBullets ;

void setup() {
  //Set window size
  size(1920, 980, P2D);
  myPlayer = new Player();
  EnemyFire = new ObstacleFire();
  EnemyWater = new ObstacleWater();
  
  EnemyLife = new ObstacleLife(); 
  EnemyEarth = new ObstacleEarth();
  bullets = new ArrayList<Bullet>();
  earthBullets = new ArrayList<EarthBullet>();
  waterBullets = new ArrayList<WaterBullet>();
  lifeBullets = new ArrayList<LifeBullet>();
  backgroundLevel = new Background();
  ArrayObs = new ArrayObstacle();
  
  for (int i = 0; i <10; i++) {
    bullets.add(new Bullet());
    }
  for (int i = 0; i <10; i++) {
    earthBullets.add(new EarthBullet());
    }
  for (int i = 0; i <10; i++) {
    lifeBullets.add(new LifeBullet());
    }
  for (int i = 0; i <10; i++) {
    waterBullets.add(new WaterBullet());
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

  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
 
    b.update();
    b.draw();
  
  }
  
  for (int i = 0; i < earthBullets.size(); i++) {
    EarthBullet e = earthBullets.get(i);
 
    e.update();
    e.draw();
  
  }
  for (int i = 0; i < lifeBullets.size(); i++) {
    LifeBullet l = lifeBullets.get(i);
 
    l.update();
    l.draw();
  
  }
  for (int i = 0; i < waterBullets.size(); i++) {
    WaterBullet w = waterBullets.get(i);
 
    w.update();
    w.draw();
  
  }

}

void keyPressed() {
  myPlayer.keyPressed();
}

void keyReleased() {
  myPlayer.keyReleased();
}
