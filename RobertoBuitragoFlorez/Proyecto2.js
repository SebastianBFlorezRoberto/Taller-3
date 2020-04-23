//https://p5js.org/examples/motion-linear.html
var a;
var y = 0;
var by;

function setup() {
  by = loadImage('assets/Fondo.jpg'); 
  createCanvas(720, 400);
  stroke(255);
  

  a = height / 2;
 
}

function draw() {
  //background(124,123,23);
  background(by);
//----------------------------- y arriba -----------------------------
 
  stroke(150, 100, 100);
  line(100, a, 600, a);
  a = a - 0.5;
  if (a < 0) {
    a = height;
  }
  
  stroke(56, 10, 60);
  line(120, a+a, 580, a+a);
  a = a - 0.5;
  if (a < 0) {
    a = height;
  }

  stroke(1, 2, 200);
  line(140, a+a+a, 560, a+a+a);
  a = a - 0.5;
  if (a < 0) {
    a = height;
  }



//-------------------------------------- y abajo ----------------------
stroke(1, 1, 1);
line(0, y, width, y);

  y++;
  if (y > height) {
    y = 0;
  }

  line(0, y, width, y);

  y++;
  if (y > height) {
    y = 0;
  }

}
