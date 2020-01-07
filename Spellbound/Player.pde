class Player {

  // Player variables
  float xPlayer, yPlayer, PlayerSizeH, PlayerSizeW, playerSpeed, border;
  float xShadow, y, floating, d, angle;
  boolean [] keys = new boolean[1024];
  PImage player = loadImage("spellboundplayer.png");
  float lastShot = 0;
  float bulletCooldown = 900;
  boolean ableToFire;


  //wind fx
  float [] windX = new float [15];
  float []windY = new float [15];
  float windSize = 200;



  //Setup player variables
  Player() {

    xPlayer = width/10;
    yPlayer = height/2;
    PlayerSizeH = 200;
    PlayerSizeW = 250;
    playerSpeed = 12;
    border = height-(PlayerSizeH-100);
    xShadow = width/10;

    //wind fx
    for (int i =0; i < windX.length; i++) {
      windX[i] = random(width, width+500);
    }

    for (int i =0; i < windY.length; i++) {
      windY[i] = random(50, 1000);
    }
  }



  // Draws the player shape
  void draw() {

    //player
    image(player, xPlayer, yPlayer-floating, PlayerSizeW, PlayerSizeH);

    //shadow under player
    ellipseMode(CORNER);
    noStroke();
    fill(20, 120);
    ellipse(xShadow, 980, 0.9*(d), 0.04*d);
    
    
//calls void tween
    tween(width/10, 0);
  }

//tweening for the player (up and down "animation")
  void tween(float tempX, float tempY) {
    //float for player(meaning,meaning,meaning)
    floating = sin(angle)*(250)*0.07;
    //speed of float(up and down)
    angle += 0.03;


    y = tempY;
    // tweening for shadow
    pushMatrix();
    translate(xShadow, y);
    //tweening size for shadow(meaning,meanign,emeainign,meanign)
    d = dist(xShadow, 200, xShadow+(yPlayer*0.257), floating); 
    popMatrix();
  }

  void update() {
    // Handle player
    move();
    edge();
    collide();
    cap();





    for (int i = 0; i < windX.length; i++)
    {
      windX[i]-= 30;

      if (windX[i]+windSize <= -400) {

        windX[i] = random(width, width + 500);

        windY[i] = random(50, 800);
      }
    }//wind effect   




    // Adds 1 point when you hit an obstacle
    fill(186, 55, 100);
    textSize(32);
    textAlign(CENTER);
    text("OBSTACLES HIT: " + points, width/2, 50);
  }





  void move() {
    //if you press UP/W you go up, otherwise you will slowly go down
    if (keys[87]) {
      yPlayer -= playerSpeed;
    } else {
      yPlayer +=0.8;
    }
    //if you press DOWN/S you go down, otherwise you will slowly go down
    if (keys[83]) {
      yPlayer += playerSpeed;
    } else {
      yPlayer +=0.8;
    }
  }

  void cap() {


    //playerspeed cap, for moving is 20
    if (playerSpeed >= 30) {
      playerSpeed = 30;


      //wind fx
      for (int i =0; i < windY.length; i++) {

        strokeWeight(5);
        stroke(185, 255, 255, 60);

        line(windX[i], windY[i], windX[i]+windSize, windY[i]);
      }
    }
  }

  // Calls the bullets to fire with the appropriate key
  void shotsfired() {

    //fire bullet activates after you press L
    if (keyCode == 76&& cooldown()) {
      new BulletFire().fire(0, 15);
    }
    //earth bullet activates after you press K
    if (keyCode == 75&& cooldown()) {
      new BulletEarth().fire(0, 15);
    }
    //life bullet activates after you press J
    if (keyCode == 74&& cooldown()) {
      new BulletLife().fire(0, 15);
    }
    //water bullet activates after you press I
    if (keyCode == 73&& cooldown()) {
      new BulletWater().fire(0, 15);
    }

    //restarts the game after you press H
    if (keyCode == 72&& cooldown()) {
      setup();
      gameIsOver = false;
    }
  }

  void edge() {
    // Border of player movement
    if (yPlayer > border-250) {
      yPlayer = border-250;
    } else if (yPlayer < 50) {
      yPlayer = 50;
    }
  }

  void collide() {
    if (checkCollision()) {
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
    // Checks if the player hits the obstacle wall
    if ((xPlayer + PlayerSizeW >= EnemyWall.xwall)
      &&(xPlayer <= EnemyWall.xwall + EnemyWall.xSize)
      &&(yPlayer+PlayerSizeH >= EnemyWall.ywall)
      &&(yPlayer<=EnemyWall.ywall + EnemyWall.ySize))
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
