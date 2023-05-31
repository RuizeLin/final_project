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
  
  // constructors
  Platform(float x, float y, float l, float h, int dir, int d) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = h;
    this.dir = dir;
    this.d = d;
    currentH = 0;
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
    fill(#B7FFFA);
    quad(x + diag1, y, x, y - diag2, x - diag1, y, x, y + diag2);
    
    // left
    fill(#6AFAEF);
    quad(x, y + diag2, x, y + diag2 + h, x - diag1, y + h, x - diag1, y);
    
    // right
    fill(#65DED4);
    quad(x, y + diag2, x, y + diag2 + h, x + diag1, y + h, x + diag1, y);
  }
  
  boolean rise() {
    //Platform newp = p[p.length - 1];
    Platform a = new Platform(x, y + (h - currentH), l, currentH, dir, d);
    if (currentH < h) {
      background(c);
      a.platform();
      
      currentH++;
      return true;
    }
    else
      return false;
  }
  
}
