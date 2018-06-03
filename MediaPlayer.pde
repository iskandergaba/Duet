import processing.sound.*;
class MediaPlayer {
  
  private SoundFile[] mediaFiles;
  private float start, duration;
  private int fileIndex;
  MediaPlayer(Duet game, String[] filenames) {
    if (filenames == null || filenames.length == 0) throw new IllegalArgumentException("No sound files were passed");
    mediaFiles = new SoundFile[filenames.length];
    for (int i = 0; i < filenames.length; i++) {
      mediaFiles[i] = new SoundFile(game, filenames[i]);
    }
    fileIndex = int(random(0, mediaFiles.length));
  }
  
  void play() {
    if (millis() - start >= duration) {
      SoundFile file = mediaFiles[fileIndex++];
      duration = file.duration() * 1000;
      fileIndex %= mediaFiles.length;
      start = millis();
      file.play();
    }
  }
}
