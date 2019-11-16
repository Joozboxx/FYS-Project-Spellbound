Player myPlayer;

void setup() {
  //Set window size
  size(1920,1080);
  myPlayer = new Player();
}

void draw() {
  //Set background color
  background(250, 100, 250);

  // Draw player class
  myPlayer.draw();
  myPlayer.update();
}

void keyPressed() {
  myPlayer.keyPressed();
}

void keyReleased() {
  myPlayer.keyReleased();
}
