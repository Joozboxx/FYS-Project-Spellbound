class Coin {


  boolean Bonus= false;
  PImage CoinIm = loadImage("coin.png");
  float CoinX, CoinY, CoinSize;
  float rotation;
  float rotationSpeed = 1.3;
  int multiplier = 1;

  Coin() {
    CoinX = width+width/10;
    CoinY = random(100, 800);
    CoinSize = 100;
  }
  void draw() {
    if (points == 12 * multiplier) {
      Bonus = true;
    }
  }

  void rotationimage() {
    //Rotates the Coin
    pushMatrix();

    translate(CoinX-100, CoinY);


    rotate(radians(rotation));
    rotation -= rotationSpeed;
    image(CoinIm, CoinIm.width/2-380, CoinIm.height/2-380, CoinSize, CoinSize);

    // Makes sure that rotation is only applied to sun
    popMatrix();
  }

  void update() {
    collision();

    if (Bonus) {
      // speed from Coin
      CoinX-=40;
      // calls void that creates the coin
      rotationimage();
    }
  }





  void collision() {
    //if the player hits the coin, the coin spawns at the beginning of the right side, despawns and gives you 5 points
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

    // if the coin does not get hit, it will despawn and be set at the beginning of the right side of the screen
    if (CoinX < 0-CoinSize) {
      CoinX = width+width/10;
      CoinX = width+width/10;
      CoinY = random(100, 800);
      Bonus = false;
      multiplier++;
    }
  }
}
