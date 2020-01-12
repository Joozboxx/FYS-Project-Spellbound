class MainMenu {

  // Load images
  PImage mainMenuScreen = loadImage("Main Menu Screen.png");
  
  // Main menu variables
  float mainMenuX = 0;
  float mainMenuY = 0;
  
  void draw() {
    mainMenuScreen();
  }

  void mainMenuScreen() {
    // Draw the menu layer
    image(mainMenuScreen, mainMenuX, mainMenuY);
  }
}
