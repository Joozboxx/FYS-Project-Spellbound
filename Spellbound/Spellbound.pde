import processing.sound.*;

Background backgroundLevel;
Player myPlayer;
ObstacleFire EnemyFire;
ObstacleWater EnemyWater;
ObstacleLife EnemyLife;
ObstacleEarth EnemyEarth;
ObstacleWall EnemyWall;
booleanObs BoolObs;
PauseMenu pauseScreen;
GameOver gameOverScreen;
MainMenu mainMenuScreen;
WindEffect Wind;

ArrayList<BulletFire> fireBullets ;
ArrayList<BulletEarth> earthBullets ;
ArrayList<BulletLife> lifeBullets ;
ArrayList<BulletWater> waterBullets ;
//array list for all particle effects you get after hitting an obstacle
ArrayList<Particle> particles;

boolean isPauseGame = false;
int gameMode = 0;


Coin BonusCoin;
int points;

void setup() {
  //Set window size
  size(1920, 1080, P3D);
  frameRate(60);

  backgroundLevel = new Background();
  mainMenuScreen = new MainMenu();

  myPlayer = new Player();
  EnemyFire = new ObstacleFire();
  EnemyWater = new ObstacleWater();
  EnemyLife = new ObstacleLife(); 
  EnemyEarth = new ObstacleEarth();
  EnemyWall = new ObstacleWall();
  BoolObs = new booleanObs();
  Wind = new WindEffect();

  fireBullets = new ArrayList<BulletFire>();
  earthBullets = new ArrayList<BulletEarth>();
  waterBullets = new ArrayList<BulletWater>();
  lifeBullets = new ArrayList<BulletLife>();
  particles = new ArrayList<Particle>();

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

  pauseScreen = new PauseMenu();
  gameOverScreen = new GameOver();


  BonusCoin = new Coin();
  //points you have at the start of the game
  points = 0;
}

void draw() {

  switch(gameMode) {
  case 0: 
    mainMenuScreen.mainMenuScreen();
    mainMenuScreen.draw();
    break;
  case 1:
    gameOverScreen.gameOverScreen();
    gameOverScreen.draw();
    break;
  case 2:
  
    // If the game is paused, don't show the rest of the game
    if (!isPauseGame) {
      // Draw classes
      backgroundLevel.draw();
      backgroundLevel.drawSun();   
      backgroundLevel.drawClouds();
      backgroundLevel.drawGrass();

      BonusCoin.update();
      BonusCoin.draw();

      BoolObs.Check();

      Wind.update();
      Wind.draw();

      myPlayer.update();
      myPlayer.draw();

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
      }
      for (int i = 0; i < particles.size(); i++) {
        Particle p = particles.get(i);

        p.update();
      }
    } else {
      pauseScreen.pauseMenu();
      pauseScreen.draw();
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
