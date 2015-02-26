// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float value = 5;
  color c;

  Mover(float m, float x , float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    c = color(random(255), random(255), random(255), 100);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(100);
    strokeWeight(1);
    fill(c);
    ellipse(location.x,location.y,mass*value,mass*value);
    //add 1 to the value when mouse press
    if (mousePressed == true) {
      value = value+1;
    } 
      
     
  }

  

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }

  }

}

  void keyPressed(){
    //a new Mover object
    Mover movers_add = new Mover(random(1, 3), random(width), 0);
    movers = (Mover[]) append(movers, movers_add);
  }

