import controlP5.*;

float STEP = 0.01;
float SIZE = 30;

ControlP5 cp5;

float a = 1;
float b = 1;
int m = 1;
float n1 = 1;
float n2 = 1;
float n3 = 1;

void setup() {
  size(1000, 1000);
  
  background(0);
  noFill();
  strokeWeight(1);
  smooth();
  stroke(255);
  
  
  cp5 = new ControlP5(this);
  cp5.addSlider("a")
      .setPosition(10, 10)
      .setRange(-10, 10)
      .setSize(200, 30);
  cp5.addSlider("b")
      .setPosition(10, 40)
      .setRange(-10, 10)
      .setSize(200, 30);
  cp5.addSlider("m")
      .setPosition(10, 70)
      .setRange(-10, 10)
      .setSize(200, 30);
  cp5.addSlider("n1")
      .setPosition(10, 100)
      .setRange(-10, 10)
      .setSize(200, 30);
  cp5.addSlider("n2")
      .setPosition(10, 130)
      .setRange(-10, 10)
      .setSize(200, 30);
  cp5.addSlider("n3")
      .setPosition(10, 160)
      .setRange(-10, 10)
      .setSize(200, 30);
  }

void draw() {
  background(0);
  pushMatrix();
  translate(width / 2, height / 2);
  drawSuperFormula(a, b, m, n1, n2, n3);
  popMatrix();
}


void drawSuperFormula(float a, float b, float m,
    float n1, float n2, float n3) {
  beginShape();
  for (float i = 0; i < 2 * PI * 2; i += STEP) {
    float rad = r(i, a, b, m, n1, n2, n3) * SIZE;
    vertex(cos(i) * rad, sin(i) * rad);
  }
  endShape(OPEN);
}

float r(float theta, float a, float b, float m,
    float n1, float n2, float n3) {
  return pow((pow(abs(cos(m * theta / 4)) / a, n2)
      + pow(abs(sin(m * theta / 4)) / b, n3)), -1 / n1);
}