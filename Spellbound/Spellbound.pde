Player myPlayer;
Obstacle Enemy;
Background backgroundLevel;

void setup() {
  //Set window size
  size(1920,1080,P2D);
  myPlayer = new Player();
  Enemy = new Obstacle();
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
  Enemy.draw();
  Enemy.update();
  
  text(round(frameRate),10,20);
}

void keyPressed() {
  myPlayer.keyPressed();
}

void keyReleased() {
  myPlayer.keyReleased();
}
