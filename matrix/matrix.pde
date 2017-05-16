Circle[] circles;
int numCircles = 50;
int maxDistance;
int minDistance;

void setup() {
  size(1024, 210);
  smooth();

  // create an array and fill it with circles
  circles = new Circle[numCircles];
  for (int i=0; i< numCircles; i++) {
    circles[i] = new Circle(random(width), random(height), random(5, 10));
  }
}

void draw() {
  // clear background
  background(010, 200, 20);

  // update and display the circles
  for (int i=0; i< numCircles; i++) {
    circles[i].update();
    circles[i].display();
  }

  // define maximum distance
  //maxDistance = mouseX;
  maxDistance = 105;
  minDistance = 5;

  // look of the lines
  stroke(20, 250, 20, 100);
  strokeWeight(1);

  for (int i=0; i< numCircles; i++) {
    // compare circle to other circles
    for (int j=i+1; j< numCircles; j++) {
      // draw line if distance is below 'maxDistance'
      if (dist(circles[i].x, circles[i].y, circles[j].x, circles[j].y) < maxDistance) {
        line(circles[i].x, circles[i].y, circles[j].x, circles[j].y);
      }
    }
  }
}

class Circle {
  float x, y, dia;

  Circle(float x, float y, float dia) {
    this.x =x;
    this.y =y;
    this.dia = dia;
  }

  void update() {
    // code for movement here
    // this is just some random displacement
    x = x + random(-.5, .5);
    y = y + random(-.5, .5);
  }

  void display() {
    // code for drawing the circles
    noStroke();
    fill(30, 100, 190, 60);
    ellipse(x, y, dia, dia);
  }
}
