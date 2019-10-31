class Player{
 
  float x,y,big,vy,gravity,border;
  boolean [] keys = new boolean[128];
  
  //player
  Player(){
    x = width/10;
    y = 300;
    big = 50;
    vy = 5;
    gravity = 1.005;
    border = 450;
  }
  
  void draw(){
    background(250,100,250);
    fill(0);
    rect(x,y,big,big);
}

  void update(){
     move();
     edge();
     y = y * gravity;
  }

  void move(){
    if(keys['w'])
    y -= vy;
    if(keys['s'])
    y += vy; 
  }
  
  void edge(){
    if(y > border){
   y = border;
    }
    else if(y < 0){
    y = 0;
    }
  }
  
  void keyPressed(){
    keys[key] = true;
  }
  
  void keyReleased(){
    keys[key] = false;
  }

}
