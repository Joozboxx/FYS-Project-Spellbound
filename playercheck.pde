Player myPlayer;

void setup(){
  size(800,600);
  myPlayer = new Player();
}

void draw(){
  myPlayer.draw();
  myPlayer.update();
 
}

  void keyPressed(){
   myPlayer.keyPressed();
    
  }
  
  void keyReleased(){
    myPlayer.keyReleased();
  }
