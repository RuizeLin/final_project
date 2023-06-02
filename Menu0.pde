void setup() {
  size(600, 900);
  
  
}

void draw() {
  titleMenu();
}

void titleMenu() {
  int diag = 280;
  int xc = width / 2;
  int yc = height / 2 - 60;
  noStroke();
  fill(#FFFFFF);
  quad(xc + diag, yc, xc, yc + diag, xc - diag, yc, xc, yc - diag);
  
  yc += 70;
  diag = 250;
  quad(xc + diag, yc, xc, yc + diag, xc - diag, yc, xc, yc - diag);
  yc -= 25;
  stroke(#8B5400);
  strokeWeight(3);
  line(xc - diag + 40, yc, xc + diag - 40, yc);
  strokeWeight(1.5);
  line(xc, yc + 18, xc, yc + 90);
  line(xc - 140, yc + 105, xc + 140, yc + 105);
  
  fill(#8B5400);
  textSize(40);
  text("START", xc - 150, yc + 65);
  
  text("SCORE", xc + 40, yc + 65);
  
}
