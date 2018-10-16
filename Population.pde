class Population{
  Dot[] dots;
  int gen = 1;
  int leastStepsNeeded = 600;
  
  Population(int size) {
    dots = new Dot[size];
    for (int i = 0; i < size; i++) {
      dots[i] = new Dot();
    }
  }
  
  void show() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].show();
    }
  }
  
  void update(Terrain terrain) {
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].brain.step > leastStepsNeeded) {
        dots[i].dead = true;
      } else {
        dots[i].update(terrain);
      }
    }
  }
  
  void calculateFitness() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].calculateFitness();
    }
  }
  
  boolean noDotsLeft() {
    for(int i = 0 ; i < dots.length; i++) {
      if(!dots[i].dead && !dots[i].reachedGoal) {
        return false;
      }      
    }
    return true;
  }
  
  void naturalSelection() {
    Dot[] newDots = new Dot[dots.length];
    newDots[0] = dots[bestDot()].getChild();
    newDots[0].isBest = true;
    for(int i = 1; i < newDots.length; i++) {
      Dot parent = selectParent();
      newDots[i] = parent.getChild();
      newDots[i].brain.mutate();
    }
    dots = newDots.clone();
  } 
  
  private int bestDot(){
    float max = 0;
    int maxIndex = 0;
    for (int i = 0; i < dots.length; i++) {
      if(dots[i].fitness > max) {
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    if (dots[maxIndex].reachedGoal) {
      leastStepsNeeded = dots[maxIndex].brain.step;
      println(leastStepsNeeded);
    }
    
    return maxIndex;
  }
  
  
  private float fitnessSum() {
    float fitnessSum = 0;
    for(int i = 0; i < dots.length; i++) {
      fitnessSum += dots[i].fitness;
    }
    return fitnessSum;
  }
  
  private Dot selectParent() {
    float rnd = random(fitnessSum());
    float runningSum = 0;
    for(int i = 0; i < dots.length; i++) {
      runningSum += dots[i].fitness;
      if(runningSum > rnd) {
        return dots[i];
      }
    }
    return null;
  }
}
