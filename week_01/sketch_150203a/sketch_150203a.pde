/*
From Sol Lewitt's Wall Drawing #118:

On a wall surface, any continuous stretch of wall, using a hard pencil, 
place fifty points at random.  
The points should be evenly distributed over the area of the wall.
All of the points should be connected by straight lines.
*/

void setup(){
  int width;
  int height;
  width = 800;
  height = 500;
  size(width, height);
  
  noLoop();  //draw() will not loop
  //frameRate(4);
}
void draw(){
  
  background(255);
  float width_Point1 = 0;
  float height_Point1 = 0;
  float width_Point2 = 0;
  float height_Point2 = 0;
  
  //draw 50 points
  for(int i=0; i<50;i++){
    float w = random(width);
    float h = random(height);
    point(w, h);
    println(w);
    println(h);
    width_Point1 = w;
    height_Point1 = h;
    
    //connect points
    if(i >0 && i< 50){
      //println(width_Point2);
      //println(height_Point1);
      line(width_Point2, height_Point2, width_Point1, height_Point1);  
      println(i);
      
    }
    width_Point2 = width_Point1;
    height_Point2 = height_Point1;
    //println(i);
    
  }
  line(width_Point2, height_Point2, width_Point1, height_Point1);

}
