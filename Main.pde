Platform start = new Platform(150, 600, 100, 50, 1, 0);
Platform olderp = start;
Platform oldp = start;
Platform newp;
float l0 = 80 + random(6) * 10;
float h0 = 40 + random(8) * 5;
//(150, 400)
//(450, 600)


void setup() {
  size(600, 800);
  start.platform();
}

void draw() {

}


void generatePlatform() {
  //newp = new Platform(oldp.x, oldp.y, 50 + random(10) * 10, 40 + random(8) * 5, (int) random(2), 5 + (int) random(oldp.l / 4, oldp.l / 4 + 20) * 5);
  newp.updatePlatform();
  newp.platform();
  oldp.platform();
  olderp.platform();
  olderp = oldp;
  oldp = newp;
  
}

//void moveCamera(Platform olderp, Platform oldp) {
//  int dx = 0;
//  int dy = 100;
//  pushMatrix();
//  background(255);
//  translate(dx, dy);
//  generatePlatform();
  
//  newp = new Platform(oldp.x, oldp.y, 50 + random(10) * 10, 40 + random(8) * 5, (int) random(2), 5 + (int) random(oldp.l / 4, oldp.l / 4 + 20) * 5);
  
//  updateXY(dx, dy);
//  popMatrix();
//}

// when ball touch new platform, set it to oldp
void moveCamera() {
  int dir = int(random(2));
  float dx, dy;
  background(255);
  if (dir == 0) {
    // move to 450, 600
    dx = 450 - oldp.x;
    dy = 600 - oldp.y;
    updateXY(dx, dy);
    newp = new Platform(oldp.x, oldp.y, 50 + random(10) * 10, 40 + random(8) * 5, dir, 5 + (int) random(oldp.l / 4, oldp.l / 4 + 20) * 5);
    generatePlatform();
  }
  else {
    // move to 150, 600
    dx = 150 - oldp.x;
    dy = 600 - oldp.y;
    updateXY(dx, dy);
    newp = new Platform(oldp.x, oldp.y, 50 + random(10) * 10, 40 + random(8) * 5, (int) random(2), 5 + (int) random(oldp.l / 4, oldp.l / 4 + 20) * 5);
    generatePlatform();
  }
  
}

void updateXY(float dx, float dy) {
  olderp.x += dx;
  olderp.y += dy;
  oldp.x += dx;
  oldp.y += dy;
  //newp.x += dx;
  //newp.y += dy;
}

void keyPressed() {
    moveCamera();
  
}
