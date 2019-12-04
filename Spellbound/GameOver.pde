class GameOver {

  void draw() {
    gameOverScreen();
  }

  void gameOverScreen() {
    fill(0);
    rect(0, 0, 1920, 1080);
    
    textAlign(CENTER);
    fill(255);
    textSize(150);
    text("GAME OVER", width/2, height/2);

    fill(255);
    textSize(32);
    text("You had " + points + " points", width/2, height/2 + 100);
    
    fill(255);
    textSize(32);
    text("Press H or START to restart the game", width/2, height/2 + 200);
  }
}
