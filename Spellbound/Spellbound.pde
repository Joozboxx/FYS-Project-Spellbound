import processing.sound.*;

Background backgroundLevel;
Player myPlayer;
ObstacleFire EnemyFire;
ObstacleWater EnemyWater;
ObstacleLife EnemyLife;
ObstacleEarth EnemyEarth;
booleanObs ArrayObs;
ArrayList<Bullet> bullets ;
ArrayList<EarthBullet> earthBullets ;
ArrayList<LifeBullet> lifeBullets ;
ArrayList<WaterBullet> waterBullets ;

int points = 0;
void setup() {
  //Set window size
  size(1920, 980, P2D);

  myPlayer = new Player();
  EnemyFire = new ObstacleFire();
  EnemyWater = new ObstacleWater();
  EnemyLife = new ObstacleLife(); 
  EnemyEarth = new ObstacleEarth();
  bullets = new ArrayList<Bullet>();

  for (int i = 0; i <10; i++) {
    bullets.add(new Bullet());
  }

  earthBullets = new ArrayList<EarthBullet>();
  waterBullets = new ArrayList<WaterBullet>();
  lifeBullets = new ArrayList<LifeBullet>();
  backgroundLevel = new Background();
  ArrayObs = new booleanObs();

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

  // Draw classes
  backgroundLevel.draw();
  backgroundLevel.drawSun();
  backgroundLevel.drawClouds();
  backgroundLevel.drawGrass();

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

  fill(186, 55, 100);
  textSize(32);
  text("obstacles hit:" + points, 10, 50);
}

void keyPressed() {
  myPlayer.keyPressed();
}

void keyReleased() {
  myPlayer.keyReleased();
}
