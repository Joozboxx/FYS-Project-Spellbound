class Particle{
  float x;
  float y;
  float xvel;
  float yvel;
  float size;

  
  
  Particle(float x, float y, float xvel, float yvel, float size){
    this.x = x;
    this.y = y;
    this.xvel = xvel;
    this.yvel = yvel;
    this.size = size;
    
  }
  
  
  void update(){
    strokeWeight(2);
    stroke(38,148,241);
    fill(0,0,250);
    //how much it goes to the right
    this.x+= this.xvel ;
    this.xvel +=3;
//how much it goes down
    this.y+=this.yvel;
    this.yvel+=.1;
    //shape of particles
    rect(this.x,this.y,20,20);
  }
 
}
