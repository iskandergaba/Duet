class DuetRing {
  private final int S_RADIUS = 35, D_RADIUS = 175;
  private float angle = 0;
  private float x, y, xR, yR, xB, yB, alpha;
  private SingletRing ringB, ringR;
  
  DuetRing(float x, float y) {
    this.x = x;
    this.y = y;
    this.xR = x - D_RADIUS / 2;
    this.yR = y;
    this.xB = x + D_RADIUS / 2;
    this.yB = y;
    this.alpha = 0;
    this.ringB = new SingletRing(xR, yR, S_RADIUS, color(0, 150, 250));
    this.ringR = new SingletRing(xB, yB, S_RADIUS, color(225, 0, 0));
  }
  
  void display() {
    fill(255, alpha);
    rect(0, 0, width, height);
    alpha = constrain(alpha - 1, 0, 255);
    noFill();
    stroke(255);
    ellipseMode(CENTER);
    ellipse(x, y, D_RADIUS, D_RADIUS);
    ringB.display();
    ringR.display();
  }
  
  void rotateLeft() {
    angle -= 0.02 % TWO_PI;
    move();
  }
  
  void rotateRight() {
    angle += 0.02 % TWO_PI;
    move();
  }
  
  void move() {
    ringB.move(x + D_RADIUS * cos(angle + PI) / 2, y + D_RADIUS * sin(angle + PI) / 2);
    ringR.move(x + D_RADIUS * cos(angle) / 2, y + D_RADIUS * sin(angle) / 2);
  }
  
  void blow() {
    alpha = 255;
    angle = 0;
    move();
  }
  
  boolean isOver(float x, float y, float w, float h) {
    return ringB.isBlown(x, y, w, h) || ringR.isBlown(x, y, w, h);
  }
}
