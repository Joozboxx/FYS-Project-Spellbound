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
   
   //fill(0,15);
   //rect(0,0,1920,1080); 
   
  // textAlign(CENTER);
  // fill(255);
  // textSize(150);
   //text("PAUSE",width/2,height/2+75);
 }
}
