class Controls {

  // Load image 
  PImage controls = loadImage("Controls Screen.png");

  // Allows us to use all keys of they keyboard without the game crashing
  boolean [] keys = new boolean[1024];

  // Controls variable
  float controlsPosition = 0;

  void draw() {
    handleKeyboardInput();
    controlsScreen();
  }

  void controlsScreen () {
    // Draws control screen image
    image(controls, controlsPosition, controlsPosition);
  }

  void handleKeyboardInput() {
    // If LEFT key is pressed, go to main menu & release key to prevent the next button from being selected
    if (keys[LEFT]) {
      keyReleased();
      gameMode = 0;
    }
  }

  // Get keyboard input
  void keyPressed() {
    keys[keyCode] = true;
  }

  void keyReleased() {
    keys[keyCode] = false;
  }
}
