class ObstacleWater{
 
  float xwater,ywater,xSize,ySize,speed;
  PImage water = loadImage("elementwater.png");
  ObstacleWater(){
    xwater = width;
    ywater = height/2;
    xSize = 65;
    ySize = 400;
    speed = 15;
  }
  
  void draw(){
  fill(255,0,0);
  image(water,xwater,ywater,xSize,ySize);
  }
 
  
  void update(){
    xwater -= speed; 
    
  
    if(xwater < 0){
      xwater = width+30;
      ywater = random(50,height-350);
      speed *=1.05;
      myPlayer.vy *= 1.02;
    }
    
    if(speed >= 35){
      speed = 35;
      
    }

}
}
