public class Platform{
  // fields
  float l;
  float h;
  int dir;
  int d;
  
  // constructors
  Platform(float l, float h, int dir, int d) {
    this.l = l;
    this.h = 20;
    this.dir = dir;
    this.d = d;
  }
  
  // methods
  void cube() {
    float x;
    if (dir == 1)
      x = width / 2 + d * cos(PI / 5.5);
    else 
      x = width / 2 - d * cos(PI / 5.5);
    float y = height / 2 - d * sin(PI / 5.5);
    
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
