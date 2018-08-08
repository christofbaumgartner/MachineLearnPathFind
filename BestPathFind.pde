Population population;
PVector goal = new PVector(400, 10);

void setup(){
  size(800,800);
  population = new Population(1000);
}

void draw(){
  background(255);
  fill(255, 0, 0);
  ellipse(goal.x, goal.y,10,10);
  
  if (population.noDotsLeft()) {
    population.calculateFitness();
    population.naturalSelection();
  } else {
    population.update();
    population.show();
  }
}
