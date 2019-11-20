class Obstacle{
 
  float xfire,yfire,xSize,ySize,speed;
  PImage fire = loadImage("elementfire.png");
  Obstacle(){
    xfire = width+30;
    yfire = height/2;
    xSize = 80;
    ySize = 400;
    speed = 15;
  }
  
  void draw(){
  fill(255,0,0);
  image(fire,xfire,yfire,xSize,ySize);
  }
 
  
  void update(){
    xfire -= speed; 
    
  
    if(xfire < 0){
      xfire = width+30;
      yfire = random(50,height/2);
      speed *=1.05;
    }

}
}
