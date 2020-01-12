class MainMenu {

  // Load images
  PImage mainMenuScreen = loadImage("Main Menu Screen.png");
  PImage play = loadImage("Play.png");
  PImage controls = loadImage("Controls.png");
  PImage options = loadImage("Options.png");
  
  int currentButton = 0;
 
  // Main menu variables
  float positionX = 0;
  float positionY = 0;
  
  void draw() {
    mainMenuScreen();
  }

  void mainMenuScreen() {
    // Draws the menu layer
    image(mainMenuScreen, positionX, positionY);
    image(play, positionX, positionY);
  }
}
