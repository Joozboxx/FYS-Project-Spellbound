class Player {

  // Player variables
  float xPlayer, y, PlayerSize, vy, border;
  boolean [] keys = new boolean[256];
  PImage player = loadImage("spellboundplayer.png");
  boolean onHit = true;
  //Setup player variables
  Player() {
    
    xPlayer = width/10;
    y = height/2;
    PlayerSize = 300;
    vy = 10;
    border = height-(PlayerSize-100);
  }

  void draw() {
    if(onHit = true){
    // Draw the player shape
    fill(0);
    image(player,xPlayer,y,PlayerSize,PlayerSize);

  }
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
      y -= vy;
    if (keys['s'])
      y += vy;
  }

    
  void edge() {
    // Border of player movement
    if (y > border) {
      y = border;
    } else if (y < 0) {
      y = 0;
    }
  }
  
  
  void collide()
  {
    
    if(checkCollision()){
     onHit = false;
     println("bob");
     background(0);
    }
  }
  boolean checkCollision(){
  
    if((xPlayer + PlayerSize > Enemy.xred )&&  (xPlayer < Enemy.xred + Enemy.xSize) && (y + PlayerSize > Enemy.y )&&( y < Enemy.y + Enemy.xSize)){
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
