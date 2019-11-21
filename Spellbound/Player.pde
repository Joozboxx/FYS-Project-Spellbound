class Player {

  // Player variables
  float xPlayer, y, PlayerSizeH,PlayerSizeW, vy, border;
  boolean [] keys = new boolean[256];
  PImage player = loadImage("spellboundplayer.png");
  //Setup player variables
  Player() {
    
    xPlayer = width/10;
    y = height/2;
    PlayerSizeH = 200;
    PlayerSizeW = 250;
    vy = 10;
    border = height-(PlayerSizeH-100);
  }

  void draw() {
    // Draw the player shape
    fill(0);
    image(player,xPlayer,y,PlayerSizeW,PlayerSizeH);

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
    if (y > border-100) {
      y = border-100;
    } else if (y < 0) {
      y = 0;
    }
  }
  
  
  void collide()
  {
    
    if(checkCollision()){
     
     fill(255,0,0,90);
     rect(0,0,1920,1080);
    }
  }
  boolean checkCollision(){
  
     if((xPlayer + PlayerSizeW >= Enemy.xfire)
     &&(xPlayer  <=Enemy.xfire +Enemy.xSize)
     &&(y+PlayerSizeH >= Enemy.yfire )
     &&(y<=Enemy.yfire + Enemy.xSize))
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
