class Player {

  // Player variables
  float xPlayer, yPlayer, PlayerSizeH, PlayerSizeW, playerSpeed, border;
  boolean [] keys = new boolean[1024];
  PImage player = loadImage("spellboundplayer.png");
  float lastShot = 0;
  float bulletCooldown = 800;
  boolean ableToFire;
  //Setup player variables
  Player() {

    xPlayer = width/10;
    yPlayer = height/2;
    PlayerSizeH = 200;
    PlayerSizeW = 250;
    playerSpeed = 12;
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
    
    // Adds 1 point when you hit an obstacle
    fill(186, 55, 100);
    textSize(32);
    textAlign(CENTER);
    text("OBSTACLES HIT: " + points, width/2, 50);
  }

  void move() {
    // Move the player with keyboard keys
    //87 is w
    if (keys[87])
      yPlayer -= playerSpeed;

    if (keys[83])
      yPlayer += playerSpeed;

    if (playerSpeed >= 20) {
      playerSpeed = 20;
    }
  /*  if (EnemyFire.xfire + EnemyFire.xSize < 0 || EnemyWater.xwater + EnemyWater.xSize < 0 || EnemyLife.xlife + EnemyLife.xSize < 0 || EnemyEarth.xearth + EnemyEarth.xSize < 0) {
      myPlayer.playerSpeed *= 1.01;
      println("increasing speed!!");
      println(myPlayer.playerSpeed);
    }*/
  }

  // Calls the bullets to fire with the appropriate key
  void shotsfired() {
    /*switch(keyCode)
     {
     case 80: cooldown:
     new FireBullet().fire(0, 8);
     break;
     case 76: cooldown:
     new EarthBullet().fire(0, 8);
     break;
     case 75: cooldown:
     new LifeBullet().fire(0, 8);
     break;
     case 79: cooldown:
     new WaterBullet().fire(0, 8);
     break;
     default:
     }*/

    if (keyCode == 76&& cooldown()) {
      new BulletFire().fire(0, 8);
    }
    if (keyCode == 75&& cooldown()) {
      new BulletEarth().fire(0, 8);
    }
    if (keyCode == 74&& cooldown()) {
      new BulletLife().fire(0, 8);
    }
    if (keyCode == 73&& cooldown()) {
      new BulletWater().fire(0, 8);
    }
    if (keyCode == 72&& cooldown()) {
      setup();
      gameIsOver = false;
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
      gameIsOver=true;
    }
  }

  // Checks if 2 seconds have gone by since the last bullet was shot
  boolean cooldown() {
    if ( lastShot < millis() - bulletCooldown) {
      lastShot = millis();
      return true;
    }
    return false;
  }


  boolean checkCollision() {

    // Checks if the player hits the obstacle
    if ((xPlayer + PlayerSizeW >= EnemyFire.xfire)
      &&(xPlayer <= EnemyFire.xfire + EnemyFire.xSize)
      &&(yPlayer+PlayerSizeH >= EnemyFire.yfire )
      &&(yPlayer<=EnemyFire.yfire + EnemyFire.ySize))
    {
      return true;
    }
    // Checks if the player hits the obstacle
    if ((xPlayer + PlayerSizeW >= EnemyWater.xwater)
      &&(xPlayer <= EnemyWater.xwater + EnemyWater.xSize)
      &&(yPlayer+PlayerSizeH >= EnemyWater.ywater)
      &&(yPlayer<=EnemyWater.ywater + EnemyWater.ySize))
    {
      return true;
    }
    // Checks if the player hits the obstacle
    if ((xPlayer + PlayerSizeW >= EnemyLife.xlife)
      &&(xPlayer <= EnemyLife.xlife + EnemyLife.xSize)
      &&(yPlayer+PlayerSizeH >= EnemyLife.ylife)
      &&(yPlayer<=EnemyLife.ylife + EnemyLife.ySize))
    {
      return true;
    }
    // Checks if the player hits the obstacle
    if ((xPlayer + PlayerSizeW >= EnemyEarth.xearth)
      &&(xPlayer <= EnemyEarth.xearth + EnemyEarth.xSize)
      &&(yPlayer+PlayerSizeH >= EnemyEarth.yearth)
      &&(yPlayer<=EnemyEarth.yearth + EnemyEarth.ySize))
    {
      return true;
    }
    return false;
  }


  // Get keyboard input
  void keyPressed() {
    keys[keyCode] = true;
    shotsfired();
  }


  void keyReleased() {
    keys[keyCode] = false;
  }
}
