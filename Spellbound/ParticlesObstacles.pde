class Particle {
  float x;
  float y;
  float xvel;
  float yvel;
  float size;
  //colors: red,green,nlue
  float r,g,b;



  Particle(float x, float y, float xvel, float yvel, float size) {
    this.x = x;
    this.y = y;
    this.xvel = xvel;
    this.yvel = yvel;
    this.size = size;
  }


  void update() {
    //colors (UwU)
    stroke(0,100);
    fill(r, g, b);
    
    //how much particles goes to the right
    this.x+= this.xvel ;
    this.xvel +=2;
    
    //how much particles goes down
    this.y+=this.yvel;
  
    
    //shape of particles
    ellipse(this.x, this.y, size, size);
    
    elementcolors();
  }
  
  void elementcolors(){
    if(BoolObs.fire){
      r=255;
      g=0;
      b=0;
    }
    if(BoolObs.water){
      r=38;
      g=148;
      b=241;
    }
    if(BoolObs.life){
      r=0;
      g=255;
      b=0;
    }
    if(BoolObs.earth){
      r=30;
      g=160;
      b=0;
    }
  }
}
