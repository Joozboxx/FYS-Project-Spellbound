class Background {

  // Load images
  PImage backgroundLayer = loadImage("Background.png");
  PImage grassOne = loadImage("Grass.png"); 
  PImage grassTwo = loadImage("Grass.png");
  PImage cloudOne = loadImage("Cloud.png");
  PImage cloudTwo = loadImage("Cloud.png");
  PImage sun = loadImage("Sun.png");
  PImage dragon = loadImage("Dragon Compleet.png");
  PImage pause = loadImage("Pause.png");
  PImage score = loadImage("Score.png");

  // Score variable
  float scorePosition = 0;

  // Pause variables
  float pausePosition = 0;

  // Dragon variables
  float dragonPosition = 0;

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
  float cloudOneSpeed = 2; 
  float cloudTwoSpeed = 1.7;
  float backgroundPosition = 0;

  // Grass variables
  float grassOneX = 0; 
  float grassTwoX = grassOneX + grassOne.width;
  float grassSpeed = 10;
  float grassSpeedmultiplier = 1.03;

  void draw() {   
    // Draw the background layer
    image(backgroundLayer, backgroundPosition, backgroundPosition);

    // Draw the grass
    drawGrass();

    // Move the grass
    grassOneX -= grassSpeed;
    grassTwoX -= grassSpeed;

    // Draw the pause menu layer
    image(pause, pausePosition, pausePosition);

    // Drae the score layer
    image(score, scorePosition, scorePosition);

    // Draw the clouds
    drawClouds();

    // Move the clouds
    cloudOneX += cloudOneSpeed;
    cloudTwoX += cloudTwoSpeed;

    // Draw the sun
    drawSun();

    // Draw the dragon
    image(dragon, dragonPosition, dragonPosition);

    // Makes the screen shake when the earth obstacle has been hit

    if ( EnemyEarth.screenShakeTimer > 0) {
      //sets the amount the screen will shake

      float shakeAmount = 15;

      // Makes it so shake is only applies to the background
      pushMatrix();
      translate(this.backgroundPosition, this.backgroundPosition);

      // Shakes the dragon and background
      image(backgroundLayer, shakeAmount, shakeAmount);
      image(dragon, shakeAmount, shakeAmount);

      // Lowers the time that the screen is shaking
      EnemyEarth.screenShakeTimer--;

      // Reverts the background to its normal position
      popMatrix();
    }

    // Makes the screen shake when the fire obstacle has been hit
    if ( EnemyFire.screenShakeTimer > 0) {
      //sets the amount the screen will shake
      float shakeAmount = 15;

      // Makes it so shake is only applies to the background
      pushMatrix();
      translate(this.backgroundPosition, this.backgroundPosition);

      // Shakes the dragon and background
      image(backgroundLayer, shakeAmount, shakeAmount);
      image(dragon, shakeAmount, shakeAmount);

      // Lowers the time that the screen is shaking
      EnemyFire.screenShakeTimer--;

      // Reverts the background to its normal position
      popMatrix();
    }

    // Makes the screen shake when the life obstacle has been hit
    if ( EnemyLife.screenShakeTimer > 0) {
      //sets the amount the screen will shake
      float shakeAmount = 15;

      // Makes it so shake is only applies to the background
      pushMatrix();
      translate(this.backgroundPosition, this.backgroundPosition);

      // Shakes the dragon and background
      image(backgroundLayer, shakeAmount, shakeAmount);
      image(dragon, shakeAmount, shakeAmount);

      // Lowers the time that the screen is shaking
      EnemyLife.screenShakeTimer--;

      // Reverts the background to its normal position
      popMatrix();
    }

    // Makes the screen shake when the water obstacle has been hit
    if ( EnemyWater.screenShakeTimer > 0) {
      //sets the amount the screen will shake
      float shakeAmount = 15;

      // Makes it so shake is only applies to the background
      pushMatrix();
      translate(this.backgroundPosition, this.backgroundPosition);

      // Shakes the dragon and background
      image(backgroundLayer, shakeAmount, shakeAmount);
      image(dragon, shakeAmount, shakeAmount);

      // Lowers the time that the screen is shaking
      EnemyWater.screenShakeTimer--;

      // Reverts the background to its normal position
      popMatrix();
    }
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
    // If grass one moves past 0, add grass two and speed grass up
    if (grassOneX + grassOne.width < 0) {
      grassOneX = grassTwoX + grassTwo.width;  
      grassSpeed *= grassSpeedmultiplier;
    }

    // If grass two moves past 0, add grass one and speed grass up
    if (grassTwoX + grassTwo.width < 0) {
      grassTwoX = grassOneX + grassOne.width;
      grassSpeed *= grassSpeedmultiplier;
    }

    // Cap speed of grass
    if (grassSpeed >= 30) {
      grassSpeed = 30;
    }

    // Draw the grass
    image(grassOne, grassOneX, height-grassOne.height+1);
    image(grassTwo, grassTwoX, height - grassOne.height+1);
  }
}
