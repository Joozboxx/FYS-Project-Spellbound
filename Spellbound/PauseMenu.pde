class PauseMenu {
 
 void draw() {
  pauseMenu(); 
 }
 
 void pauseMenu(){
   fill(0);
   rect(0,0,1920,1080); 
   
   textAlign(CENTER);
   fill(255);
   textSize(150);
   text("PAUSE",width/2,height/2+75);
 }
}
