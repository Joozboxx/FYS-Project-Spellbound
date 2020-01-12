class PlayerLives {
  // X-position of the hearts
  float [] liveX = {30, 115, 200};
  // Width and Height of the hearts
  float liveSizeW = 65, liveSizeH = 50;
  // Amount of lifes
  int lifeCount = 3;

  PImage heartlives = loadImage("heart.png");


  void draw() {
    // Makes the lifes, and gives an amount to the lifes.
    for (int i =0; i < lifeCount; i++) {
      fill(255, 0, 0);
      image(heartlives, liveX[i], 20, liveSizeW, liveSizeH);
    }
  }  

  void update() {
    // If your amount of Lives becomes less than one, the game will be switched to gameMode 1, which is the game over screen
    for (int i =0; i < liveX.length; i++) {

      if (lifeCount <1) {
        gameMode = 1;
      }
    }
  }
}
