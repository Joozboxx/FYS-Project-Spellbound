class PauseMenu {

  // Load images
  PImage pauseMenuScreen = loadImage("Pause Menu.png");

  // Pause menu variable
  float pauseMenuPosition = 0;

  void draw() {
    pauseMenu();
  }

  void pauseMenu() {
    // Draw pause menu screen image
    image(pauseMenuScreen, pauseMenuPosition, pauseMenuPosition);
  }
}
