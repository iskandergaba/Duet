class StartScreen {
  private PFont fBig, fSmall;
  
  StartScreen() {
    this.fBig = createFont(dataPath("") + "/font/RobotoCondensed-Regular.ttf", 32, true);
    this.fSmall = createFont(dataPath("") + "/font/RobotoCondensed-Light.ttf", 20, true);
  }
  
  void display() {
    fill(255, 150);
    rect(25, 175, width - 50, 200);
    fill(0);
    textFont(fBig);
    text("Duet: Weclome", 105, 225);
    textFont(fSmall);
    text("Think with a circular state of mind", 70, 275);
    text("ENTER:  Play", 50, 325);
    text("ESCAPE: Exit", 250, 325);
  }
  
}
