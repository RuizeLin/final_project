PShape s;

void setup() {
  size(600, 800, P2D);
  
  s = createShape();
  s.beginShape();
  s.vertex(30, 75);
  s.vertex(40, 20);
  s.vertex(50, 75);
  s.vertex(60, 20);
  s.vertex(70, 75);
  s.vertex(80, 20);
  s.vertex(90, 75);
  s.endShape();
}

void draw() {
  rectPrism(20, 20, 0, 100, 100);
}

void rectPrism(int diag1, int diag2, int h, float x, float y) {
  float d1 = (float) diag1 / 2;
  float d2 = (float) diag2 / 4;
  //top
  quad(x + d1, y, x, y - d2, x - d1, y, x, y + d2);
  
  //right side
  quad(x + d1, y, x + d1, y + h, x, y + d2 + h, x, y + d2);
  
}
