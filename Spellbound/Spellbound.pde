Player myPlayer;
ObstacleFire EnemyFire;
ObstacleWater EnemyWater;
ObstacleLife EnemyLife;
Background backgroundLevel;

void setup() {
  //Set window size
  size(1920,1080,P2D);
  myPlayer = new Player();
  EnemyFire = new ObstacleFire();
  EnemyWater = new ObstacleWater();
  EnemyLife = new ObstacleLife();
  backgroundLevel = new Background();
 
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
  
  text(round(frameRate),10,20);
}

void keyPressed() {
  myPlayer.keyPressed();
}

void keyReleased() {
  myPlayer.keyReleased();
}
