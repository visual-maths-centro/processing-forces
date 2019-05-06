
import controlP5.*;

ControlP5 cp5;

PVector gravity = new PVector(0, 0);
PVector wind = new PVector(0, 0);

Mover[] movers;

void setup () {
  size(600, 600, P2D);

  setupControls();

  movers = new Mover[20];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height), random(1, 4));
  }
}

void setupControls () {
  cp5 = new ControlP5(this);

  cp5.addSlider("y")
    .setPosition(20, 20)
    .setColorLabel(0)
    .setLabel("gravity")
    .setRange(-0.5, 0.5)
    .setValue(0)
    .plugTo(gravity);

  cp5.addSlider("x")
    .setPosition(20, 40)
    .setColorLabel(0)
    .setLabel("wind")
    .setValue(0)
    .setRange(-1.0, 1.0)
    .plugTo(wind);
}

void draw () {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    Mover mover = movers[i];
    mover.applyForce(gravity);
    mover.applyForce(wind);
    mover.applyForce(mover.friction());

    mover.update();
    mover.render();
  }
}
