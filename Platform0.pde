public class Platform{
  // fields
  float x;
  float y;
  float l;
  float h;
  int dir;
  int d;
  float angle = radians(32);
  int currentH;
  int hue;
  
  // constructors
  Platform(float x, float y, float l, float h, int dir, int d) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
    this.dir = dir;
    this.d = d;
    currentH = 0;
    hue = int(random(120)) * 3;
  }
  
  Platform(float x, float y, float l, float h, int dir, int d, int hue) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
    this.dir = dir;
    this.d = d;
    currentH = 0;
    this.hue = hue;
  }
  
  // methods
  void newXY() {
    if (dir == 1)
      x = x + d * cos(angle);
    else 
      x = x - d * cos(angle);
    y = y - d * sin(angle);
  }
  
  void platform() {
    // top
    float diag1 = l * cos(angle);
    float diag2 = l * sin(angle);
    noStroke();
    colorMode(HSB, 360, 100, 100);
    fill(hue, 28, 98); // #B7FFFA
    quad(x + diag1, y, x, y - diag2, x - diag1, y, x, y + diag2);
    
    // left
    fill(hue, 58, 95); // #6AFAEF
    quad(x, y + diag2, x, y + diag2 + h, x - diag1, y + h, x - diag1, y);
    
    // right
    fill(hue, 58, 90); // #65DED4
    quad(x, y + diag2, x, y + diag2 + h, x + diag1, y + h, x + diag1, y);
    colorMode(RGB, 255, 255, 255);
  }
  
  boolean rise() {
    Platform a = new Platform(x, y + (h - currentH), l, currentH, dir, d, hue);
    if (currentH < h) {
      a.platform();
      currentH++;
      return true;
    }
    else {
      return false;
    }
  }
}
