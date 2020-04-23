//https://p5js.org/examples/transform-translate.html

var x = 0;
var y = 0;
var dim = 80.0;
//var imag;

/*function preload()//Cargar imagenes, fuentes, audio ,videos en web 
{
  imag = loadImage('assets/Fondo.jpg');
}*/

function setup() {
  //imag = loadImage('assets/Fondo.jpg');
  createCanvas(720, 400);
  noStroke();
}

function draw() {
  background(122,20,207);
  // Animate by increasing our x value
  x = x + 0.8;
  // If the shape goes off the canvas, reset the position
  if (x > width + dim) {
    x = -dim;
  }

  // Even though our rect command draws the shape with its
  // center at the origin, translate moves it to the new
  // x and y position
  translate(x, height / 4 - dim / 4);
  fill(113,19,192);
  rect(-dim, -dim , dim, dim);

  // Transforms accumulate. Notice how this rect moves
  // twice as fast as the other, but it has the same
  // parameter for the x-axis value
  translate(x, height / 4.5 - dim / 4.5 );
  fill(104,17,176);
  rect(-dim, -dim , dim, dim);

  translate(x, height / 5 - dim / 5 );
  fill(95,16,161);
  rect(-dim, -dim , dim, dim);

  translate(x, height / 5.5 - dim / 5.5 );
  fill(85,14,145);
  rect(-dim, -dim , dim, dim);
  
  translate(x, height / 6 - dim / 6 );
  fill(76,13,130);
  rect(-dim, -dim , dim, dim);

   translate(x, height / 6.5 - dim / 6.5 );
  fill(67,11,114);
  rect(-dim, -dim , dim, dim);

   translate(x, height / 7 - dim / 7 );
  fill(58,10,99);
  rect(-dim, -dim , dim, dim);

   translate(x, height / 7.5 - dim / 7.5 );
  fill(49,8,83);
  rect(-dim, -dim , dim, dim);






  //------------------------------------------- cacharrear --------------------

}

