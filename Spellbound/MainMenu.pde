class MainMenu {

  // Load images
  PImage mainMenuScreen = loadImage("Main Menu Screen.png");
  PImage play = loadImage("Play.png");
  PImage controls = loadImage("Controls.png");
  PImage options = loadImage("Options.png");

  // Allows us to use all keys of they keyboard without the game crashing
  boolean [] keys = new boolean[1024];

  // Button variable
  int currentButton = 0;

  // Main menu variables
  float positionX = 0;
  float positionY = 0;

  void draw() {
    handleKeyboardInput();
    mainMenuScreen();
  }

  void mainMenuScreen() {
    // Draws the menu layer
    image(mainMenuScreen, positionX, positionY);

    if (currentButton == 0) {
      image(play, positionX, positionY);
    } else if (currentButton == 1) {
      image(controls, positionX, positionY);
    } else if (currentButton == 2) {
      image(options, positionX, positionY);
    }
  }

  void handleKeyboardInput() {
    if (keys[UP] && currentButton > 0) {
      currentButton --;
      keyReleased();
    }
    if (keys[DOWN] && currentButton < 2) {
      currentButton ++;
      keyReleased();
    }
    if (keys[ENTER]) {
      keyReleased();
      if (currentButton == 0) {
        gameMode = 3;
      } else if (currentButton == 1) {
        gameMode = 2;
      } else if (currentButton == 2) {
        image(options, positionX, positionY);
      }
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
