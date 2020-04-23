//https://p5js.org/examples/form-triangle-strip.html
var x;
var y;
var outsideRadius = 150;
var insideRadius = 100;

function setup() {
  createCanvas(1080, 400);
  background(204);
  x = width / 3 ;
  y = height / 2 ;
}

function draw() {
  background(204);

  var numPoints = int(map(mouseX, 0, width, 6, 60));
  var angle = 0;
  var angleStep = 180.0 / numPoints;

  /*beginShape(TRIANGLE_STRIP);
  for (var i = 0; i <= numPoints; i++) {
    var px = x + cos(radians(angle)) * outsideRadius;
    var py = y + sin(radians(angle)) * outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    vertex(px, py);
    angle += angleStep;
  }
  endShape();*/
 
 //--------------------------------------------------------------

   beginShape(TRIANGLE_STRIP);
  fill(233,228,227);
  for (var i = 0; i <= numPoints; i++) {
    var px = x + cos(radians(angle)) + outsideRadius + outsideRadius + outsideRadius * 2 ;
    var py = y + sin(radians(angle)) - outsideRadius - outsideRadius + outsideRadius * 2;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius * 1.4;
    py = y + sin(radians(angle)) * insideRadius * 1.4;
    vertex(px, py);
    angle += angleStep;
  }
  endShape();


  beginShape(TRIANGLE_STRIP);
  fill(45,43,32);
  for (var i = 0; i <= numPoints; i++) {
    var px = x + cos(radians(angle)) * outsideRadius;
    var py = y + sin(radians(angle)) * outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    vertex(px, py);
    angle += angleStep;
  }
  endShape();

  beginShape(TRIANGLE_STRIP);
  fill(253,32,0);
  for (var i = 0; i <= numPoints; i++) {
    var px = x + cos(radians(angle)) / outsideRadius + outsideRadius;
    var py = y + sin(radians(angle)) / outsideRadius + outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    vertex(px, py);
    angle += angleStep;
  }
  endShape();

  beginShape(TRIANGLE_STRIP);
  fill(253,32,0);
  for (var i = 0; i <= numPoints; i++) {
    var px = x + cos(radians(angle)) + outsideRadius;
    var py = y + sin(radians(angle)) - outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    vertex(px, py);
    angle += angleStep;
  }
  endShape();

  beginShape(TRIANGLE_STRIP);
  fill(255,216,0);
  for (var i = 0; i <= numPoints; i++) {
    var px = x + cos(radians(angle)) + outsideRadius + outsideRadius;
    var py = y + sin(radians(angle)) - outsideRadius + outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    vertex(px, py);
    angle += angleStep;
  }
  endShape();

  beginShape(TRIANGLE_STRIP);
  fill(253,32,0);
  for (var i = 0; i <= numPoints; i++) {
    var px = x + cos(radians(angle)) + outsideRadius ;
    var py = y + sin(radians(angle)) - outsideRadius + outsideRadius;
    angle += angleStep;
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    vertex(px, py);
    angle += angleStep;
  }
  endShape();

}
