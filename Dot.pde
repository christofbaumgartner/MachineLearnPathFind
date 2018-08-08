class Dot{
  PVector position;
  PVector velocity;
  PVector accelaration;
  boolean dead;
  boolean reachedGoal;
  boolean isBest;
  float fitness = 0;
  int lifespan = 400;
  
  Brain brain;
  
  Dot() {
    brain = new Brain(lifespan);
    position = new PVector(width/2, height-10);
    velocity = new PVector(0,0);
    accelaration = new PVector(0,0);
    dead = false;
    reachedGoal = false;
    isBest = false;
  }
  
  void show() {
    if(isBest) {
      fill(0,255,0);
      ellipse(position.x,position.y,50,50);
    } else {
      fill(0);
      ellipse(position.x,position.y,4,4);
    }
  }
  
  void move() {
    accelaration = brain.getAcc();
    velocity.add(accelaration);
    velocity.limit(5);
    position.add(velocity);
  }
  
  void update() {
    if (!dead && !reachedGoal) {
      move();
      if (outsitePlayground(position) || brain.step >= lifespan) {
        dead = true;
      } else if (distanceToGoal(position) < 4) {
        reachedGoal = true;
      }
    }
  } 
  
  void calculateFitness() {
    if (reachedGoal) {
      fitness = 1.0/16.0 + 10000.0/(float)sq(brain.step);
    }
    fitness = 1.0/sq(distanceToGoal(position));
  }
  
  Dot getChild() {
    Dot child = new Dot();
    child.brain = brain.copy();
    return child;
  }
  
  
  private boolean outsitePlayground(PVector position) {
    return position.x < 2 || position.y < 2 || position.x > width -2 || position.y > height -2;
  }
  
  private float distanceToGoal(PVector position) {
    return dist(position.x, position.y , goal.x, goal.y);
  }


}
