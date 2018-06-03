import processing.sound.*;

/*
We use these two flags below because we want to avoid the latency caused by the system when waiting for few millis to check
whether it is a single key press or a continious one. We also want the animation to be as smooth and responsive as possible
for the player experience.
*/
private boolean leftPressed, rightPressed;
private String mediaPath;
private String[] mediaFiles;
private StarField starField;
private MediaPlayer mediaPlayer;
private GameEngine game;

void setup() {
  size(400, 600);
  PImage icon = loadImage(dataPath("") + "/icon.jpg");
  surface.setIcon(icon);
  background(0);
  frameRate(120);
  mediaPath = dataPath("") + "/media/";
  mediaFiles = new String[11];
  for (int i = 0; i < 11; i++) {
    mediaFiles[i] = mediaPath + i + ".mp3";
  }
  mediaPlayer = new MediaPlayer(this, mediaFiles);
  starField = new StarField();
  game = new GameEngine();
}

int x = 200, y = 100;
void draw() {
  background(0);
  mediaPlayer.play();
  starField.display();
  if (leftPressed) game.rotateLeft();
  else if (rightPressed) game.rotateRight();
  game.display();
  game.move();
}

void keyPressed() {
  if (keyCode == LEFT) {
    leftPressed = true;
  }
  else if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    leftPressed = false;
  }
  else if (keyCode == RIGHT) {
    rightPressed = false;
  }
  else if (keyCode == ESC) {
    exit();
  }
  else if (keyCode == ENTER) {
    game.startGame();
  }
  else if (key == ' ') {
    game.saveGame();
  }
}
