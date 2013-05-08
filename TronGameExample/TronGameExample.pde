int cols = 50;
int rows = 50;
float w;
float h;
Snake red;
GridBox[][] grid = new GridBox[cols][rows];
void setup() {
  size(500, 500);
  w=width/cols;
  h=height/rows;
  for (int x = 0; x<cols; x++) {
    for (int y = 0; y<rows;y++) {
      grid[x][y] = new GridBox(x*w, y*h, w, h);
    }
  }
  red = new Snake();
}
void draw() {  
  for (int x = 0; x<cols; x++) {
    for (int y = 0; y<rows; y++) {
      grid[x][y].display();
      grid[x][y].snakeCheck(red);
      //      grid[x][y].flip(mouseX, mouseY);
    }
  }
}

class GridBox {
  float x, y, w, h;
  color cFill, cStroke;
  GridBox(float tx, float ty, float tw, float th) {
    x=tx;
    y=ty;
    w=tw;
    h=th;
    cFill = color(255);
    cStroke = color(0);
  }
  void display() {
    fill(cFill);
    stroke(cStroke);
    strokeWeight(1);
    rect(x, y, w, h);
  }
  //  void flip(int mx, int my) {
  //    if (mx>x && mx<x+w && my>y && my<y+h) {
  //      if (mousePressed) {
  //        cFill = color(255, 0, 100);
  //      }
  //      else {
  //        cFill=color(255);
  //      }
  //    }
  //  }
  boolean snakeCheck(Snake s) {
    if (s.x==x && s.y==y) {
      cFill = color(255, 0, 0);
      return true;
    }
    else {
      cFill = color(255, 255, 255);
      return false;
    }
  }
}

class Snake {
  int x;
  int y;
  Snake() {
    x=0;
    y=0;
  }
  void move() {
  }
}

