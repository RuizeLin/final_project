void setup() {
  size(600, 800);
  cube(1, 0);
}

int k = 0;

void draw() {

}



void generatePlatform() {

  cube(-1, (int) random(20) * 5);
  cube(1, 0);
}

void cube(int dir, int d) {
  float x;
  if (dir == 1)
    x = 300 + d * cos(PI / 6);
  else 
    x = 300 - d * cos(PI / 6);
  float y = 600 - d * sin(PI / 6);
  
  float l = 80 + random(6) * 10;
  float h = 40 + random(8) * 5;
  
  // top
  float diag1 = l * cos(PI / 6);
  float diag2 = l * sin(PI / 6);
  quad(x + diag1, y, x, y - diag2, x - diag1, y, x, y + diag2);
  
  // left
  quad(x, y + diag2, x, y + diag2 + h, x - diag1, y + h, x - diag1, y);
  
  // left
  quad(x, y + diag2, x, y + diag2 + h, x + diag1, y + h, x + diag1, y);
  
  pushMatrix();
  translate(0, y + h);
  popMatrix();
}

void keyPressed() {
  generatePlatform();
}
