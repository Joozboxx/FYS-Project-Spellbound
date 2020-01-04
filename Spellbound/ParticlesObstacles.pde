class Particle {
  float x;
  float y;
  float xvel;
  float yvel;
  float size;
  //colors: red,green,nlue
  float r, g, b;



  Particle(float x, float y, float xvel, float yvel, float size) {
    this.x = x;
    this.y = y;
    this.xvel = xvel;
    this.yvel = yvel;
    this.size = size;
  }


  void update() {
    particlecolor();
    //colors (UwU)
    stroke(0, 100);
    fill(r, g, b);

    //shape of particles
    ellipse(this.x, this.y, size, size);


    //how much particles goes to the right
    this.x+= this.xvel ;
    this.xvel +=2;

    //how much particles goes down
    this.y+=this.yvel;
  }

  void particlecolor() {
    if (EnemyWater.blueparticles) {
      r=38;
      g=148;
      b=241;
    }

    if (EnemyFire.redparticles) {
      r=255;
      g=0;
      b=0;
    }

    if (EnemyLife.greenparticles) {
      r=0;
      g=255;
      b=0;
    }

    if (EnemyEarth.yellowparticles) {
      r=250;
      g=200;
      b=20;
    }
  }
}
