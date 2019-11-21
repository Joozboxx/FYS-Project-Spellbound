class ObstacleLife{
 
  float xlife,ylife,xSize,ySize,speed;
  PImage life = loadImage("elementlife.png");
  ObstacleLife(){
    xlife = width;
    ylife = height+height;
    xSize = 65;
    ySize = 400;
    speed = 15;
  }
  
  void draw(){
  fill(255,0,0);
  image(life,xlife,ylife,xSize,ySize);
  }
 
  void update(){
    xlife -= speed; 
    
  
    if(xlife < 0){
      xlife = width+30;
      ylife = random(50,height-350);
      speed *=1.05;
      myPlayer.vy *= 1.01;
    }
    
    if(speed >= 35){
      speed = 35;
      
    }

}
}
