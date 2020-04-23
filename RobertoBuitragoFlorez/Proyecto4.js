//https://p5js.org/es/examples/form-star.html
function setup() {
  createCanvas(1336, 1336);
  imagen = loadImage('assets/Estrellas.jpg');
}

function draw() {
  background(imagen);

  //Sol
  fill(252,255,32);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 150.0);
  star(0, 0, 35, 60, 20);
  pop();

  //Mercurio
  fill(230,133,91);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 40.0); //velocidad
  star(60, 60, 15, 15, 360);
  ///(Largo de la esquina,ancho de las esquinas,el numero de esquinas)
  pop();

   //venus
  fill(236,92,29);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 50.0); //velocidad
  star(90, 90, 20, 20, 360);
  ///(Largo de la esquina,ancho de las esquinas,el numero de esquinas)
  pop();

  //tierra
  fill(16,137,243);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 60.0); //velocidad
  star(130, 130, 25, 25, 360);
  ///(Largo de la esquina,ancho de las esquinas,el numero de esquinas)
  pop();

  //marte
  fill(219,36,36);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 70.0); //velocidad
  star(170, 170, 23, 23, 360);
  ///(Largo de la esquina,ancho de las esquinas,el numero de esquinas)
  pop();

   //jupiter
  fill(219,230,58);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 90.0); //velocidad
  star(230, 230, 50, 50, 360);
  ///(Largo de la esquina,ancho de las esquinas,el numero de esquinas)
  pop();

  //saturno
  fill(234,208,176);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 100.0); //velocidad
  star(300, 300, 40, 40, 360);
  ///(Largo de la esquina,ancho de las esquinas,el numero de esquinas)
  pop();

    //Urano
  fill(116,245,247);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 110.0); //velocidad
  star(360, 360, 30, 30, 360);
  ///(Largo de la esquina,ancho de las esquinas,el numero de esquinas)
  pop();

   //Neptuno
  fill(7,60,175);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 120.0); //velocidad
  star(410, 410, 29, 29, 360);
  ///(Largo de la esquina,ancho de las esquinas,el numero de esquinas)
  pop();

   //plutón
  fill(122,20,207);
  push();
  translate(width * 0.5, height * 0.5);
  rotate(frameCount / 130.0); //velocidad
  star(450, 450, 10, 10, 360);
  ///(Largo de la esquina,ancho de las esquinas,el numero de esquinas)
  pop();


  
}

function star(x, y, radius1, radius2, npoints) {
  let angle = TWO_PI / npoints;
  let halfAngle = angle / 2.0;
  beginShape();
  for (let a = 0; a < TWO_PI; a += angle) {
    let sx = x + cos(a) * radius2;
    let sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a + halfAngle) * radius1;
    sy = y + sin(a + halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}