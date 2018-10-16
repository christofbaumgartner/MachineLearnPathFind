Population population;
Terrain terrain;
PVector goal = new PVector(400, 10);
PImage img;

void setup(){
  size(800,800);
  img = loadImage("background.png");
  population = new Population(1000);
  terrain = new Terrain();
  terrain.addObstacle(new Obstacle(new PVector(300,200), new PVector(500, 10)));
  terrain.addObstacle(new Obstacle(new PVector(0,400), new PVector(500, 10)));
  terrain.addObstacle(new Obstacle(new PVector(300,600), new PVector(500, 10)));
}

void draw(){
  background(255);
  drawPoints();
  drawObstacles();
  runGeneration();
}


private void drawPoints() {
  fill(255, 0, 0);
  image(img, 0, 0);
  ellipse(goal.x, goal.y,10,10);
}

private void drawObstacles() {
  fill(0,0,255);
  for(int i = 0; i < terrain.obstacles.length; i++) {
    rect(terrain.obstacles[i].position.x, terrain.obstacles[i].position.y, terrain.obstacles[i].size.x, terrain.obstacles[i].size.y);
  }
}

private void runGeneration() {
  if (population.noDotsLeft()) {
    population.calculateFitness();
    population.naturalSelection();
  } else {
    population.update(terrain);
    population.show();
  }
} 
