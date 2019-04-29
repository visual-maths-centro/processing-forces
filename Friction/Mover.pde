
class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover (float x, float y, float m) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    mass = m;
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
    ellipse(position.x, position.y, mass * 10, mass * 10);
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
  
  void applyForce (PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
}
