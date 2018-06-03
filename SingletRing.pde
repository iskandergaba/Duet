class SingletRing {
  private final int FRAMES = 60;
  private float x, y;
  private int r, frame;
  private color c;
  private float[] xs, ys;
  
  SingletRing(float x, float y, int r, color c) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.xs = new float[FRAMES];
    this.ys = new float[FRAMES];
    for (int i = 0; i < FRAMES; i++) {
      xs[i] = x;
      ys[i] = y;
    }
  }
  
  void display() {
    noStroke();
    frame = frameCount % FRAMES;
    xs[frame] = x;
    ys[frame] = y;
    for (int i = 0; i < FRAMES; i++) {
      color newC = color(red(c), green(c), blue(c), i);
      int newR = constrain(i / 2, 0, r);
      fill(newC);
      // frame + 1 is the smallest (the oldest in the array)
      int index = (frame + 1 + i) % FRAMES;
      ellipse(xs[index], ys[index], newR, newR);
    }
    fill(c);
    ellipse(x, y, r, r);
  }
  
  void move(float x, float y) {
    this.x = constrain(x, r/2, width - r/2);
    this.y = constrain(y, r/2, height - r/2);
  }
  
  boolean isBlown(float x, float y, float w, float h) {
    // maybe more tolerance in the future, maybe!!!
    float distX = this.x - x, distY = this.y - y;
    return (distX < w + r / 2 && distX > -r / 2) && (distY < h + r / 2 && distY > -r / 2);
  }
 
}
