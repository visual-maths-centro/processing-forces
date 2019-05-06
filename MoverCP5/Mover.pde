
class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;

  Mover (float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
  }

  void update () {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0.0);
    
    checkEdges();
  }

  void render() {
    fill(0);
    noStroke();
    ellipse(position.x, position.y, 10, 10);
  }

  void checkEdges () {
    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
    }
    
    if (position.y > height) {
      position.y = height;
      velocity.y *= -1;
    } else if (position.y < 0) {
      position.y = 0;
      velocity.y *= -1;
    }
  }
}
