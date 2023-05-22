Particles charge;
void setup() {
  size(600, 600);
  circle(300, 300, 50);
  charge = new Particles();
}

int i = 0;
void draw() {
  charge.particles();
  
}
  

public class Particles{
  // fields
  Particle a;
  Particle b;
  Particle c;
  Particle d;
  Particle e;
  
  // constructors
  Particles() {
      a = new Particle(300, 300);
      b = new Particle(300, 300);
      c = new Particle(300, 300);
      d = new Particle(300, 300);
      e = new Particle(300, 300);
  }
  
  // methods
  void particles() {
    a = a.update();
    drawAll();
    b = b.update();
    drawAll();
    c = c.update();
    drawAll();
    d = d.update();
    drawAll();
    e = e.update();
    drawAll();
  }
  
  void drawAll() {
    a.create();
    b.create();
    c.create();
    d.create();
    e.create();
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
    size = 4 + random(8);
    range = int(random(5, 25));
  }
  
  // methods
  void create() {
     circle(x, y, size);
  }
  
  Particle update() {
    if (x < x0 + range && x > x0 - range 
        && y < y0 + range && y > y0 - range) {
          return new Particle(300, 300);
    }
    else {
      background(255);
      circle(x, y, size);
      x += v * cos(dir);
      y -= v * sin(dir);
      if (size > 3)
        size -= 0.01 + size * 0.01;
      return this;
    }
  }
}
