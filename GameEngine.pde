class GameEngine {
  private final float LEFT = 10, RIGHT = width / 2 - 10;
  private boolean gameStarted, gameOver;
  private int level, score, subscore;
  private float dy, start, interval;
  private Obstacle[] obstacles;
  private StartScreen startScreen;
  private GameOverScreen gameOverScreen;
  private ScoreBoard board;
  private DuetRing duet;
  
  GameEngine() {
    init();
    startScreen = new StartScreen();
    gameOverScreen = new GameOverScreen();
    board = new ScoreBoard();
    duet = new DuetRing(200, 475);
  }
  
  void init() {
    dy = 0.5;
    start = -1500;
    interval = 110;
    level = 1;
    score = 0;
    subscore = 0;
    obstacles = new Obstacle[10];
    loadObstacles();
  }
  
  void display() {
    duet.display();
    if (gameStarted) {
      for (Obstacle o : obstacles) {
        o.display();
        if (duet.isOver(o.getX(), o.getY(), o.getWidth(), o.getHeight())) {
          if (!gameOver) duet.blow();
          gameOver = true;
        }
      }
      if (gameOver) gameOverScreen.display(score);
    }
    else if (!gameStarted) startScreen.display();
    board.display(level, score);
  }
  
  void move() {
    if (gameStarted && !gameOver) {
      int s = 0;
      for (Obstacle o : obstacles) {
        if (o.isGone()) s += 10 * level;
        o.move();
      }
      score += s - subscore;
      subscore = s;
      if (s == 100 * level) nextLevel();
    }
  }
  
  void loadObstacles() {
    float offset = 0;
    for (int i = 0; i < obstacles.length; i++) {
      float dx = random(0, 0.5);
      float x = random(0, 2) < 1 ? LEFT : RIGHT;
      float y = start + offset;
      Obstacle o = new Obstacle(x, y, dx, dy);
      obstacles[i] = o;
      offset += interval + o.getHeight();
    }
  }
  
  void nextLevel() {
    if (obstacles[0].getY() > height) {
      dy += 0.075;
      start -= 50;
      interval += 5;
      score += subscore;
      subscore = 0;
      level++;
      loadObstacles();
      }
  }
  
  void rotateLeft() {
    if (gameStarted && !gameOver) duet.rotateLeft();
  }
  
  void rotateRight() {
    if (gameStarted && !gameOver) duet.rotateRight();
  }
  
  void startGame() {
    gameStarted = true;
    gameOver = false;
    init();
  }
  
  void saveGame() {
    if(gameOver) {
      StringBuilder path = new StringBuilder("save/");
      path.append(day() + "-").append(month() + "-").append(year() + "-")
      .append(hour() + "-").append(minute() + "-").append(second() + "-")
      .append(millis() + ".jpg");
      save(path.toString());
    }
  }
}
