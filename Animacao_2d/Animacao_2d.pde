int move = 5;
int rotate = 1;
float scale = 1;
int xTranslatePosition = 10;
int yTranslatePosition = 300;
int xRotatePosition = 140;
int yRotatePosition = 100;
int xScalePosition = 20;
int yScalePosition = 450;
int squareSize = 80;
String way = "r";
String size = "g";

void setup(){ 
  size(600, 700);
  background(255);
  noStroke();
  frameRate(20);
}

void draw() {
  background(255);
  fill(0, 0, 0);
  
  drawTranslateSquare();
  drawRotateSquare();
  drawScaleSquare();
}

void drawTranslateSquare() {
  pushMatrix();
  translate(xTranslatePosition, yTranslatePosition);
  rect(0, 0, squareSize, squareSize);
  popMatrix();
  
  if (way == "r") xTranslatePosition += move;
  else xTranslatePosition -= move;
  
  if (xTranslatePosition >= (590 - squareSize)) way = "l";
  if (xTranslatePosition <= 10) way = "r";
}

void drawRotateSquare() {
  smooth();
  pushMatrix();
  translate(xRotatePosition, yRotatePosition);
  rotate(radians(rotate));
  rect(0, 0, squareSize, squareSize);
  popMatrix();
  
  rotate += 1;
}

void drawScaleSquare() {
  stroke(0);
  pushMatrix();
  translate(xScalePosition, yScalePosition);
  scale(scale);
  rect(0, 0, squareSize, squareSize);
  popMatrix();
  
  if (size == "g") scale += 0.1; 
  if (size == "d") scale -= 0.1;
  
  if (scale >= 2) size = "d"; 
  if (scale <= 1) size = "g";
}
