var lines = [];
var headers = [];
var data = [];

/**
 * function that runs before setup.  typically http requests done here
 * @return {[type]} [description]
 */
function preload(){
	lines = loadStrings('Cyclist_Count_by_Year_At_Selected_Commuter_Locations.csv');
	
}

function setupLines(){
	for(var i=0;i<lines.length;i++){
		if(i == 0){
			headers = split(lines[0],",");
			text(headers,100,100,800,800);			
		}
		else {
			data[i-1] = split(lines[i],",");
		}
	}
	print(data);
	//print(lines);

}

function setup() {
  //create our drawing canvas
  createCanvas(windowWidth, windowHeight);
  background(200);
  setupLines();
  textFont("Georgia");
  textSize(20);
/*
  var tempData = new Array(lines);
  for (var i = 0; i < lines.length; i++) {
    tempData[i] = new Array(headers);
  }

  for(var i = 1; i < lines.length; i++){
    tempData[i-1] = split(lines[i], ",");//assigns an array to each temData row
  }

  var data = new Array(tempData);*/

  for(var i = 0; i < data.length; i++){ //for each row
    for(var j = 0; j < data[i].length; j++){ //and for each col
      
      //var tempCellValue = split(tempData[i][j], "\"");
      /*
      if(data[1] == " " || data[1] == "N/A"){
        data[i][j] = 0;
        print(data[i][j]);
      }

      else {
        data[i][j] = Integer.parseInt(tempCellValue[1]);
        print(data[i][j]);
      }
      */
      data[i]= int(data[i]);
      print(data[i]);
    }
  }
  noLoop();

}



function draw() {
	
	//background(200);
  //visulaize with triangles
  for(var m=1; m<data.length; m++){
    for(var n=1; n<data[n].length; n++){
      
      fill(random(200), random(100),random(100), 50);
      stroke(random(200), random(100),random(100), 50);
      triangle(data[n]/30, data[n]/30, n*80+200, 0, 0, m*20+10);  //triangle(x1, y1, x2, y2, x3, y3)
      
    }
  }
  for(var i=0,j=0; i<data.length; i++){
      fill(255);
      text(data, j*80+200, i*20+10);
  }
}