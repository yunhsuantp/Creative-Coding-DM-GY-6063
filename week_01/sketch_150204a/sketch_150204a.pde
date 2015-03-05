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
  width = 600;
  height = 600;
  size(width, height);
  
  //noLoop();  //draw() will not loop
  frameRate(10);
}


void draw(){
  
  background(255);
  
  ellipse(width, 0, 8, 8);  //upper right corner
  ellipse(width, height, 8, 8);    //lower right corner
  //ellipse(width/2, height, 8, 8);    //midpoint of the bottom side
  ellipse(width/4*3, height, 8, 8);    //halfway between the midpoint of the bottom side and the lower right corner
  ellipse(width/2, height/2, 8, 8);    //1st point (the center of the arc)

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
    ellipse(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, 8, 8);  //the "Eighth" Point
    line(r + cos(radians(degree_3))*r, r + sin(radians(degree_3))*r, width/2, height/2);
    
    
    
    /*
    find the seventh point
    the function of the circle is "r^2=(x-r)^2+(y-r)^2"
    find the "range" of the seventh point on the arc
    the function of the line is y=mx+b
    put y=mx+b into r^2=(x-r)^2+(y-r)^2
    r^2 = (x-r)^2+(mx+b-r)^2
    ......
    x=(-m*b+r+m*r+sqrt(m*m*b*b+2*m*r*r-2*m*b*r+2*r*b-b*b-m*b*b))/(1+m*m)   |    x=(-m*b+r+m*r-sqrt(m*m*b*b+2*m*r*r-2*m*b*r+2*r*b-b*b-m*b*b))/(1+m*m)
    */
    
    float slope = (0-height)/(width-(width/4*3));  //the slope of the "line" from UR to the midP of B&LR   (m)
    float b = -slope * width;  //put UR point(width, 0) into y=mx+b, b=y-mx, b=-mx
    
    float x_1=0;
    float x_2=0;
    float m=slope;
    float radian_x_1 = 0;
    float radian_x_2 = 0;
    x_1 = (-m*b+r+m*r+sqrt(2*m*r*r-2*m*b*r+2*r*b-b*b))/(1+m*m);
    x_2 = (-m*b+r+m*r-sqrt(2*m*r*r-2*m*b*r+2*r*b-b*b))/(1+m*m);
    //x=r+r*cos(thita), cos(thita)=x/r-1, acos(x/r-1)=radian
    
    radian_x_1 = acos(x_1/r-1);
    radian_x_2 = acos(x_2/r-1);
    println(radian_x_1);
    println(radian_x_2);
    float radian_point7 = random(radian_x_1, radian_x_2);
    println(radian_point7);
    ellipse(r + cos(radian_point7)*r, r + sin(radian_point7)*r, 8, 8);
    line(width/2, height/2, r + cos(radian_point7)*r, r + sin(radian_point7)*r);
    
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
    find the seventh point
    the function of the circle is "r^2=(x-r)^2+(y-r)^2"
    find the "range" of the seventh point on the arc
    the function of the line is y=mx+b
    put y=mx+b into r^2=(x-r)^2+(y-r)^2
    r^2 = (x-r)^2+(mx+b-r)^2
    ......
    x=(-m*b+r+m*r+sqrt(m*m*b*b+2*m*r*r-2*m*b*r+2*r*b-b*b-m*b*b))/(1+m*m)   |    x=(-m*b+r+m*r-sqrt(m*m*b*b+2*m*r*r-2*m*b*r+2*r*b-b*b-m*b*b))/(1+m*m)
    */
    
    float slope = (0-height)/(width-(width/4*3));  //the slope of the "line" from UR to the midP of B&LR   (m)
    float b = -slope * width;  //put UR point(width, 0) into y=mx+b, b=y-mx, b=-mx
            println(slope);
    println(b);
    float x_1=0;
    float x_2=0;
    float m=slope;
    float radian_x_1 = 0;
    float radian_x_2 = 0;
    x_1 = (-m*b+r+m*r+sqrt(2*m*r*r-2*m*b*r+2*r*b-b*b))/(1+m*m);
    x_2 = (-m*b+r+m*r-sqrt(2*m*r*r-2*m*b*r+2*r*b-b*b))/(1+m*m);
    //x=r+r*cos(thita), cos(thita)=x/r-1, acos(x/r-1)=radian
        println(x_1);
    println(x_2);
    radian_x_1 = acos(x_1/r-1);
    radian_x_2 = acos(x_2/r-1);
    
    float radian_point7 = random(radian_x_1, radian_x_2);
    ellipse(r + cos(radian_point7)*r, r + sin(radian_point7)*r, 8, 8);
    line(r + cos(radian_point7)*r, r + sin(radian_point7)*r, width/2, height/2);
    
    
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
    find the seventh point
    the function of the circle is "r^2=(x-r)^2+(y-r)^2"
    find the "range" of the seventh point on the arc
    the function of the line is y=mx+b
    put y=mx+b into r^2=(x-r)^2+(y-r)^2
    r^2 = (x-r)^2+(mx+b-r)^2
    ......
    x=(-m*b+r+m*r+sqrt(m*m*b*b+2*m*r*r-2*m*b*r+2*r*b-b*b-m*b*b))/(1+m*m)   |    x=(-m*b+r+m*r-sqrt(m*m*b*b+2*m*r*r-2*m*b*r+2*r*b-b*b-m*b*b))/(1+m*m)
    */
    
    float slope = (0-height)/(width-(width/4*3));  //the slope of the "line" from UR to the midP of B&LR   (m)
    float b = -slope * width;  //put UR point(width, 0) into y=mx+b, b=y-mx, b=-mx
    
    float x_1=0;
    float x_2=0;
    float m=slope;
    float radian_x_1 = 0;
    float radian_x_2 = 0;
    x_1 = (-m*b+r+m*r+sqrt(2*m*r*r-2*m*b*r+2*r*b-b*b))/(1+m*m);
    x_2 = (-m*b+r+m*r-sqrt(2*m*r*r-2*m*b*r+2*r*b-b*b))/(1+m*m);
    //x=r+r*cos(thita), cos(thita)=x/r-1, acos(x/r-1)=radian
        println(x_1);
    println(x_2);
    radian_x_1 = acos(x_1/r-1);
    radian_x_2 = acos(x_2/r-1);
    
    float radian_point7 = random(radian_x_1, radian_x_2);
    ellipse(r + cos(radian_point7)*r, r + sin(radian_point7)*r, 8, 8);
    line(r + cos(radian_point7)*r, r + sin(radian_point7)*r, width/2, height/2);
    
  }
  
  
  
  }
