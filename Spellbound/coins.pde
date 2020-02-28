class Coin {

  // The coin will only spawn if Bonus is true, so at the start of the game it will not spawn
  boolean Bonus= false;
  PImage CoinIm = loadImage("coin.png");
  float CoinX, CoinY, CoinSize,PointSpawn, neutralPosition,CoinSpeed;
  float coinStart, coinEnd;
  int BonusPoints =5;
  // rotates the coin
  float rotation;
  // Decides the speed of the rotation
  float rotationSpeed = 1.3;
  int multiplier = 1;

  Coin() {
    CoinX = width+width/10;
    CoinY = random(100, 800);
    CoinSize = 100;
    PointSpawn = 12;
    neutralPosition = 380;
    CoinSpeed = 40;
    coinStart = 100;
    coinEnd = 800;
  }
  void draw() {
    // The coin will only spawn on 12 or a multiplication of 12
    if (points == PointSpawn * multiplier) {
      Bonus = true;
    }
  }

  void rotationimage() {
    // Rotates the Coin
    pushMatrix();

    translate(CoinX-100, CoinY);

    rotate(radians(rotation));
    rotation -= rotationSpeed;
    image(CoinIm, CoinIm.width/2-neutralPosition, CoinIm.height/2-neutralPosition, CoinSize, CoinSize);


    popMatrix();
  }

  void update() {
    collision();

    // If the Bonus is true: do this
    if (Bonus) {
      // Speed from Coin
      CoinX-=CoinSpeed;
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
      CoinY = random(coinStart, coinEnd);
      Bonus = false;
      points +=BonusPoints;
      multiplier++;
    }

    // If the coin does not get hit, it will despawn and be set at the beginning of the right side of the screen
    if (CoinX < 0-CoinSize) {

      CoinX = width+width/10;
      CoinY = random(coinStart, coinEnd);
      Bonus = false;
      multiplier++;
    }
  }
}
