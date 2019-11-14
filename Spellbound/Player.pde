class Player {

  // Player variables
  float x, y, big, vy, border;
  boolean [] keys = new boolean[256];
  PImage photo;

  //Setup player variables
  Player() {
    x = width/10;
    y = 200;
    big = 150;
    vy = 5;
    border = 450;
    photo = loadImage("spellboundplayer.png");
  }

  void draw() {
    // Draw the player shape
    fill(0);
    image(photo,x,y,big,big);
  }

  void update() {
    // Handle player
    move();
    edge();
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
  
    // Get keyboard input
  void keyPressed() {
    keys[key] = true;
  }

  void keyReleased() {
    keys[key] = false;
  }
}
