class Terrain {
  Obstacle[] obstacles;
  
  Terrain() {
    obstacles = new Obstacle[0];
  }
  
  void addObstacle(Obstacle obstacle) {
    obstacles = (Obstacle[])append(obstacles,obstacle);
  }
  
  boolean isBlocking(PVector position) {
    for(int i = 0; i < obstacles.length; i++) {
      if (obstacles[i].isBlocking(position)) {
        return true;
      }
    }
    return false;
  }
}
