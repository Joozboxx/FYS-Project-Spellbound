class WindEffect {

  //wind fx
  float [] windX = new float [15];
  float []windY = new float [15];
  float windSize = 200;

  WindEffect() {

    //wind fx
    for (int i =0; i < windX.length; i++) {
      windX[i] = random(width, width+500);
    }

    for (int i =0; i < windY.length; i++) {
      windY[i] = random(50, 1000);
    }
  }

  void draw() {

    if (myPlayer.playerSpeed >= 30) {

      //wind fx
      for (int i =0; i < windY.length; i++) {

        strokeWeight(5);
        stroke(185, 255, 255, 60);

        line(windX[i], windY[i], windX[i]+windSize, windY[i]);
      }
    }
  }

  void update() {

    //wind effect 
    for (int i = 0; i < windX.length; i++) {
      windX[i]-= 30;

      if (windX[i]+windSize <= -400) {

        windX[i] = random(width, width + 500);

        windY[i] = random(50, 800);
      }
    }
  }
}
