public class Platform{
  // fields
  float x;
  float y;
  float l;
  float h;
  int dir;
  int d;
  
  // constructors
  Platform(float x, float y, float l, float h, int dir, int d) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.h = 20;
    this.dir = dir;
    this.d = d;
  }
  
  // methods
  void updatePlatform() {
    if (dir == 1)
      x = x + d * cos(PI / 5.5);
    else 
      x = x - d * cos(PI / 5.5);
    y = y - d * sin(PI / 5.5);
  }
  
  void cube() {
    // top
    float diag1 = l * cos(PI / 5.5);
    float diag2 = l * sin(PI / 5.5);
    quad(x + diag1, y, x, y - diag2, x - diag1, y, x, y + diag2);
    
    // left
    quad(x, y + diag2, x, y + diag2 + h, x - diag1, y + h, x - diag1, y);
    
    // left
    quad(x, y + diag2, x, y + diag2 + h, x + diag1, y + h, x + diag1, y);
  }
}
