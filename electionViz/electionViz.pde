PImage map;

void setup() {
  size(width,height);
  map = loadImage("usamap.gif");
}

void draw() {
  background(0);
  image(map,0,0);
}
