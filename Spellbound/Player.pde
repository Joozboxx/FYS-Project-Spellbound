class Player {

  // Player variables
  float xPlayer, yPlayer, PlayerSizeH, PlayerSizeW, vy, border;
  boolean [] keys = new boolean[256];
  PImage player = loadImage("spellboundplayer.png");
  //Setup player variables
  Player() {

    xPlayer = width/10;
    yPlayer = height/2;
    PlayerSizeH = 200;
    PlayerSizeW = 250;
    vy = 10;
    border = height-(PlayerSizeH-100);
  }

  void draw() {
    // Draw the player shape
    fill(0);
    image(player, xPlayer, yPlayer, PlayerSizeW, PlayerSizeH);
  }


  void update() {
    // Handle player
    move();
    edge();
    collide();
  }


  void move() {
    // Move the player with keyboard keys
    if (keys['w'])
      yPlayer -= vy;
    if (keys['s'])
      yPlayer += vy;
    if(vy >= 20){
    vy = 20;
    }
  }


  void edge() {
    // Border of player movement
    if (yPlayer > border-150) {
      yPlayer = border-150;
    } else if (yPlayer < 50) {
      yPlayer = 50;
    }
  }


  void collide() {
    if (checkCollision()) {
      fill(255, 0, 0, 90);
      rect(0, 0, 1920, 1080);
    }
  }

  boolean checkCollision() {

    //checks if the player hits the obstacle
    if ((xPlayer + PlayerSizeW >= EnemyFire.xfire)
      &&(xPlayer <= EnemyFire.xfire + EnemyFire.xSize)
      &&(yPlayer+PlayerSizeH >= EnemyFire.yfire )
      &&(yPlayer<=EnemyFire.yfire + EnemyFire.ySize))
    {
      return true;
    }
    //checks if the player hits the obstacle
    if ((xPlayer + PlayerSizeW >= EnemyWater.xwater)
      &&(xPlayer <= EnemyWater.xwater + EnemyWater.xSize)
      &&(yPlayer+PlayerSizeH >= EnemyWater.ywater)
      &&(yPlayer<=EnemyWater.ywater + EnemyWater.ySize))
    {
      return true;
    }
    return false;
  }


  // Get keyboard input
  void keyPressed() {
    keys[key] = true;
  }

  void keyReleased() {
    keys[key] = false;
  }
}
