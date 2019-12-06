import processing.sound.*;

Background backgroundLevel;
Player myPlayer;
ObstacleFire EnemyFire;
ObstacleWater EnemyWater;
ObstacleLife EnemyLife;
ObstacleEarth EnemyEarth;
booleanObs ArrayObs;
PauseMenu pauseScreen;
GameOver gameOverScreen;

ArrayList<BulletFire> fireBullets ;
ArrayList<BulletEarth> earthBullets ;
ArrayList<BulletLife> lifeBullets ;
ArrayList<BulletWater> waterBullets ;
int points;
boolean isPauseGame = false;
boolean gameIsOver = false;

void setup() {
  //Set window size
  size(1920, 1080, P2D);

  myPlayer = new Player();
  EnemyFire = new ObstacleFire();
  EnemyWater = new ObstacleWater();
  EnemyLife = new ObstacleLife(); 
  EnemyEarth = new ObstacleEarth();
  fireBullets = new ArrayList<BulletFire>();
  points = 0;
  earthBullets = new ArrayList<BulletEarth>();
  waterBullets = new ArrayList<BulletWater>();
  lifeBullets = new ArrayList<BulletLife>();
  backgroundLevel = new Background();
  pauseScreen = new PauseMenu();
  ArrayObs = new booleanObs();
  gameOverScreen = new GameOver();

  for (int i = 0; i <10; i++) {
    fireBullets.add(new BulletFire());
  }
  for (int i = 0; i <10; i++) {
    earthBullets.add(new BulletEarth());
  }
  for (int i = 0; i <10; i++) {
    lifeBullets.add(new BulletLife());
  }
  for (int i = 0; i <10; i++) {
    waterBullets.add(new BulletWater());
  }
}

void draw() {
  //Set background color
  background(150, 100, 250);

  if (gameIsOver) {
    gameOverScreen.draw();
    gameOverScreen.gameOverScreen();
  } else {
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
        BulletFire f = fireBullets.get(i);

        f.update();
        f.draw();
      }
      for (int i = 0; i < earthBullets.size(); i++) {
        BulletEarth e = earthBullets.get(i);

        e.update();
        e.draw();
      }
      for (int i = 0; i < lifeBullets.size(); i++) {
        BulletLife l = lifeBullets.get(i);

        l.update();
        l.draw();
      }
      for (int i = 0; i < waterBullets.size(); i++) {
        BulletWater w = waterBullets.get(i);

        w.update();
        w.draw();

        // Square for bullet bug (REMOVE LATER!)
        noStroke();
        fill(170, 213, 224);
        rect(0, 0, 25, 25);
      }
    } else {
      pauseScreen.draw();
      pauseScreen.pauseMenu();
    }
  }
}

void keyPressed() {
  myPlayer.keyPressed();

  // If spacebar is pressed, pause the game. And if spacebar released, start the game
  if (key == ' ') {
    isPauseGame = !isPauseGame;
  }
}

void keyReleased() {
  myPlayer.keyReleased();
}
