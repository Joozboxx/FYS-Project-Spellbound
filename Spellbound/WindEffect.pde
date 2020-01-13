class WindEffect {

  // Wind FX
  float [] windX = new float [20];
  float []windY = new float [20];
  float windSize = 200;

  WindEffect() {

    // Decides the x position of the wind lines
    for (int i =0; i < windX.length; i++) {
      windX[i] = random(width, width+500);
    }
    // Decides the y position of the wind lines
    for (int i =0; i < windY.length; i++) {
      windY[i] = random(50, 1000);
    }
  }

  void draw() {
    // If the player reaches a the maximum player Speed, make the wind effect 
    if (myPlayer.playerSpeed >= myPlayer.playerSpeedCap) {

      // Wind fx
      for (int i =0; i < windY.length; i++) {
        // Red, green, blue and opacity
        stroke(185, 255, 255, 30);

        line(windX[i], windY[i], windX[i]+windSize, windY[i]);
      }
    }
  }

  void update() {

    // Wind effect 
    for (int i = 0; i < windX.length; i++) {
      //windspeed moving 
      windX[i]-= 30;
      // If the complete wind line reaches the border: respawn it at the right side of the border with a random y position
      if (windX[i]+windSize <= 0) {

        windX[i] = random(width, width+width/2);

        windY[i] = random(50, 800);
      }
    }
  }
}
