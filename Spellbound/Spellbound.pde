Player myPlayer;
Obstacle Enemy;

void setup() {
  //Set window size
  size(1920,1080);
  myPlayer = new Player();
  Enemy = new Obstacle();
}

void draw() {
  //Set background color
  background(150, 100, 250);

  // Draw player class
  myPlayer.draw();
  myPlayer.update();
  Enemy.draw();
  Enemy.update();
}

void keyPressed() {
  myPlayer.keyPressed();
}

void keyReleased() {
  myPlayer.keyReleased();
}
