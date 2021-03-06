class Particle {
  float particleX;
  float particleY;
  float HorizontalSpread;
  float VerticalSpread;
  float size;
  // Colors: red, green, blue
  float r, g, b;
  // Float which decrease the color, making it darker.
  float colordecrease = 50;
  // Border which particles will not be able to reach
  float particleborder = 300;

  Particle(float particleX, float particleY, float HorizontalSpread, float VerticalSpread, float size) {
    this.particleX = particleX;
    this.particleY = particleY;
    this.HorizontalSpread = HorizontalSpread;
    this.VerticalSpread = VerticalSpread;
    this.size = size;
  }

  void draw() {
    particlecolor();
    // Colors
    strokeWeight(5);
    // Makes the outline of the particles a little darker(red, blue,green,opacity)
    stroke(r-colordecrease, g-colordecrease, b-colordecrease, colordecrease);
    fill(r, g, b);
    // Shape of particles
    ellipse(particleX, particleY, size, size);
  }
  
    void update() {
    // How much particles goes to the right
    particleX+= HorizontalSpread ;
    HorizontalSpread +=2;

    // How much particles goes down
    particleY+=VerticalSpread;

    // Clears the particles after its reached this horizontal position
    if (particleX >= width-particleborder) {
      particles.clear();
    }
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
