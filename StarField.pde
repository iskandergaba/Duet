// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/17WoOqgXsRM

class StarField {
  private Star[] stars = new Star[800];
  
  StarField() {
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star();
    }
  }
  
  void display() {
    background(0);
    pushMatrix();
    translate(width / 2, height / 2);
    for (int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].display();
    }
    popMatrix();
  }
}
