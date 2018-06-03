class Obstacle {
  private float x, y, dx, dy, w, h;
  private float[] xs, ys;
  private int frame;
  private final int FRAMES = 30;
  private final int MIN_W = 100, MAX_W = 125;
  private final int MIN_H = 25, MAX_H = 50;
  
  Obstacle(float x, float y, float dx, float dy) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.w = random(MIN_W, MAX_W);
    this.h = random(MIN_H, MAX_H);
    this.xs = new float[FRAMES];
    this.ys = new float[FRAMES];
    for (int i = 0; i < FRAMES; i++) {
      xs[i] = x;
      ys[i] = y;
    }
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getWidth() {
    return w;
  }
  
  float getHeight() {
    return h;
  }
  
  boolean isGone() {
    return y > height + 25;
  }
  
  void display() {
    frame = frameCount % FRAMES;
    xs[frame] = x;
    ys[frame] = y;
    for (int i = 0; i < FRAMES; i++) {
      color newC = color(225, i / 2);
      fill(newC);
      int index = (frame + 1 + i) % FRAMES;
      rect(xs[index], ys[index], w, h);
    }
    fill(225);
    rect(x, y, w, h);
  }
  
  void move() {
    if (x <= 0 || x + w >= width) {
      dx *= -1;
    }
    x += dx;
    y += dy;
  }
}
