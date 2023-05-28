Platform start = new Platform(150, 650, 100, 50, 1, 0);
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
  frameRate(120);
}

void draw() {
moveCamera();
}


void generatePlatform() {
  newp.updatePlatform();
  drawPlatform();
  olderp = oldp;
  oldp = newp;
  
}

void drawPlatform() {
  newp.platform();
  oldp.platform();
  olderp.platform();
}

// when ball touch new platform, set it to oldp
void moveCamera() {
  int dir = int(random(2));
  float dx, dy, dx1, dy1;
  background(255);
  if (dir == 0) {
    // move to 450, 600
    dx = 450 - oldp.x;
    dy = 650 - oldp.y;
    
  }
  else {
    // move to 150, 600
    dx = 150 - oldp.x;
    dy = 650 - oldp.y;
  }
  dx1 = dx / 500;
  dy1 = dy / 500;
  
  
  updateXY(dx1, dy1);
  oldp.platform();
  olderp.platform();
  
  if (oldp.x <= 150 && oldp.y >= 650 
      || oldp.y >= 450 && oldp.y <= 650) {
  newp = new Platform(oldp.x, oldp.y, 50 + random(10) * 10, 40 + random(8) * 5, dir, (int) random(oldp.l / 3 , oldp.l / 4 + 20) * 5);
  generatePlatform();
  }
  
  
}

void isOn() {
  
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

  
}
