class Player {

  // Player variables
  float x, y, big, vy, gravity, border;
  boolean [] keys = new boolean[256];

  //Setup player variables
  Player() {
    x = width/10;
    y = 300;
    big = 50;
    vy = 5;
    gravity = 1.005;
    border = 450;
  }

  void draw() {
    // Draw the player shape
    fill(0);
    rect(x, y, big, big);
  }

  void update() {
    // Handle player
    move();
    edge();
    y = y * gravity;
  }

  void move() {
    // Move the player with keyboard keys
    if (keys['w'])
      y -= vy;
    if (keys['s'])
      y += vy;
  }

  void edge() {
    if (y > border) {
      y = border;
    } else if (y < 0) {
      y = 0;
    }
  }

  void keyPressed() {
    keys[key] = true;
  }

  void keyReleased() {
    keys[key] = false;
  }
}
