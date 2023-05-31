Platform[] p = new Platform[2];
Object o;
Particles pt;
int s = -1; 
/* 
s = -1: no camera moving, no animation
s = 0: no camera moving, hold animation
s = 1: no camera moving, object projectile animation
s = 2: camera moving, spawn new platform
*/

color c = #DBFFC6;//#FFC6EB;
// float h0 = 40 + random(8) * 5;

void setup() {
  size(600, 900);
  background(c);
  frameRate(120);
  
  p[0] = new Platform(150, 550, 100, 20, 1, 0);
  p[1] = new Platform(p[0].x, p[0].y, 80 + random(10) * 10, 20, 1, (int) random(p[0].l / 3.5 , p[0].l / 3.5 + 40) * 5);
  p[1].newXY();
  
  o = new Object(150, 550);  
  pt = new Particles(150, 550);
}

// Draw ------------------------------------------------------------------
int k = 0;
void draw() {
  // if object touches platform, spawn new platform
  switch (s) {
    case -1:
      background(c);
      p[p.length - 1].platform();
      drawP();
      o.object();
      break;
    case 0:
      drawAll();
      pt.particles();
      break;
    case 1:
      o.launchUpdate(t0, p[p.length - 1].dir);
      drawAll();
      if (isOn() && k >= 120) {
        o.x0 = (int) o.x;
        o.y0 = (int) o.y;
        s = 2;
      }
      k++;
      break;
    case 2:
      moveCamera();
      break;
  }
}

void drawAll() {
  background(c);
  p[p.length - 1].platform();
  drawP();
  o.object();
}

// draw all platform from second newest to oldest
void drawP() {
  for(int i = p.length - 2; i >= 0; i--) {
    p[i].platform();
  }
}

// Update ------------------------------------------------------------------
// add new platform to platform array
Platform oldp;
void newP() {
  copyP();
  oldp = p[p.length - 2];
  p[p.length - 1] = new Platform(oldp.x, oldp.y, 80 + random(10) * 10, 20, (int) random(2), (int) random(oldp.l / 3 , oldp.l / 3.5 + 40) * 5);
  p[p.length - 1].newXY();
}

void newP(int dir) {
  copyP();
  oldp = p[p.length - 2];
  p[p.length - 1] = new Platform(oldp.x, oldp.y, 80 + random(10) * 10, 20, dir, (int) random(oldp.l / 3 , oldp.l / 3.5 + 40) * 5);
  p[p.length - 1].newXY();
}

// move camera forward
int dir;
Platform currentp;
Platform formerp;
Platform newp;
int n = 0;
void moveCamera() {
  // set new platform
  if (n == 0) {
    if (p[p.length - 2].y >= 550) {
      dir = int(random(2));
      calcDistance();
      currentp = p[p.length - 1];
      formerp = p[p.length - 2];
      newP(dir);
      newp = p[p.length - 1];
    }
    n++;
  }
  
  // move platforms
  if (currentp.y < 550) {
    updateXY(dx1, dy1);
    background(c);
    if (!(newp.rise()))
      newp.platform();
    drawP();
    o.object();
  }
  
  // reset
  if (p[p.length - 2].y >= 550) {
    n = 0;
    o.x0 = (int) o.x;
    o.y0 = (int) o.y;
    pt = new Particles((int) o.x, (int) o.y);
    s = -1;
  }
}

// calculate distance needed to shift all of the existing platforms
float dx1, dy1;
void calcDistance() {
  float dx, dy;
  Platform currentp = p[p.length - 1];
  if (dir == 1) { // move to 150, 550
    dx = 150 - currentp.x;
    dy = 550 - currentp.y;
  }
  else { // move to 450, 550
    dx = 450 - currentp.x;
    dy = 550 - currentp.y;
  }
  dx1 = dx / 150;
  dy1 = dy / 150;
}

// update x and y of all platforms
void updateXY(float dx, float dy) {
  for (int i = 0; i < p.length; i++) {
    if (p[i].y > 1000) {
      removeP();
      i--;
    }
    else {
      p[i].x += dx;
      p[i].y += dy;
    }
  }
  o.x += dx;
  o.y += dy;
}

// whether the object is on the next platform
boolean isOn() {
  // object is in a line between its starting position and the center of the next platform
  Platform oldp = p[p.length - 2];
  Platform newp = p[p.length - 1];
  float m1 = (newp.y - o.y0) / (newp.x - o.x0);
  float y = m1 * (o.x - o.x0) + o.y0;

  // object is on the top of the platform
  float y1, y2, y3;
  float m2 = tan(radians(32));
  if (newp.dir == 0)
    m2 *= -1;
  y1 = m2 * (o.x - oldp.x) + (oldp.y - oldp.l * sin(32)); // front edge of oldp
  y2 = m2 * (o.x - newp.x) + (newp.y + newp.l * sin(32)); // back edge of newp
  y3 = m2 * (o.x - newp.x) + (newp.y - newp.l * sin(32)); // front edge of newp
  
  //fill(0);
  //text("c", o.x, y);
  //fill(0);
  //text("c1", o.x, y1);
  //fill(0);
  //text("c2", o.x, y2);
  //fill(0);
  //text("c3", o.x, y3);
  
  return  (o.y > y1 || o.y < y2 && o.y > y3) && o.isOn(o.x, y);
}

// Helper -----------------------------------------------------------
void copyP() {
  Platform[] newP = new Platform[p.length + 1];
  for (int i = 0; i < p.length; i++) {
    newP[i] = p[i];
  }
  p = newP;
}

void removeP() {
  Platform[] newP = new Platform[p.length - 1];
  for (int i = 1; i < p.length; i++) {
      newP[i - 1] = p[i];
  }
  p = newP;
}

// Key Control -------------------------------------------------------
float counter = 0;
void keyPressed() {
  o.v = 40;
  counter += 1.4;
  s = 0;
}

float t0 = 0;
void keyReleased() {
  o.v += counter;
  counter = 0;
  if (o.v > 110)
    o.v = 110;
  t0 = millis();
  o.vx = o.v * cos(o.angle);
  o.vy = o.v * sin(o.angle);
  s = 1;
}
