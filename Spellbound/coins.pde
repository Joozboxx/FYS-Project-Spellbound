class Coin {

  // The coin will only spawn if Bonus is true, so at the start of the game it will not spawn
  boolean Bonus= false;
  PImage CoinIm = loadImage("coin.png");
  float CoinX, CoinY, CoinSize;
  float rotation;
  // Decides the speed of the rotation
  float rotationSpeed = 1.3;
  int multiplier = 1;

  Coin() {
    CoinX = width+width/10;
    CoinY = random(100, 800);
    CoinSize = 100;
  }
  void draw() {
    // The coin will only spawn on 12 or a multiplication of 12
    if (points == 12 * multiplier) {
      Bonus = true;
    }
  }

  void rotationimage() {
    // Rotates the Coin
    pushMatrix();

    translate(CoinX-100, CoinY);

    rotate(radians(rotation));
    rotation -= rotationSpeed;
    image(CoinIm, CoinIm.width/2-380, CoinIm.height/2-380, CoinSize, CoinSize);


    popMatrix();
  }

  void update() {
    collision();

    // If the Bonus is true: do this
    if (Bonus) {
      // Speed from Coin
      CoinX-=38;
      // Calls void that creates the coin
      rotationimage();
    }
  }

  void collision() {
    // If the player hits the coin, the coin spawns at the beginning of the right side, despawns and gives you 5 points
    if ((myPlayer.xPlayer + myPlayer.PlayerSizeW >= CoinX)
      &&(myPlayer.xPlayer <= CoinX + CoinSize)
      &&(myPlayer.yPlayer+myPlayer.PlayerSizeH >= CoinY)
      &&(myPlayer.yPlayer<=CoinY + CoinSize))
    {
      CoinX = width+width/10;
      CoinY = random(100, 800);
      Bonus = false;
      points +=5;
      multiplier++;
    }

    // If the coin does not get hit, it will despawn and be set at the beginning of the right side of the screen
    if (CoinX < 0-CoinSize) {

      CoinX = width+width/10;
      CoinY = random(100, 800);
      Bonus = false;
      multiplier++;
    }
  }
}
