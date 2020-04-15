import controlP5.*;

//https://www.openprocessing.org/sketch/105410
//Precio del 


ControlP5 cp5;
PImage fondo;
float R = 30; //Radio
float S = 5; //Distancia en Y 
float T = 10; //Distancia en X

int N = 8; //Numero de circunferencias

float ringX[] = new float[N];
float ringY[] = new float[N];
float ringK[] = new float[N];


//----------------------------------------------------------------------------------

Table table;
int valorSlider;
int rowCount;

String [] tiempo;

int [] costo;

float numCosto;
int maxData;

boolean cost = false;



//Dibujar la circunferencia 
void drawCurl(float x, float y, float r, float s, float t) { // 
  pushMatrix();
  translate(x, y); // traslada la grafica en Y 
  beginShape();
  vertex(-r, -t);
  bezierVertex(-r, s - t, +r, s - t, +r, -t);
  vertex(+r, +t);
  bezierVertex(+r, s + t, -r, s + t, -r, +t);
  endShape(CLOSE);
  popMatrix();
}

boolean paused = false; // empieza sin pausa 

PFont letraFuente;

//---------------------------------- setup ------------------------------

void setup() {
  size(750, 800); //Canvas

  //Data Space

  table = loadTable("datosInternetCompleto1.csv", "header");
  letraFuente = loadFont("SansSerif.bold-48.vlw");
  rowCount = table.getRowCount();
  println (rowCount + " numero de filas");
  fondo = loadImage("fondo.jpg");
  image(fondo,0,0);


  cp5 = new ControlP5(this);

  gui();

  tiempo = new String [rowCount];
  costo = new int [rowCount];

  for (int i = 0; i < N; i++) {
    ringX[i] = 0.5 * width; // Posicion en el canvas multiplicado por el ancho
    ringY[i] = 450; // Posicion entre circunferencias
    ringK[i] = i + 1; // Diametro entre circunferencia contando con la circunferencia anterior
  }

  for (int i = 0; i< rowCount; i++ )
  {
    TableRow row = table.getRow(i);
    tiempo[i] = row.getString("tiempo");
    costo[i] = row.getInt("produccion");

    if (costo[i] > maxData)
    {
      maxData = costo[i];

      println("Mayor dato es: " + maxData);
    }
  }
}



//------------------------------- gui -----------------------------


void gui() {



  //slider
  //"valSlider" es el nombre del controlador 
  cp5.addSlider("valSlider")
    .setPosition(50, 500)
    .setWidth(600)
    //se asigna en una variable las divisiones 0-13 dependiendo el numero de filas
    .setRange(0, rowCount-1)
    //Donde empieza el controlador 10= empieza en la division 10
    .setValue(0)
    //se asigna el numero de las divisiones que va a tener el slider de 0 -13 segun el rowCount
    .setNumberOfTickMarks(rowCount)
    //flexible y fix son formas de visualisar
    .setSliderMode(Slider.FLEXIBLE)
    ;
  // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
}



//función que se ejecuta cuando el slider se mueve 
void valSlider(int valor ) 
{ 
  //el valor en donde se encuentra el slider
  valorSlider = valor;
  println(valorSlider + "    " + numCosto);

  //variable para que salgan del centro los cubos pequeños, cada que se mueve el slider
  cost=false;
}


//------------------------------- grafica -----------------------------

void draw() {
  image(fondo,0,0);
  stroke(12, 45, 78);
  stroke(0x11, 0x11, 0x22); // relleno de circulo
  strokeWeight(2); //Grosor del borde

  drawPorcentage();

  numCosto = costo[valorSlider];
  if (!paused)


    for (int i = 0; i < N; i++) {
      float visual = map(numCosto, 3375986, 7512632, 20, 60);
      ringY[i] = visual * (N - i);
    }

  for (int i = N - 1; i >= 0; i--) {
    fill(0x66, 0x33, 0x33);
    drawCurl(ringX[i], ringY[i], R * ringK[i], -S * ringK[i], T);
    //drawCurl(ringX[i], ringY[i], -S * ringK[i], R * ringK[i], T);DOMO
  }

  for (int i = 0; i < N; i++) {
    fill(0x44, 0x88, 0x88);
    drawCurl(ringX[i], ringY[i], R * ringK[i], +S * ringK[i], T);
     //drawCurl(ringX[i], ringY[i], -S * ringK[i], R * ringK[i], T);DOMO
    
  }
}

void drawPorcentage() {

  textSize(15);    
  fill(0);
  for (int i = 0; i < rowCount; i++)
  { 
    float x = map(i, 0, rowCount-1, 50, 640);
    //text(tiempo[i], x, 340);

    pushMatrix();
    translate(x, 520);
    rotate(PI/2);
    //se coloca el texto en cada linea
    text(tiempo[i], 0, 0);
    popMatrix();
  }

  //tercero

  
  textFont(letraFuente);
  fill(#754a2a);
  textSize(22); 
  text("Valor cosecha : " + numCosto, 250, 620);
}
