public class Game{
  // fields
  Platform[] p;
  Object o;
  Particles pt;
  int s;
  color c;
  int score;
  
  // constructors
  Game(color c) {
    p = new Platform[2];
    p[0] = new Platform(150, 550, 100, 20, 1, 0);
    p[1] = new Platform(p[0].x, p[0].y, 70 + random(25) * 5, 20, 1, (int) random(p[0].l / 8 + 25, 70) * 5);
    p[1].newXY();
    
    o = new Object(150, 550);  
    pt = new Particles(150, 550);
    
    s = -1; 
    /* 
    s = -1: no camera moving, no animation
    s = 0: no camera moving, hold animation
    s = 1: no camera moving, object projectile animation
    s = 2: camera moving, spawn new platform
    */
    this.c = c;//#FFC6EB;
    score = 0;  
  }
  
  // methods
  boolean result = false;
  boolean gameSetup(int a) {
    if (a == 0) {
      background(c);
      p[p.length - 1].platform();
      drawP();
      o.shadow();
      o.object();
      pt.particles();
    }
    else {
      background(c);
      if (p[p.length - 1].rise()) {
        p[p.length - 2].rise();
      }
      else {
        p[p.length - 1].platform();
        drawP();
        result = true;
      }
      if(o.objectSetup()) {
        o.object();
      }
      else
        result = result && false;
      textSize(90);
      textAlign(LEFT);
      fill(#9c6108);
      text(score, 60, 120);
    }
    return result;
  }
  
  // Draw ------------------------------------------------------------------
  boolean isFalling = false;
  boolean overshot = false;
  void game() {
    switch (s) {
      case -1:
        background(c);
        p[p.length - 1].platform();
        drawP();
        o.shadow();
        o.object();
        isFalling = false;
        break;
      case 0:
        background(c);
        p[p.length - 1].platform();
        drawP();
        o.shadow();
        o.object();
        pt.particles();
        break;
      case 1:
        o.launchUpdate(t0, p[p.length - 1].dir);
        background(c);
        
        if (o.y < o.y0 - p[p.length - 2].l * sin(p[p.length - 2].angle) + 5|| o.y > o.y0) {
          p[p.length - 1].platform();
          o.object();
          drawP();
        }
        else {
          background(c);
          p[p.length - 1].platform();
          drawP();
          o.object();
        }
        if (overshot == true) {
          p[p.length - 1].platform();
          drawP();
        }
        else {
          if (isOn()) {
            o.x0 = (int) o.x;
            o.y0 = (int) o.y;
            s = 2;
          }
        }
        break;
      case 2:
        moveCamera();
        break;
    }
    textSize(90);
    textAlign(LEFT);
    fill(#9c6108);
    text(score, 60, 120);
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
    p[p.length - 1] = new Platform(oldp.x, oldp.y, 70 + random(25) * 5, 20, (int) random(2), (int) random(oldp.l / 8 + 25, 70) * 5);
    p[p.length - 1].newXY();
  }
  
  void newP(int dir) {
    copyP();
    oldp = p[p.length - 2];
    p[p.length - 1] = new Platform(oldp.x, oldp.y, 70 + random(25) * 5, 20, dir, (int) random(oldp.l / 8 + 25, 70) * 5);
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
      score++;
    }
    
    // move platforms
    if (currentp.y < 550) {
      updateXY(dx1, dy1);
      background(c);
      if (!(newp.rise()))
        newp.platform();
      drawP();
      o.shadow();
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

    // return 0 is false, 1 if true, 2 if object overshot
    if ((o.y > y1 + 5|| o.y < y2 - 5 && o.y > y3 + 5) && o.isOn(o.x, y) && (o.x > o.x0 + 10 || o.x < o.x0 - 10)) {
        return true;
    }
    else {
      if (o.y > y && o.y < y3 + 5)
        overshot = true;
      return false;
    }
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
    if (isFalling == false) {
      o.v = 40;
      counter += 1.5;
      s = 0;
    }
  }
  
  float t0 = 0;
  void keyReleased() {
    if (isFalling == false) {
    o.v += counter;
    counter = 0;
    if (o.v > 105)
      o.v = 105;
    t0 = millis();
    o.vx = o.v * cos(o.angle);
    o.vy = o.v * sin(o.angle);
    s = 1;
    isFalling = true;
    }
  }
}
