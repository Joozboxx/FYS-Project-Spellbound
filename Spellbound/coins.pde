class Coin {


boolean Bonus= false;
  PImage CoinIm = loadImage("coin.png");
  float CoinX, CoinY, CoinSize;
  float rotation;
  float rotationSpeed = 1.3;

  Coin() {
    CoinX = width+width/10;
    CoinY = height/2;
    CoinSize = 100;
  }
  void draw() {
    if(points>10){
      Bonus = true;
    }
 
  }

  void update() {
    
    if (Bonus){
   CoinX-=20;

    // Makes sure that rotation is only applied to sun
    pushMatrix();

    translate(CoinX-100, CoinY);

    // Rotate sun
    rotate(radians(rotation));
    rotation -= rotationSpeed;
    image(CoinIm, CoinIm.width/2-380, CoinIm.height/2-380, CoinSize, CoinSize);

    // Makes sure that rotation is only applied to sun
    popMatrix();


    if (CoinY >= height) {
      CoinY = height;
    }
    
    if(CoinY <= 0) {
      CoinY = 0;
    }
    
    if (CoinX < 0-CoinSize) {
      CoinX = width+width/2;
    }
  }
  }
}
