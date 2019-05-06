
import controlP5.*;

ControlP5 cp5;

PVector gravity = new PVector(0, 0);
PVector wind = new PVector(0, 0);


void setup () {
  size(600, 600, P2D);

  setupControls();
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
}
