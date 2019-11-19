class Background{
  
  // Load images
  PImage backgroundLayer = loadImage("Background.png");
  PImage grass = loadImage("Grass.png");
  PImage cloud = loadImage("Cloud.png");
  PImage sun = loadImage("Sun.png");
  PImage dragon = loadImage("Dragon/Dragon.png");
  PImage wingFront = loadImage("Dragon/Wing Front.png");
  PImage wingBack = loadImage("Dragon/Wing Back.png");
  
  // Dragon variables
  float dragonX = 650;
  float dragonY = 200;
  
  // Sun variables
  float sunX = 1280;
  float sunY = 120;
  float rotation;
  float rotationSpeed = 0.2;
  
  void draw(){
    // Draw the background layer
    image(backgroundLayer,0,0);
    
    // Draw the grass
    image(grass,0,height-grass.height+1);
    
    // Draw the clouds
    image(cloud,75,30);
    image(cloud,1580,30,cloud.width*1.1,cloud.height*1.1);
    
    // Draw the sun
    drawSun();
    
    // Draw the dragon
    image(wingBack,dragonX + 48,dragonY - 117);
    image(dragon,dragonX,dragonY);
    image(wingFront,dragonX + 83,dragonY - 123);
  }
  
 void drawSun(){
   // Makes sure that rotation is only applied to sun
   pushMatrix();
   
   // Translate to sun position
   translate(sunX,sunY);
   
   // Rotate sun
   rotate(radians(rotation));
   rotation += rotationSpeed;
   
   // Draw the sun
   image(sun,-sun.width/2,-sun.height/2);
   
   // Makes sure that rotation is only applied to sun
   popMatrix();
 }
}
