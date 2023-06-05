public class Menu{
  // fields
  PImage title;
  int diag;
  int xc;
  int yc;
  color c;
  float alpha;
  
  // constructors
  Menu(color c) {
    title = loadImage("Title.PNG");
    title.resize(700, 0);
    mainMenu(255);
    
    diag = 280;
    xc = width / 2;
    yc = height / 2 - 60;
    this.c = c;
    alpha = 0;
  }
  
  // methods
  void mainMenu(float a) {
    if (3 * a > 255)
      a = 255 / 3;
    diag = 300;
    xc = width / 2;
    yc = height / 2 - 40;
    noStroke();
    fill(#FFFFFF, a);
    quad(xc + diag, yc, xc, yc + diag, xc - diag, yc, xc, yc - diag);
    
    diag = 250;
    yc += 50;
    
    
    yc -= 8;
    stroke(#8B5400, 3 * a);
    strokeWeight(3);
    line(xc - diag + 25, yc, xc + diag - 25, yc);
    
    strokeWeight(1.5);
    line(xc, yc + 18, xc, yc + 90);
    line(xc - 125, yc + 105, xc + 125, yc + 105);
    
    fill(#8B5400, 3 * a);
    textAlign(LEFT);
    textSize(35);
    text("START", xc - 140, yc + 65);
    text("SCORE", xc + 40, yc + 65);
    
    image(title, -70, 60);
    tint(255, 3 * a);
  }
  
  /* 
  0: main menu
  1: start
  2: score
  3: setting
  */
  int isOnMain() {
    xc = width / 2;
    yc = height / 2 - 5;
    textAlign(LEFT);
    if (mouseX < xc && mouseX > xc - 200 && mouseY > yc && mouseY < yc + 110) { // start: left
      mainMenu(255);
      xc = width / 2;
      yc = height / 2 + 15;
      diag = 250;
      
      noStroke();
      fill(#D3D3D3, 200);
      rect(xc - 140, yc, 130, 80);
      quad(xc - 210, yc + 5, xc - 215, yc, xc - 140, yc, xc - 140, yc + 80);
      
      yc = height / 2;
      fill(#8B5400);
      textSize(37);
      text("START", xc - 143, yc + 68);
      
      if(mousePressed) {
        return 1;
      }
    }
    else if(mouseX > xc && mouseX < xc + 200 && mouseY > yc && mouseY < yc + 110) { // score: right
      mainMenu(255);
      xc = width / 2;
      yc = height / 2 + 15;
      diag = 250;
      
      noStroke();
      fill(#D3D3D3, 200);
      rect(xc + 10, yc, 130, 80);
      quad(xc + 210, yc + 5, xc + 215, yc, xc + 140, yc, xc + 140, yc + 80);
      
      
      yc = height / 2;
      fill(#8B5400);
      textSize(37);
      text("SCORE", xc + 37, yc + 68);
      
      if (mousePressed) {
        return 2;
      }
    }
    else {
      mainMenu(255);
      return 0;
    }
    return 0;
  }
  
  void endMenu(int score) {
    int s = 260;
    xc = width / 2;
    yc = height / 2 - 10;
    noStroke();
    fill(#000000, 30);
    rect(0, 0, 600, 900);
    
    fill(#FFFFFF, 180);
    quad(xc - s, yc, xc, yc - s, xc + s, yc, xc, yc + s);
    
    yc += 50;
    stroke(#8B5400);
    strokeWeight(3);
    line(xc + 170, yc, xc - 170, yc);
    
    yc += 55;
    fill(#8B5400);
    textSize(35);
    textAlign(CENTER);
    text("RESTART", xc, yc);
    
    yc -= 225;
    textSize(30);
    text("Final Score", xc, yc);
    textSize(120);
    text(score, xc, yc + 130);
  }
  
  boolean isOnEnd() {
    xc = width / 2;
    yc = height / 2 + 50;
    textAlign(CENTER);
    if (mouseX < xc + 160 && mouseX > xc - 160 && mouseY > yc && mouseY < yc + 80) { // restart
      noStroke();
      fill(#D3D3D3, 200);
      quad(xc - 180, yc, xc - 100, yc + 80, xc + 100, yc + 80, xc + 180, yc);
      
      yc = height / 2;
      fill(#8B5400);
      textSize(37);
      text("RESTART", xc, yc + 96);
      
      if(mousePressed)
        return true;
    }
    return false;
  }
  
  void scoreMenu(int[] score) {
    diag = 300;
    xc = width / 2;
    yc = height / 2 - 40;
    noStroke();
    fill(#FFFFFF, alpha);
    quad(xc + diag, yc, xc, yc + diag, xc - diag, yc, xc, yc - diag);
    
    diag = 250;
    
    yc = height / 2 - 40;
    stroke(#8B5400, alpha);
    strokeWeight(3);
    line(xc - diag + 70, yc - 90, xc - diag + 70, yc + 90);
    line(xc + diag - 70, yc - 90, xc + diag - 70, yc + 90);
    
    xc = xc - diag + 150;
    yc = height / 2 - 115;
    int spc = 50;
    noStroke();
    fill(#FFD700, alpha);
    circle(xc, yc, 40);
    fill(#B0BABC, alpha);
    circle(xc, yc + spc, 40);
    fill(#CD7F32, alpha);
    circle(xc, yc + 2 * spc, 40);
    
    yc += 10;
    fill(#FFFFFF, alpha);
    textAlign(CENTER);
    textSize(30);
    text("1", xc, yc);
    text("2", xc, yc + spc);
    text("3", xc, yc + 2 * spc);
    textSize(37);
    fill(#6F6F6F, alpha);
    text("4.", xc + 3, yc + 3 * spc);
    text("5.", xc + 3, yc + 4 * spc);
    
    fill(#8B5400, alpha);
    textSize(40);
    text("Ranking" , width / 2, yc - 80);
    text("x", width / 2, yc + 297);
    stroke(#8B5400, alpha);
    strokeWeight(1.5);
    line(width / 2 - 80, yc - 70, width / 2 + 50, yc - 70);
    line(width / 2 + 65, yc - 70, width / 2 + 80, yc - 70);
    
    xc += 40;
    noStroke();
    textAlign(LEFT);
    textSize(35);
    text(score[0], xc, yc);
    text(score[1], xc, yc + spc);
    text(score[2], xc, yc + 2 * spc);
    text(score[3], xc, yc + 3 * spc);
    text(score[4], xc, yc + 4 * spc);
    alpha += 5;
  }
  
  boolean isOnScore() {
    xc = width / 2;
    yc = 600;
    textAlign(CENTER);
    if (mouseX < xc + 70 && mouseX > xc - 70 && mouseY > yc && mouseY < yc + 70) { // restart
      noStroke();
      fill(#D3D3D3, 200);
      triangle(xc + 80, yc, xc - 80, yc, xc, yc + 80);
      
      fill(#8B5400);
      textSize(45);
      text("x", xc, 643);
      
      if(mousePressed) {
        return true;
      }
    }
    return false;
  }
  void pauseMenu() {
    int s = 260;
    xc = width / 2;
    yc = height / 2 - 10;
    noStroke();
    fill(#000000, 30);
    rect(0, 0, 600, 900);
    
    fill(#FFFFFF, 180);
    quad(xc - s, yc, xc, yc - s, xc + s, yc, xc, yc + s);
    
    yc += 10;
    stroke(#8B5400);
    strokeWeight(3);
    line(xc - diag + 25, yc, xc + diag - 25, yc);
    
    strokeWeight(1.5);
    line(xc, yc + 18, xc, yc + 90);
    line(xc - 125, yc + 105, xc + 125, yc + 105);
    
    fill(#8B5400);
    textAlign(LEFT);
    textSize(35);
    text("RESUME", xc - 150, yc + 65);
    text("EXIT", xc + 40, yc + 65);
    
    yc -= 100;
    textAlign(CENTER);
    textSize(30);
    text("If you exit now, ", xc, yc);
    yc += 65;
    text("your score will not be saved", xc, yc);
  }
  
  int isOnPause() {
    xc = width / 2;
    yc = height / 2 - 5;
    textAlign(LEFT);
    if (mouseX < xc && mouseX > xc - 200 && mouseY > yc && mouseY < yc + 110) { // resume: left
      xc = width / 2;
      yc = height / 2 + 15;
      diag = 250;
      
      noStroke();
      fill(#D3D3D3, 200);
      rect(xc - 140, yc, 130, 80);
      quad(xc - 210, yc + 5, xc - 215, yc, xc - 140, yc, xc - 140, yc + 80);
      
      yc = height / 2;
      fill(#8B5400);
      textSize(37);
      text("RESUME", xc - 152, yc + 68);
      
      if(mousePressed) {
        return 1;
      }
    }
    else if(mouseX > xc && mouseX < xc + 200 && mouseY > yc && mouseY < yc + 110) { // exit: right
      xc = width / 2;
      yc = height / 2 + 15;
      diag = 250;
      
      noStroke();
      fill(#D3D3D3, 200);
      rect(xc + 10, yc, 130, 80);
      quad(xc + 210, yc + 5, xc + 215, yc, xc + 140, yc, xc + 140, yc + 80);
      
      
      yc = height / 2;
      fill(#8B5400);
      textSize(37);
      text("EXIT", xc + 39, yc + 68);
      
      if (mousePressed) {
        return 2;
      }
    }
    else {
      return 0;
    }
    return 0;
  }
  
  void clearScreen() {
    xc = width / 2;
    yc = height / 2 - 10;
    fill(c, alpha);
    rect(0, 0, 600, 900);
    alpha += 3;
  }
  
}
