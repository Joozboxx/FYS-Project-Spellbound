class GameOver {
 
  // Load image
  PImage gameOver = loadImage("Game Over Screen.png");
  
  // Game Over variable
  float gameOverPosition = 0;
  float textPositionX = width/2;
  float testPositionY = height/2 + 85;
  
  void draw() {
    gameOverScreen();
  }

  void gameOverScreen() {
    image(gameOver, gameOverPosition, gameOverPosition);
    
    textAlign(CENTER);
    // Points text shade
    fill(255);
    textSize(70);
    text(points, textPositionX - 5, testPositionY);
    // Points text
    fill(247,147,30);
    textSize(70);
    text(points, textPositionX, testPositionY);
  }
}
