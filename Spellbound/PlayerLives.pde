class PlayerLives {

  float [] liveX = {30, 115, 200};
  float liveSizeW = 65, liveSizeH = 50;
  int lifeCount = 3;

  PImage heartlives = loadImage("heart.png");


  void draw() {
    for (int i =0; i < lifeCount; i++) {
      fill(255, 0, 0);
      image(heartlives, liveX[i], 20, liveSizeW, liveSizeH);
    }
  }  

  void update() {
    for (int i =0; i < liveX.length; i++) {

      if (lifeCount <1) {
        gameMode = 1;
      }
    }
  }
}
