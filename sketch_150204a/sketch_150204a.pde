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
  width = 300;
  height = 600;
  size(width, height);
  
  //noLoop();  //draw() will not loop
  frameRate(2);
}


void draw(){
  
  background(255);
  
  //point(width, 0);             //upper right corner
  ellipse(width, 0, 8, 8);
  //point(width, height);        //lower right corner
  ellipse(width, height, 8, 8);
  //point(width/2, height);      //midpoint of the bottom side
  //ellipse(width/2, height, 8, 8);
  //point(width/4*3, height);    //halfway between the midpoint of the bottom side and the lower right corner
  ellipse(width/4*3, height, 8, 8);
  //point(width/2, height/2);    //1st point (the center of the arc)
  ellipse(width/2, height/2, 8, 8);

  line(width, 0, width/4*3, height);    //"line" from UR to the midP of B&LR
  
  
  //"two points" where an "arc" with its center at the "first point"
  float degree_1 = random(360);
  float degree_2 = random(360);
  float degree_3 = (degree_1 + degree_2)/2;
  
  
  if(width == height){
    float r = height/2;    //radius
    
    arc(width/2, height/2, 2*r, 2*r, radians(degree_1), radians(degree_2)); //arc(x, y, width, height, angle_start, angle_stop)
    //two points of the arc
    ellipse(r + cos(radians(degree_1))*r, r + sin(radians(degree_1))*r, 8, 8);
    ellipse(r + cos(radians(degree_2))*r, r + sin(radians(degree_2))*r, 8, 8);
    //point(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r);
    ellipse(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, 8, 8);  //the "Eighth" Point
    line(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, width/2, height/2);
    
    /*
    float degree_point7 = random(-45, 67.5);
    ellipse(r + cos(radians(degree_point7))*r, r + sin(radians(degree_point7))*r, 8, 8);
    line(r + cos(radians(degree_point7))*r, r + sin(radians(degree_point7))*r, width/2, height/2);
    */
    /*
    //find the seventh point
    float slope = (0-height)/(width-(width/4*3));  //the slope of the "line" from UR to the midP of B&LR
    println(slope);
    float b = -slope * width;//put UR point(width, 0) into y=mx+b, b=y-mx, b=-mx
    println(b);
    //the function of the circle is "r*r=(x-r)(x-r)+(y-r)(y-r)"
    //the range of the seventh point
    //put y=slope*x+b into r*r=(x-r)(x-r)+(y-r)(y-r)
    //r*r = (x-r)*(x-r)+((slope*x+b)-r)*((slope*x+b)-r);
    //(x-r)*(x-r) = r*r - ((slope*x+b)-r)*((slope*x+b)-r);
    //(x-r) = sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r)) & -sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r));
    //x = sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r)) + r & -sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r)) + r;
    
    //float x_1=0;
    //float x_2=0;
    //x_1 = sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r));
    //x_2 = -sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r));
      //println(x_1);
      //println(x_2);
      //println("test");
    
    */
  }
  
  if(width > height){
    float r = height/2;    //radius
    
    arc(width/2, height/2, 2*r, 2*r, radians(degree_1), radians(degree_2)); //arc(x, y, width, height, angle_start, angle_stop)
    
    //point((width/2) + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r);
    //ellipse((width/2) + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, 8, 8);
    //line((width/2) + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, width/2, height/2);
    
    //two points of the arc
    ellipse((width/2) + cos(radians(degree_1))*r, r + sin(radians(degree_1))*r, 8, 8);
    ellipse((width/2) + cos(radians(degree_2))*r, r + sin(radians(degree_2))*r, 8, 8);
    //point((width/2) + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r);
    ellipse((width/2) + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, 8, 8);  //the "Eighth" Point
    line((width/2) + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, width/2, height/2);
    
    /*
    float degree_point7 = random(-45, 67.5);
    ellipse(r + cos(radians(degree_point7))*r, r + sin(radians(degree_point7))*r, 8, 8);
    line(r + cos(radians(degree_point7))*r, r + sin(radians(degree_point7))*r, width/2, height/2);
    */
    /*
    //find the seventh point
    float slope = (0-height)/(width-(width/4*3));  //the slope of the "line" from UR to the midP of B&LR
    println(slope);
    float b = -slope * width;//put UR point(width, 0) into y=mx+b, b=y-mx, b=-mx
    println(b);
    //the function of the circle is "r*r=(x-r)(x-r)+(y-r)(y-r)"
    //the range of the seventh point
    //put y=slope*x+b into r*r=(x-r)(x-r)+(y-r)(y-r)
    //r*r = (x-r)*(x-r)+((slope*x+b)-r)*((slope*x+b)-r);
    //(x-r)*(x-r) = r*r - ((slope*x+b)-r)*((slope*x+b)-r);
    //(x-r) = sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r)) & -sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r));
    //x = sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r)) + r & -sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r)) + r;
    
    //float x_1=0;
    //float x_2=0;
    //x_1 = sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r));
    //x_2 = -sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r));
      //println(x_1);
      //println(x_2);
      //println("test");
    
    */
  }
  
  if(width < height){
    float r = width/2;      //radius
    
    arc(width/2, height/2, 2*r, 2*r, radians(degree_1), radians(degree_2)); //arc(x, y, width, height, angle_start, angle_stop)
    
    //two points of the arc
    ellipse(r + cos(radians(degree_1))*r, (height/2) + sin(radians(degree_1))*r, 8, 8);
    ellipse(r + cos(radians(degree_2))*r, (height/2) + sin(radians(degree_2))*r, 8, 8);
    //point(r + cos(radians(degree_3))*r, (height/2) + sin(radians(degree_3))*r);
    ellipse(r + cos(radians(degree_3))*r, (height/2) + sin(radians(degree_3))*r, 8, 8);  //the "Eighth" Point
    line(r + cos(radians(degree_3))*r, (height/2) + sin(radians(degree_3))*r, width/2, height/2);
    
    /*
    float degree_point7 = random(-45, 67.5);
    ellipse(r + cos(radians(degree_point7))*r, r + sin(radians(degree_point7))*r, 8, 8);
    line(r + cos(radians(degree_point7))*r, r + sin(radians(degree_point7))*r, width/2, height/2);
    */
    /*
    //find the seventh point
    float slope = (0-height)/(width-(width/4*3));  //the slope of the "line" from UR to the midP of B&LR
    println(slope);
    float b = -slope * width;//put UR point(width, 0) into y=mx+b, b=y-mx, b=-mx
    println(b);
    //the function of the circle is "r*r=(x-r)(x-r)+(y-r)(y-r)"
    //the range of the seventh point
    //put y=slope*x+b into r*r=(x-r)(x-r)+(y-r)(y-r)
    //r*r = (x-r)*(x-r)+((slope*x+b)-r)*((slope*x+b)-r);
    //(x-r)*(x-r) = r*r - ((slope*x+b)-r)*((slope*x+b)-r);
    //(x-r) = sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r)) & -sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r));
    //x = sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r)) + r & -sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r)) + r;
    
    //float x_1=0;
    //float x_2=0;
    //x_1 = sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r));
    //x_2 = -sqrt (r*r - ((slope*x+b)-r)*((slope*x+b)-r));
      //println(x_1);
      //println(x_2);
      //println("test");
      
      */
  }
  
  
  
  }
