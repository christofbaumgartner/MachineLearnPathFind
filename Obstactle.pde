class Obstacle {
  PVector position;
  PVector size;
  
  Obstacle(PVector position, PVector size) {
    this.position = position;
    this.size = size;
  }
  
  boolean isBlocking(PVector object) {
    return (object.x > position.x && object.y > position.y && object.x < position.x + size.x && object.y < position.y + size.y);
  }
}
