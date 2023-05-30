//Object a;
//Particles p;
//int x0 = 50;
//int y0 = 500;
//void setup() {
//  size(600, 600);
//  a = new Object(x0, y0);
//  p = new Particles(x0, y0);
//  noLoop();
//}

//void draw() {
//  if (pressing == true)
//    p.particles();
//  if (pressing == false && a.x < width && a.y < height) {
//    println(pressing);
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
    angle = radians(80);
    
  }
  
  // methods
  void object() {
    stroke(#939393);
    fill(#FFFFFF);
    circle(x, y - d / 2, d);
  }
  
  //int n = 0;
  void launchUpdate(float t0, int dir) {
    t = (millis() - t0) / (float) 100; // speed of animation 75
    if (dir == 1)
      x = x0 + vx * t;
     else 
      x = x0 - vx * t;
    y = y0 - (vy * t - 0.5 * g * t * t);
  }
  
  boolean isOn(float xf, float yf) {
    if (x > xf - 4 && x < xf + 4
        && y > yf - 4 && y < yf + 4)
      return true;
    else
      return false;
  }
}

//boolean pressing = true;
//float counter = 0; 
//void keyPressed() {
//  a.v = 30;
//  pressing = true;
//  counter += 0.5;
//  loop();
//}

//float t0 = 0;
//void keyReleased() {
//  pressing = false;
//  a.x0 = x0;
//  a.y0 = y0;
//  a.x = x0;
//  a.y = y0;
  
//  a.v += counter;
//  counter = 0;
//  t0 = millis();
//  a.vx = a.v * cos(a.angle);
//  a.vy = a.v * sin(a.angle);
  
//}
