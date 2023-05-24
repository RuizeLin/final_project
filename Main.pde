Platform start = new Platform(600, 600, 100, 50, 1, 0);
Platform olderp = start;
Platform oldp = start;
Platform newp;
float l0 = 80 + random(6) * 10;
float h0 = 40 + random(8) * 5;

void setup() {
  size(1200, 800);
  start.platform();
}

void draw() {

}


void generatePlatform() {
  newp = new Platform(oldp.x, oldp.y, 50 + random(10) * 10, 40 + random(8) * 5, (int) random(2), 5 + (int) random(oldp.l / 4, oldp.l / 4 + 20) * 5);
  newp.updatePlatform();
  newp.platform();
  oldp.platform();
  olderp.platform();
  olderp = oldp;
  oldp = newp;
  
}

void moveCamera(Platform olderp, Platform oldp) {
  int dx = 0;
  int dy = 100;
  pushMatrix();
  background(255);
  translate(dx, dy);
  generatePlatform();
  updateXY(dx, dy);
  popMatrix();
}

void updateXY(int dx, int dy) {
  newp.x += dx;
  newp.y += dy;
}

void keyPressed() {
  //generatePlatform(); 
  //float t = millis();
  //if (millis() > t + 1000)
    moveCamera(olderp, oldp);
  
}
