class GameOverScreen {
  private PFont fBig, fSmall;
  
  GameOverScreen() {
    this.fBig = createFont(dataPath("") + "/font/RobotoCondensed-Regular.ttf", 32, true);
    this.fSmall = createFont(dataPath("") + "/font/RobotoCondensed-Light.ttf", 20, true);
  }
  
  void display(int score) {
    fill(255, 150);
    rect(25, 175, width - 50, 200);
    fill(0);
    textFont(fBig);
    text("Duet: Game Over", 90, 225);
    textFont(fSmall);
    text("Score: " + score, 50, 275);
    text("ENTER:  Replay", 50, 325);
    text("SPACE: Save", 250, 325);
  }
}
