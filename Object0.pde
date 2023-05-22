Object a;

//void setup() {
//  size(600, 600);
//  a = new Object(50, 550);
//  noLoop();
//}

//void draw() {
//  if (a.x < width && a.y < height) {
//    a.launchUpdate();
//  }
//}

public class Object{
  
  // fields
  float x; // x position
  float y; // y position
  int d ;// diameter of object
  
  int x0; // initial x position
  int y0; // initial y position
  float t; // time
  float v; // initial velocity
  float angle; // launch angle
  final float g = 9.81; // gravity
  
  float vx;
  float vy;
  
  // constructors
  Object(int x, int y) {
    this.x = x;
    this.y = y;
    d = 50;
    
    x0 = x;
    y0 = y;
    t = 0;
    v = 30;
    angle = radians(70);
    
  }
  
  // methods
  void create() {
    // x, y, w, h
    circle(x, y, d);
  }
  
  int n = 0;
  void launchUpdate() {
    t = (millis() - t0) / (float) 100; // speed of animation 75
    //background(255);
    println(a.x + ", " + a.y);
    if (n != 1)
      create();
    x = x0 + vx * t;
    y = y0 - (vy * t - 0.5 * g * t * t);
    n++;
  }
  
  
  void chargeUpdate() {
    //circle(
  }
}

float counter = 0;
void keyPressed() {
  a.v = 30;
  counter += 0.5;
}

float t0 = 0;
void keyReleased() {
  a.v += counter;
  counter = 0;
  t0 = millis();
  a.vx = a.v * cos(a.angle);
  a.vy = a.v * sin(a.angle);
  loop();
}