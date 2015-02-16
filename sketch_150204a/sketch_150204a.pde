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
  width = 500;
  height = 500;
  size(width, height);
  
  noLoop();  //draw() will not loop
  //frameRate(2);
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
    
    //find the seventh point
    //the function of the circle is "r^2=(x-r)^2+(y-r)^2"
    //find the "range" of the seventh point on the arc
    //the function of the line is y=mx+b
    //put y=mx+b into r^2=(x-r)^2+(y-r)^2
    //r^2 = (x-r)^2+(mx+b-r)^2
    //......
    //x=(-m*b+r+m*r+sqrt(2*m*m*r*r+m*m*b*r-m*b*r+m*r*r+2*r*b-b*b))/(1+m*m)   |    x=(-m*b+r+m*r-sqrt(2*m*m*r*r+m*m*b*r-m*b*r+m*r*r+2*r*b-b*b))/(1+m*m)
    
    
    float slope = (0-height)/(width-(width/4*3));  //the slope of the "line" from UR to the midP of B&LR   (m)
    println(slope);
    float b = -slope * width;  //put UR point(width, 0) into y=mx+b, b=y-mx, b=-mx
    println(b);
    
    float x_1=0;
    float x_2=0;
    x_1 = (-slope*b+r+slope*r+sqrt(2*slope*slope*r*r+slope*slope*b*r-slope*b*r+slope*r*r+2*r*b-b*b))/(1+slope*slope);
    x_2 = (-slope*b+r+slope*r-sqrt(2*slope*slope*r*r+slope*slope*b*r-slope*b*r+slope*r*r+2*r*b-b*b))/(1+slope*slope);
    //x=r+r*cos(thita), cos(thita)=x/r-1, acos(x/r-1)=degree
    
    float degree_x_1 = 0;
    float degree_x_2 = 0;
    degree_x_1 = acos(x_1/r-1);
    degree_x_2 = acos(x_2/r-1);
      println(x_1);
      println(x_2);
      println(degree_x_1);
      println(degree_x_2);
    
    
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
    //the function of the circle is "r^2=(x-r)^2+(y-r)^2"
    //find the "range" of the seventh point on the arc
    //the function of the line is y=mx+b
    //put y=mx+b into r^2=(x-r)^2+(y-r)^2
    //r^2 = (x-r)^2+(mx+b-r)^2
    //......
    //x=(-m*b+r+m*r+sqrt(2*m*m*r*r+m*m*b*r-m*b*r+m*r*r+2*r*b-b*b))/(1+m*m)   |    x=(-m*b+r+m*r-sqrt(2*m*m*r*r+m*m*b*r-m*b*r+m*r*r+2*r*b-b*b))/(1+m*m)
    
    
    float slope = (0-height)/(width-(width/4*3));  //the slope of the "line" from UR to the midP of B&LR   (m)
    println(slope);
    float b = -slope * width;  //put UR point(width, 0) into y=mx+b, b=y-mx, b=-mx
    println(b);
    
    float x_1=0;
    float x_2=0;
    x_1 = (-slope*b+r+slope*r+sqrt(2*slope*slope*r*r+slope*slope*b*r-slope*b*r+slope*r*r+2*r*b-b*b))/(1+slope*slope);
    x_2 = (-slope*b+r+slope*r-sqrt(2*slope*slope*r*r+slope*slope*b*r-slope*b*r+slope*r*r+2*r*b-b*b))/(1+slope*slope);
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
    //the function of the circle is "r^2=(x-r)^2+(y-r)^2"
    //find the "range" of the seventh point on the arc
    //the function of the line is y=mx+b
    //put y=mx+b into r^2=(x-r)^2+(y-r)^2
    //r^2 = (x-r)^2+(mx+b-r)^2
    //......
    //x=(-m*b+r+m*r+sqrt(2*m*m*r*r+m*m*b*r-m*b*r+m*r*r+2*r*b-b*b))/(1+m*m)   |    x=(-m*b+r+m*r-sqrt(2*m*m*r*r+m*m*b*r-m*b*r+m*r*r+2*r*b-b*b))/(1+m*m)
    
    
    float slope = (0-height)/(width-(width/4*3));  //the slope of the "line" from UR to the midP of B&LR   (m)
    println(slope);
    float b = -slope * width;  //put UR point(width, 0) into y=mx+b, b=y-mx, b=-mx
    println(b);
    
    float x_1=0;
    float x_2=0;
    x_1 = (-slope*b+r+slope*r+sqrt(2*slope*slope*r*r+slope*slope*b*r-slope*b*r+slope*r*r+2*r*b-b*b))/(1+slope*slope);
    x_2 = (-slope*b+r+slope*r-sqrt(2*slope*slope*r*r+slope*slope*b*r-slope*b*r+slope*r*r+2*r*b-b*b))/(1+slope*slope);
      //println(x_1);
      //println(x_2);
      //println("test");
      */
  }
  
  
  
  }
