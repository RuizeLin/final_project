Game g;
Menu m;
int[] score;
color c;

void setup() {
  size(600, 900);
  frameRate(90);
  
  c = #FFF9D9;
  g = new Game(c);
  m = new Menu(c);
  score = new int[5];
  m.mainMenu(255);
}

float t = 0;
int time = millis();
int s = 0;
/*
0: main menu
1: game
2: score
3: end menu
*/
boolean canClear = false;
void draw() {
  switch(s) {
    case 0: // main menu
      if (t == 0) {
          g = new Game(c);
          m = new Menu(c);
      }
      mainMenu();
      t++;
      break;
    case 1: // start game
      if (m.alpha <= 255) {
        m.clearScreen();
      }
      else {
        if(g.gameSetup(1)) {
          frameRate(120);
          g.game();
          if (g.o.y > 1000) {
            s = 3;
          }
        }
      }
      break;
    case 2:
      if (canClear == false) {
        scoreMenu();
      }
      break;
    case 3: // end game
      if (canClear == false)
        endMenu();
      else {
        if (m.alpha <= 255)
          m.clearScreen();
        else {
          score(g.score);
          s = 0;
        }
      }
      break;
  }
}

void mainMenu() {
  g.gameSetup(0);
  m.mainMenu(255);
  if (millis() > time + 600)
    s = m.isOnMain();
  else
     m.isOnMain();
  canClear = false;
  m.alpha = 0;
}

void endMenu() {
  background(c);
  g.game();
  m.endMenu(g.score);
  if (m.isOnEnd() == 1) {
    canClear = true;
    m.alpha = 0;
    t = 0;
    time = millis();
  }
}

void scoreMenu() {
  m.scoreMenu(score);
  if (m.isOnScore() == 1) {
    s = 0;
    m.a = 0;
    time = millis();
  }
}

void score(int s) {
  for (int i = 0; i < score.length; i++) {
    if (s >= score[i]) {
      for (int j = score.length - 1; j > i; j--)
        score[j] = score [j - 1];
      score[i] = s;
      break;
    }
  }
}

void keyPressed() {
  g.keyPressed();
}

void keyReleased() {
  g.keyReleased();
}
