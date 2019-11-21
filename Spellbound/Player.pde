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
      
      if(vy >= 20){
      vy = 20;
    }
  }

    
  void edge() {
    // Border of player movement
    if (y > border-150) {
      y = border-150;
    } else if (y < 50) {
      y = 50;
    }
  }
  
  
  void collide(){
    if(checkCollision()){
     fill(255,0,0,90);
     rect(0,0,1920,1080);
    }
  }
  
  boolean checkCollision(){
  
    //checks if the player hits the obstacle
     if((xPlayer + PlayerSizeW >= EnemyFire.xfire)
     &&(xPlayer  <=EnemyFire.xfire +EnemyFire.xSize)
     &&(y+PlayerSizeH >= EnemyFire.yfire )
     &&(y<=EnemyFire.yfire + EnemyFire.ySize))
    {
      return true;
    }
     //checks if the player hits the obstacle
     if((xPlayer + PlayerSizeW >= EnemyWater.xwater)
     &&(xPlayer  <=EnemyWater.xwater +EnemyWater.xSize)
     &&(y+PlayerSizeH >= EnemyWater.ywater)
     &&(y<=EnemyWater.ywater + EnemyWater.ySize))
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
