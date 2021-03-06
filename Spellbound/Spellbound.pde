import ddf.minim.*;

// Variables
Background backgroundLevel;
Player myPlayer;
PlayerLives Lives;

ObstacleFire EnemyFire;
ObstacleWater EnemyWater;
ObstacleLife EnemyLife;
ObstacleEarth EnemyEarth;
ObstacleWall EnemyWall;
booleanObs BoolObs;

PauseMenu pauseScreen;
GameOver gameOverScreen;
MainMenu mainMenuScreen;
Controls controlsScreen;
WindEffect Wind;
RestartGame Restart;

// Sound variable
Minim minim;
AudioPlayer backgroundMusic;



// Array lists bullets
ArrayList<BulletFire> fireBullets ;
ArrayList<BulletEarth> earthBullets ;
ArrayList<BulletLife> lifeBullets ;
ArrayList<BulletWater> waterBullets ;
// Array list for all particle effects you get after hitting an obstacle
ArrayList<Particle> particles;

boolean isPauseGame = false;
int gameMode = 0;

Coin BonusCoin;
int points;

void setup() {
  // Set window size
  size(1920, 1080, P3D);
  frameRate(60);

  // Load background music
  minim = new Minim(this);
  backgroundMusic = minim.loadFile("Background Music.mp3");
  //Play background music & loop it
  backgroundMusic.loop();


  backgroundLevel = new Background();
  mainMenuScreen = new MainMenu();
  controlsScreen = new Controls();
  pauseScreen = new PauseMenu();
  gameOverScreen = new GameOver();
  Restart = new RestartGame();

  myPlayer = new Player();
  Lives = new PlayerLives();
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

  BonusCoin = new Coin();
  // Points you have at the start of the game
  points = 0;
}

void draw() {

  switch(gameMode) {
  case 0: 
    // Switch to main menu
    mainMenuScreen.mainMenuScreen();
    mainMenuScreen.draw();
    break;
  case 1:
    // Switch to game over screen
    gameOverScreen.gameOverScreen();
    gameOverScreen.draw();
    break;
  case 2:
    // Switch to control screen
    controlsScreen.controlsScreen();
    controlsScreen.draw();
    break;
  case 3:
    // If the game is paused, don't show the rest of the game
    if (!isPauseGame) {
      // Draw classes
      backgroundLevel.draw();
      backgroundLevel.drawSun();   
      backgroundLevel.drawClouds();
      backgroundLevel.drawGrass();

      BonusCoin.update();
      BonusCoin.draw();

      Lives.update();
      Lives.draw();

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
        p.draw();
      }
    } else {
      pauseScreen.pauseMenu();
      pauseScreen.draw();
    }
    break;
  }
}

void keyPressed() {
  myPlayer.keyPressed();
  mainMenuScreen.keyPressed();
  controlsScreen.keyPressed();

  // If spacebar is pressed, pause the game. And if spacebar released, start the game
  if (keyCode == 32) {
    isPauseGame = !isPauseGame;
  }

  // Restarts the game after you press H
  if (keyCode == 72) {
    Restart.restart();
    gameMode = 3;
  }
}

void keyReleased() {
  myPlayer.keyReleased();
  mainMenuScreen.keyReleased();
  controlsScreen.keyReleased();
}
