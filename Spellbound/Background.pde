class Background {

  // Load images
  PImage backgroundLayer = loadImage("Background.png");
  PImage grassOne = loadImage("Grass.png"); 
  PImage grassTwo = loadImage("Grass.png");
  PImage cloudOne = loadImage("Cloud.png");
  PImage cloudTwo = loadImage("Cloud.png");
  PImage sun = loadImage("Sun.png");
  PImage dragon = loadImage("Dragon/Dragon.png");
  PImage wingFront = loadImage("Dragon/Wing Front.png");
  PImage wingBack = loadImage("Dragon/Wing Back.png");

  // Dragon variables
  float dragonX = 650;
  float dragonY = 200;

  // Sun variables
  float sunX = 1280;
  float sunY = 120;
  float rotation;
  float rotationSpeed = 0.2;

  // Cloud variables
  float cloudOneX = 75;
  float cloudOneY = 30;
  float cloudTwoX = 1250;
  float cloudTwoY = 30;
  float cloudOneSpeed = 3; 
  float cloudTwoSpeed = 3;

  // Grass variables
  float grassOneX = 0; 
  float grassTwoX = grassOneX + grassOne.width;

  void draw() {
    // Draw the background layer
    image(backgroundLayer, 0, 0);

    // Draw the grass
    drawGrass();
    
    // Move the grass
    grassOneX -= 4;
    grassTwoX -= 4;

    // Draw the clouds
    drawClouds();

    // Move the clouds
    cloudOneX += cloudOneSpeed;
    cloudTwoX += cloudTwoSpeed;

    // Draw the sun
    drawSun();

    // Draw the dragon
    image(wingBack, dragonX + 48, dragonY - 117);
    image(dragon, dragonX, dragonY);
    image(wingFront, dragonX + 83, dragonY - 123);
  }

  void drawSun() {
    // Makes sure that rotation is only applied to sun
    pushMatrix();

    // Translate to sun position
    translate(sunX, sunY);

    // Rotate sun
    rotate(radians(rotation));
    rotation += rotationSpeed;

    // Draw the sun
    image(sun, -sun.width/2, -sun.height/2);

    // Makes sure that rotation is only applied to sun
    popMatrix();
  }

  void drawClouds() {
    // If cloud one is within the screen size, move to the left
    if (cloudOneX > 0 || cloudOneX < width) {
      image(cloudOne, cloudOneX, cloudOneY);
      cloudOneSpeed *= -1;
    }

    // If cloud one moves past the left side of the screen, go to the width of the screen
    if (cloudOneX < 0 - 275 || cloudOneX > width) {
      image(cloudOne, cloudOneX, cloudOneY);
      cloudOneX = width;
    }

    // If cloud two is within the screen size, move to the left
    if (cloudTwoX > 0 || cloudTwoX < width) {
      image(cloudTwo, cloudTwoX, cloudTwoY, cloudTwo.width*1.1, cloudTwo.height*1.1);
      cloudTwoSpeed *= -1;
    }

    // If cloud two moves past the left side of the screen, go to the width of the screen
    if (cloudTwoX < 0 - 300 || cloudTwoX > width) {
      image(cloudTwo, cloudTwoX, cloudTwoY, cloudTwo.width*1.1, cloudTwo.height*1.1);
      cloudTwoX = width;
    }
  }

  void drawGrass() {
    // If grass one moves past 0, add grass two
    if (grassOneX + grassOne.width < 0) {
      grassOneX = grassTwoX + grassTwo.width;  
    }
    
    // If grass two moves past 0, add grass one
    if (grassTwoX + grassTwo.width < 0) {
      grassTwoX = grassOneX + grassOne.width;
    }
    
    // Draw the grass
    image(grassOne, grassOneX, height-grassOne.height+1);
    image(grassTwo, grassTwoX, height - grassOne.height+1);
  }
}
