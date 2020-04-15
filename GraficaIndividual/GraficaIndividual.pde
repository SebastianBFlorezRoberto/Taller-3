
import controlP5.*;

ControlP5 cp5;
Table table;


//el valor en donde se encuentra el slider
int valSlider;

//numero de filas en el archivo
int rowCount;

//variable que guarda toda la información de la columna del tiempo
String [] fecha; 

//segundo
//variable que guarda toda la información de la columna del total de suscriptores
int [] tec3;

//tercero
//me da el valor maximo 
int maxDato;
//tamaño de la barra
float [] barraTotal;

//cuarto
int [] tec1;
float [] barraTec1;

//quinto
int [] tec2;
float [] barraTec2;

int [] total;
float [] totalTec;

//sexto
boolean toggleValue = false;//botton prender apagar 

//septimo
Knob myKnobA;

//octavo
Slider2D sliderPunto;


void setup() 
{
  size(1280,690);
  
  table = loadTable("prueba.csv", "header");
  
  rowCount = table.getRowCount();
  println(rowCount + " filas en la tabla");
   
  cp5 = new ControlP5(this);  

  gui();
  
  fecha = new String [rowCount];
  
  
  //segundo
  tec3 = new int [rowCount];
  
  //tercero
  barraTotal = new float [rowCount];
  
  //cuarto
  tec1 = new int [rowCount];
  barraTec1 = new float [rowCount];
  
  //quinto
  tec2 = new int [rowCount];
  barraTec2 = new float [rowCount];
  
  //Total Tecnificación
  
  total = new int[rowCount];
    
  for(int i = 0; i < rowCount; i++)
  {
    //creamos un objeto que guarda la información de las filas de la tabla
    TableRow row = table.getRow(i);
    
    fecha[i] = row.getString("Fecha");
    
    //segundo
    tec3[i] = row.getInt("Tec1");
        
    //tercero
    
    if(tec3[i] > maxDato) 
    {
      maxDato =  tec3[i];
    }
    
    
    //cuarto
    tec1[i]= row.getInt("Tec2");
    
    //quinto
    tec2[i]= row.getInt("Tec3");
    
    //quinto
    total[i]= row.getInt("Total");
    
  }
     
  
}

void draw()
{
    background(0);

    drawPorcentage();

}

void gui()
{ 
    //slider
    cp5.addSlider("valSlider")
     .setPosition(200,10)
     .setWidth(650)
     .setRange(0,rowCount-1)//
     .setValue(1)//En que valor empieaza 
     .setNumberOfTickMarks(rowCount)//Cantidad de diviciones que quiero
     .setSliderMode(Slider.FLEXIBLE)
     ;
     // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
     
     //sexto
     //toggle
     
    cp5.addToggle("toggleValue")
     .setPosition(1000,600)
     .setSize(50,20)
     ;
     
     
     //septimo
     
     myKnobA = cp5.addKnob("knob")
               .setRange(0,1000)
               .setValue(100)
               .setPosition(800,170)
               .setRadius(50)
               .setDragDirection(Knob.VERTICAL)
               ;
               
    
    //octavo
    
    sliderPunto = cp5.addSlider2D("punto")
         .setPosition(1000,20)
         .setSize(100,100)
         .setMinMax(20,10,100,100)
         .setValue(50,50)
         ;
         

}

void drawPorcentage() 
{
    //println(valSlider);  
    
    textSize(10);    
    fill(255);
    for(int i = 0; i < rowCount; i++)
    { 
      float x = map(i, 0, rowCount-1, 200, 840);
      //text(tiempo[i], x, 340);
      
      pushMatrix();
      translate(x,40);
      rotate(PI/2);
      //se coloca el texto en cada linea
      text(fecha[i], 0, 0);
      popMatrix();      
    }
    
    //tercero
    textSize(22);    
    fill(88,189,219);
    text("Tecnificación 1 :" + tec3[valSlider],220,250);
    
    //cuarto
    fill(203,6,178);
    text("Tecnificación 2 :" + tec1[valSlider],220,280);
    
    //quinto
    fill(26,232,27);
    text("Tecnificación 3 :" + tec2[valSlider],220,310);
    
    
    //tercero    
    
    for(int i = 0; i < rowCount; i++)
    {
      barraTotal[i] = map(tec3[i], 0, maxDato, 0, 250);
      
      //cuarto      
      barraTec1[i] = map(tec1[i], 0, maxDato, 0, 250);
      
      //quinto      
      barraTec2[i] = map(tec2[i], 0, maxDato, 0, 120);
    }
    
    
    //tercero
    fill(88,189,219);
    rect(10,10,50,barraTotal[valSlider]);
    //rect(10,50,50,barraTotal[valSlider]);
    //fill(255);
    //text(barraTotal[valSlider]+" total suscriptores",420,250);
    
    //cuarto
    fill(203,6,178);
    rect(70,10,50, barraTec1[valSlider]);  
    //fill(255);
    //text(barraFijo[valSlider]+" fijo",420,280);
     
    //quinto
    fill(26,232,27);
    rect(130,10,50,barraTec2[valSlider]);  
    //fill(255);
    //text(barraMovil[valSlider]+" movil",420,310);
      
    //sexto  
    
    if(toggleValue==true) 
    {
      fill(255);
      text(barraTec2[valSlider]+" Tec2",460,310);
    }
    
    
    //septimo
    println(myKnobA.getValue());
    if(myKnobA.getValue() >500)
    {
      fill(255);
      text(barraTec1[valSlider]+" Tec1",460,280);
    }
    
    
    //octavo
    
    if(sliderPunto.getArrayValue()[0] > 0)
    {
      fill(255);
      text(barraTotal[valSlider]+" Tec3 ",455,250);
    }
    
    if(sliderPunto.getArrayValue()[1] > 70)
    {
      fill(255);
      text(" Listo!!  ",420,500);
    }
    
  
}
