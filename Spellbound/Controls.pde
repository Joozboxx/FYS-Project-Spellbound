class Controls {
  
  // Load image 
  PImage controls = loadImage("Controls Screen.png");
  
  // Controls variable
  float controlsPosition = 0;
  
  void draw(){
    controlsScreen();
  }
  
  void controlsScreen () {
    // Draws control screen image
    image(controls, controlsPosition, controlsPosition);
  }
}
