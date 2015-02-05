/*
From Sol Lewitt's Wall Drawing #305:

The "Eighth point" is located halfway between the "two points" 
where an "arc" with its center at the "first point" 
and with a radius equal to the distance between 
the first and the "seventh" points would cross a "line" 
from the upper right 'corner' to a "point"
halfway between the 'midpoint' of the bottom side and the lower right 'corner'.
*/

void setup(){
  int width;
  int height;
  width = 800;
  height = 500;
  size(width, height);
  
  noLoop();  //draw() will not loop
}
void draw(){
  background(255);
  
  //point(width, 0);             //upper right corner
  ellipse(width, 0, 8, 8);
  //point(width, height);        //lower right corner
  ellipse(width, height, 8, 8);
  //point(width/2, height);      //midpoint of the bottom side
  ellipse(width/2, height, 8, 8);
  //point(width/4*3, height);    //halfway between the midpoint of the bottom side and the lower right corner
  ellipse(width/4*3, height, 8, 8);
  //point(width/2, height/2);    //1st point (the center of the arc)
  ellipse(width/2, height/2, 8, 8);

  line(width, 0, width/4*3, height);    //"line" from UR to the midP of B&LR
  
  if(width == height){
    float r = height/2;    //radius
    
    //"two points" where an "arc" with its center at the "first point"
    float degree_1 = random(360);
    float degree_2 = random(360);
    float degree_3 = (degree_1 + degree_2)/2;
    
    arc(width/2, height/2, 2*r, 2*r, radians(degree_1), radians(degree_2)); //arc(x, y, width, height, angle_start, angle_stop)
    //point(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r);
    ellipse(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, 8, 8);
    line(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, width/2, height/2);
  }
  
  if(width > height){
    float r = height/2;    //radius
    
    //"two points" where an "arc" with its center at the "first point"
    float degree_1 = random(360);
    float degree_2 = random(360);
    float degree_3 = (degree_1 + degree_2)/2;
    
    arc(width/2, height/2, 2*r, 2*r, radians(degree_1), radians(degree_2)); //arc(x, y, width, height, angle_start, angle_stop)
    //point(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r);
    ellipse(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, 8, 8);
    line(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, width/2, height/2);
  }
  
  if(width < height){
    float r = width/2;      //radius
    
    //"two points" where an "arc" with its center at the "first point"
    float degree_1 = random(360);
    float degree_2 = random(360);
    float degree_3 = (degree_1 + degree_2)/2;
    
    arc(width/2, height/2, 2*r, 2*r, radians(degree_1), radians(degree_2)); //arc(x, y, width, height, angle_start, angle_stop)
    //point(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r);
    ellipse(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, 8, 8);
    line(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, width/2, height/2);
  }
  
  
  
  }
