class Player {

  // Player variables
  float xPlayer, yPlayer, PlayerSizeH, PlayerSizeW, playerSpeed, border;
  boolean [] keys = new boolean[512];
  PImage player = loadImage("spellboundplayer.png");
  float lastShot = 0;
  float bulletCooldown = 2000;
  boolean ableToFire;
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
    textSize(32);
    
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

      yPlayer -= playerSpeed;
    if (keys['s'])
      yPlayer += playerSpeed;

    if (playerSpeed >= 20) {
      playerSpeed = 20;
    }
    if (EnemyFire.xfire + EnemyFire.xSize < 0 && EnemyWater.xwater + EnemyWater.xSize < 0 && EnemyLife.xlife + EnemyLife.xSize < 0 && EnemyEarth.xearth + EnemyEarth.xSize < 0) {
      myPlayer.playerSpeed *= 1.02;
      println("increasing speed!!");
      println(myPlayer.playerSpeed);
    }
    
      fill(186, 55, 100);
  textSize(32);
  text("obstacles hit:" + points, 10, 50);
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
      setup();
    }
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

  // checks if 2 seconds have gone by since the last bullet was shot
  boolean cooldown(){
  
    println("lastshot = " + lastShot);
    println("millis = " + millis());
    if( lastShot < millis() - bulletCooldown){
      lastShot = millis();
      return true;
    }
    return false;
  }
  // Get keyboard input
  void keyPressed() {
    keys[key] = true;
    if (key == 'p'&& cooldown()) {
      new FireBullet().fire(0, 8);
      
    }
    if (key == 'l'&& cooldown()) {
      new EarthBullet().fire(0, 8);
      
    }
    if (key == 'k'&& cooldown()) {
      new LifeBullet().fire(0, 8);
      
    }
    if (key == 'o'&& cooldown()) {
      new WaterBullet().fire(0, 8);
      
    }
  }

  void keyReleased() {
    keys[key] = false;
  }
}
