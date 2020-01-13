class Player {

  // Player variables
  float xPlayer, yPlayer, PlayerSizeH, PlayerSizeW, playerSpeed, playerSpeedCap, border;
  PImage player = loadImage("spellboundplayer.png");
  // Variables for the tweening effect of the player and shadow
  float xShadow, yShadow, floating, distance, angle, drop, floatchange, shadowtweenx, shadowtweeny;
  // Allows us to use all keys of they keyboard without the game crashing
  boolean [] keys = new boolean[1024];
  float lastShot = 0;
  // amount of milisecond the bullet cooldown will be
  float bulletCooldown = 900;
  float bulletSpeed =15;
  boolean ableToFire;
  // Score variables
  float scorePositionX = 1860;
  float scorePositionY = 77;
  // Sound
  AudioPlayer shootSound;

  // Setup player variables
  Player() {

    xPlayer = width/10;
    yPlayer = height/2;
    PlayerSizeH = 200;
    PlayerSizeW = 250;
    playerSpeed = 9;
    border = height-(PlayerSizeH-100);
    xShadow = width/10;
    playerSpeedCap = 30;
    // Load magic wand sound
    shootSound = minim.loadFile("Magic Wand.mp3");
  }
 

  // Draws the player shape
  void draw() {

    // Player
    image(player, xPlayer, yPlayer-floating, PlayerSizeW, PlayerSizeH);

    shadowtweenx = 0.9;
    shadowtweeny = 0.04;
    // Shadow under player
    ellipseMode(CORNER);
    noStroke();
    fill(20, 120);
    ellipse(xShadow, 980, shadowtweenx*(distance), shadowtweeny*distance);

    // Calls void tween
    tween(width/10, 0);
  }

  // Tweening for the player (up and down "animation")
  void tween(float tempX, float tempY) {
    drop = 250;
    floatchange = 0.07;
    //float for player(meaning,how low you can go,how high and low you can go)
    floating = sin(angle)*(drop)*floatchange;
    //speed of float(up and down)
    angle += 0.03;

    yShadow = tempY;
    // Tweening for shadow
    pushMatrix();
    translate(xShadow, yShadow);
    // Tweening size for shadow(widthSize(resizes according to the X position of the player),widthSize(doesnt make the tweening visible),widthSize(doesnt change the tweening),size of the shadow in general)
    distance = dist(xShadow, 200, xShadow+(yPlayer*0.257), floating); 
    popMatrix();
  }

  void update() {
    // Handle player
    move();
    cap();
    edge();

    // Adds 1 point when you hit an obstacle
    textAlign(CENTER);
    // Score text shade
    fill(255);
    textSize(50);
    text(points, scorePositionX - 4, scorePositionY);
    // Score text
    fill(247, 147, 30);
    textSize(50);
    text(points, scorePositionX, scorePositionY);
  }

  void move() {
    // If you press UP/W you go up, otherwise you will slowly go down
    if (keys[87]) {
      yPlayer -= playerSpeed;
    } else {
      yPlayer +=0.8;
    }
    // If you press DOWN/S you go down, otherwise you will slowly go down
    if (keys[83]) {
      yPlayer += playerSpeed;
    } else {
      yPlayer +=0.8;
    }
  }

  void cap() {
    // Playerspeed cap, for moving is 20
    if (playerSpeed >= playerSpeedCap) {
      playerSpeed = playerSpeedCap;
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

  // Calls the bullets to fire with the appropriate key
  void shotsfired() {

    // Fire bullet activates after you press L
    if (keyCode == 76&& cooldown()) {
      new BulletFire().fire(0, bulletSpeed);
    }
    // Earth bullet activates after you press K
    if (keyCode == 75&& cooldown()) {
      new BulletEarth().fire(0, bulletSpeed);
    }
    // Life bullet activates after you press J
    if (keyCode == 74&& cooldown()) {
      new BulletLife().fire(0, bulletSpeed);
    }
    // Water bullet activates after you press I
    if (keyCode == 73&& cooldown()) {
      new BulletWater().fire(0, bulletSpeed);
    }
  }

  // Checks if the amount of seconds (lastShot) have gone by since the last bullet was shot
  boolean cooldown() {
    if ( lastShot < millis() - bulletCooldown) {
      lastShot = millis();
      // Play shoot bullet sound & restart the sound every time you want to shoot a bullet
      shootSound.play(0);
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
