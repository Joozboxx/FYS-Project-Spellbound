import processing.sound.*;

Background backgroundLevel;
Player myPlayer;
ObstacleFire EnemyFire;
ObstacleWater EnemyWater;
ObstacleLife EnemyLife;
ObstacleEarth EnemyEarth;
booleanObs ArrayObs;
PauseMenu pauseScreen;

ArrayList<FireBullet> fireBullets ;
ArrayList<EarthBullet> earthBullets ;
ArrayList<LifeBullet> lifeBullets ;
ArrayList<WaterBullet> waterBullets ;
int points;
boolean isPauseGame = false;

void setup() {
  //Set window size
  size(1920, 980, P2D);

  myPlayer = new Player();
  EnemyFire = new ObstacleFire();
  EnemyWater = new ObstacleWater();
  EnemyLife = new ObstacleLife(); 
  EnemyEarth = new ObstacleEarth();
  fireBullets = new ArrayList<FireBullet>();
  points = 0;
  earthBullets = new ArrayList<EarthBullet>();
  waterBullets = new ArrayList<WaterBullet>();
  lifeBullets = new ArrayList<LifeBullet>();
  backgroundLevel = new Background();
  pauseScreen = new PauseMenu();
  ArrayObs = new booleanObs();

  for (int i = 0; i <10; i++) {
    fireBullets.add(new FireBullet());
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


  // If the game is paused, don't show the rest of the game
  if (!isPauseGame) {
    // Draw classes
    backgroundLevel.draw();
    backgroundLevel.drawSun();
    backgroundLevel.drawClouds();
    backgroundLevel.drawGrass();

    myPlayer.draw();
    myPlayer.update();

    ArrayObs.Check();

    for (int i = 0; i < fireBullets.size(); i++) {
      FireBullet f = fireBullets.get(i);

      f.update();
      f.draw();
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
  } else {
    pauseScreen.draw();
    pauseScreen.pauseMenu();
  }
}  

void keyPressed() {
  myPlayer.keyPressed();

  // If key 'v' is pressed, pause the game 
  if (key == ' ') {
    isPauseGame = !isPauseGame;
  }
}

void keyReleased() {
  myPlayer.keyReleased();
}
