class Player {

  // Player variables

  float xPlayer, yPlayer, PlayerSizeH, PlayerSizeW, playerSpeed, border;

 

  boolean [] keys = new boolean[256];
  PImage player = loadImage("spellboundplayer.png");
  //Setup player variables
  Player() {

    xPlayer = width/10;
    yPlayer = height/2;
    PlayerSizeH = 200;
    PlayerSizeW = 250;

    playerSpeed = 10;


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
    if (keys['p']){
    
          bullet.fire(0, 8);
    }
  }


  void move() {
    // Move the player with keyboard keys
    if (keys['w'])

      yPlayer -= playerSpeed;
    if (keys['s'])
      yPlayer += playerSpeed;
      
      if(playerSpeed >= 20){
      playerSpeed = 20;
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
