//Set the number of rows and columns in the grid.  w & h will be the size of the boxes
int cols = 50;
int rows = 50;
float w;
float h;
//Create the red snake.  Later will make the snake adjustable for different colors
Snake red;
//Create 2D array of GridBox objects
GridBox[][] grid = new GridBox[cols][rows];
void setup() {
  size(500, 500);
  w=width/cols;
  h=height/rows;
  //Initialize new GridBox objects
  for (int x = 0; x<cols; x++) {
    for (int y = 0; y<rows;y++) {
      grid[x][y] = new GridBox(x*w, y*h, w, h);
    }
  }
  //Initialize new Snake
  red = new Snake();
}
void draw() {  
  //Display grid, check for red snake
  for (int x = 0; x<cols; x++) {
    for (int y = 0; y<rows; y++) {
      grid[x][y].display();
      grid[x][y].snakeCheck(red);
      grid[x][y].updateBox();
    }
  }
  //move red snake
  red.move();
}

class GridBox {
  float x, y, w, h;
  color cFill, cStroke;
  boolean isFlipped;
  GridBox(float tx, float ty, float tw, float th) {
    x=tx;
    y=ty;
    w=tw;
    h=th;
    cFill = color(255);
    cStroke = color(0);
    isFlipped = false;
  }
  void display() {
    fill(cFill);
    stroke(cStroke);
    strokeWeight(1);
    rect(x, y, w, h);
  }
  boolean snakeCheck(Snake s) {
    if (s.x==x && s.y==y) {
      isFlipped=true;
//      cFill = color(255, 0, 0);
      return true;
    }
    else {
//      cFill = color(255, 255, 255);
      return false;
    }
  }
  void updateBox() {
    if (isFlipped) {
      cFill = color(255, 0, 0);
    }
  }
}

class Snake {
  int x;
  int y;
  int direction;
  int xspeed;
  int yspeed;
  int w;
  int h;
  Snake() {
    x=0;
    y=0;
    direction = 2;
    xspeed = 0;
    yspeed = 0;
    w=width/cols;
    h=height/rows;
  }
  void move() {
    if (direction == 0) {
      xspeed = 0;
      yspeed = 0;
    }
    if (direction == 1) {
      xspeed = 0;
      yspeed = -h;
    }
    if (direction == 2) {
      xspeed = w;
      yspeed = 0;
    }
    if (direction == 3) {
      xspeed = 0;
      yspeed = h;
    }
    if (direction == 4) {
      xspeed = -w;
      yspeed = 0;
    }
    x+=xspeed;
    y+=yspeed;
  }
}

