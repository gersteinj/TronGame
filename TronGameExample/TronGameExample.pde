int cols = 10;
int rows = 10;
float w;
float h;
GridBox[][] grid = new GridBox[cols][rows];
void setup() {
  size(500,500);
  w=width/cols;
  h=height/rows;
  for (int x = 0; x<cols; x++) {
    for (int y = 0; y<rows;y++) {
      grid[x][y] = new GridBox(x*w, y*h, w, h);
    }
  }
}
void draw() {  
  for (int x = 0; x<cols; x++) {
    for (int y = 0; y<rows; y++) {
      grid[x][y].display();
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
}

