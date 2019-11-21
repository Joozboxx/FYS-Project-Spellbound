class ObstacleWater{
 
  float xwater,ywater,xSize,ySize,speed;
  PImage fire = loadImage("elementfire.png");
  ObstacleWater(){
    xwater = width/2;
    ywater = height/2;
    xSize = 65;
    ySize = 400;
    speed = 15;
  }
  
  void draw(){
  fill(255,0,0);
  image(fire,xwater,ywater,xSize,ySize);
  }
 
  
  void update(){
    xwater -= speed; 
    
  
    if(xwater < 0){
      xwater = width+30;
      ywater = random(50,height/2);
      speed *=1.05;
      myPlayer.vy *= 1.05;
    }
    if(myPlayer.vy >= 20){
    myPlayer.vy = 20;
    }
    if(speed >= 35){
      speed = 35;
      
    }

}
}
