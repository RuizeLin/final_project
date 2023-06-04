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
    angle = radians(75);
    
  }
  
  // methods
  void object() {
    noStroke();
    fill(#FFFFFF);
    circle(x, y - d / 2, d);
  }
  
  float alpha = 0;
  boolean objectSetup() {
    if (alpha <= 255) {
      noStroke();
      fill(#FFFFFF, alpha);
      circle(x, y - d / 2, d);
      alpha += 5;
      return false;
    }
    else {
      return true;
    }
  }
  
  void launchUpdate(float t0, int dir) {
    t = (millis() - t0) / (float) 100;
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
  
  void shadow() {
    noStroke();
    fill(#999999, 128);
    ellipse(x + 7, y + 3, 40, 20);
  }
}
