class Brain{
  PVector[] directions;
  int step = 0;
  float mutationRate = 0.01;
  
  Brain(int lifeSpan) {
    directions = new PVector[lifeSpan];
    this.randomize();
  }
  
  Brain copy() {
    Brain clone = new Brain(directions.length);
    for(int i = 0; i < directions.length; i++) {
      clone.directions[i] = directions[i].copy();
    }
    return clone;
  }
  
  PVector getAcc() {
    PVector acc = new PVector(0,0);
    if (directions.length > step) {
      acc = directions[step];
      step++;
    }
    return acc;
  }
  
  void mutate() {
    for (int i = 0; i < directions.length; i++) {
      float rnd = random(1);
      if (rnd < mutationRate) {
        float randomAngle = random(2 * PI);
        directions[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
  
  private void randomize() {
    for(int i = 0; i < directions.length; i++){
      float randomAngle = random(2*PI);
      directions[i] = PVector.fromAngle(randomAngle);
    }
  }
}
