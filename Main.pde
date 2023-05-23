Platform start = new Platform(300, 800, 100, 50, 1, 0);
Platform olderp = start;
Platform oldp = start;
Platform newp;
float l0 = 80 + random(6) * 10;
float h0 = 40 + random(8) * 5;

void setup() {
  size(600, 800);
  start.cube();
}

void draw() {

}


void generatePlatform() {
  newp = new Platform(oldp.x, oldp.y, 80 + random(6) * 10, 40 + random(8) * 5, (int) random(2), (int) random(oldp.l / 4, oldp.l / 4 + 20) * 5);
  newp.updatePlatform();
  newp.cube();
  oldp.cube();
  olderp.cube();
  olderp = oldp;
  oldp = newp;
}

void keyPressed() {
  generatePlatform();
  
  
}
