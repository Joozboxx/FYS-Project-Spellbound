class PauseMenu {
 
 // Load images
 PImage pauseMenuScreen = loadImage("Pause Menu.png");
 
 // Pause menu variable
 float pauseMenuPosition = 0;
 
 void draw() {
  pauseMenu(); 
 }
 
 void pauseMenu(){
   image(pauseMenuScreen, pauseMenuPosition, pauseMenuPosition);
 }
}
