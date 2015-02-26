// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[10];  //create an array with 5 Mover objects
int value=10;

void setup() {
  size(600, 500);
  randomSeed(1);  //Each time we start the program we will always begin with the same random number.
  for (int i = 0; i < movers.length; i++) {
    //Fill the movers array with new Movers.
    //Each Mover is constructed with a random "mass" between 1&4, 
    //a random between 0&width, and a y-position of 0.
    
    movers[i] = new Mover(random(1, 3), random(width), 0);
  }
}

void draw() {
  background(255);
  //For each of the Mover objects in movers...
  for (int i = 0; i < movers.length; i++) {

    PVector wind = new PVector(0.01, 0);  //Create a new PVector of x=0.01, y=0 ; let’s call it wind
    PVector gravity = new PVector(0, 0.1*movers[i].mass);  
    //Create a new PVector of x=0,y=1/10th of our Mover mass; let’s call it gravity

    float c = 0.05;
    PVector friction = movers[i].velocity.get();  //Get the velocity vector of the current Mover object. Let’s call it friction
    //make our friction the “opposite” of our current velocity;
    //Then normalize the friction vector; 
    //Then scale the vector by 5% (0.05);
    friction.mult(-1); 
    friction.normalize();
    friction.mult(c);

    //Apply our forces;
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    //Update our Mover object data;
    //Display the Movers on screen;
    //Make sure we’re still inside the boundaries of our window.
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  
  
}









