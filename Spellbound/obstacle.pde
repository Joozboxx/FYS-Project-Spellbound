class Obstacle{
 
  float xred,y,xSize,ySize,speed;
  
  Obstacle(){
    xred = width;
    
    xSize = 40;
    y = random(100, height/2);
    ySize = 300;
    speed = 15;
  }
  
  void draw(){
  fill(255,0,0);
  rect(xred,y,xSize,ySize);
  }
 
  
  void update(){
    xred -= speed; 
    
  
    if(xred < 0){
      xred = width+30;
      y = random(100,height - ySize);
    }

}
}
