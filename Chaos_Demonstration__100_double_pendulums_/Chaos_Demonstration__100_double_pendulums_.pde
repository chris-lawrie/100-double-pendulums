// Code adapted from Dan Shiffman's double pendulum code
// https://github.com/CodingTrain

int num = 100; 
float diff = 0.008; 
ArrayList<DoublePendulum> pendulums;
PGraphics canvas; 
boolean restart = true;
PFont f;

void setup() {
  size(800,800); 
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(0);
  canvas.endDraw();
  pendulums = new ArrayList<DoublePendulum>();
  f = createFont("Arial",16,true);

}


void draw() {
  background(0);
  //imageMode(CORNER);
 // image(canvas, 0, 0, width, height);
  
  if(restart == true){
    int a = 1;
    restart = false;
    while(a<num) {
      pendulums.add(new DoublePendulum(a,num, diff, width/2, height/2 - 100));
      a++; 
    
    }
  }
 
  for (int i = 0; i < pendulums.size()-1; i++){
    DoublePendulum p = pendulums.get(i); 
    p.display(); 
  }
  
  textFont(f,16);  
  text("Diff = " + str(diff) + " rad", width - 150, height - 50); 
  text(str(num) + " pendulums", width - 150, height - 30); 

}
