class ScoreBoard {
  private PFont f;
  ScoreBoard() {
    this.f = createFont(dataPath("") + "/font/RobotoCondensed-Light.ttf", 20, true);
  }
  
  void display(int level, int score) {
    textFont(f);
    fill(255, 200);
    rect(0, 0, width, 50);
    fill(0);
    text("Score: " + score, 30, 30);
    text("Level: " + level, 300, 30);
  }
}
