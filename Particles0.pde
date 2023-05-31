Particles charge;
//void setup() {
//  size(600, 600);
//  circle(300, 300, 50);
//  charge = new Particles();
//}

//void draw() {
//  charge.particles();
  
//}
  

public class Particles{
  // fields
  Particle a;
  Particle b;
  Particle c;
  Particle d;
  Particle e;
  
  // constructors
  Particles(int x0, int y0) {
      y0 -= 25;
      a = new Particle(x0, y0);
      b = new Particle(x0, y0);
      c = new Particle(x0, y0);
      d = new Particle(x0, y0);
      e = new Particle(x0, y0);
  }
  
  // methods
  void particles() {
    a = a.update();
    b = b.update();
    c = c.update();
    d = d.update();
    e = e.update();
  }
  
  void drawAll() {
    circle(a.x, a.y, 50);
    a.particle();
    b.particle();
    c.particle();
    d.particle();
    e.particle();
  }
}

private class Particle{
  // fields
  float x;
  float y;
  float v;
  float dir;
  float d;
  float size;
  int range;
  
  int x0;
  int y0;
  
  // constructors
  Particle(int x0, int y0) {
    this.x0 = x0;
    this.y0 = y0;
    
    v = (1 + random(5)) / 20;
    dir = random(2 * PI);
    
    d = random(10, 70);
    x = x0 - d * cos(dir);
    y = y0 + d * sin(dir);
    size = 5 + random(8);
    range = int(random(5, 25));
  }
  
  // methods
  void particle() {
    fill(#FAFF03);
    circle(x, y, size);
  }
  
  Particle update() {
    if (x < x0 + range && x > x0 - range 
        && y < y0 + range && y > y0 - range) {
          return new Particle(x0, y0);
    }
    else {
      particle();
      x += v * cos(dir);
      y -= v * sin(dir);
      if (size > 3)
        size -= 0.01 + size * 0.01;
      return this;
    }
  }
}
