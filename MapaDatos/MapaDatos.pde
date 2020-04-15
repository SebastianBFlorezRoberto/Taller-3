PImage Image;
Table tablaDeDatos;
float x = 0;
float y = 0;
int fill ;
float diametroCircunferencia = 10;
float columna3 = 0;
float minDatoColumna3 = 0;
float maxDatoColumna3 = 0;
String nombreDepartamento;




void setup() 
{
  size(580, 600);  
  

  
  Image = loadImage("MapaColombia.jpg");
  
  tablaDeDatos = loadTable("datos.tsv");
  
  fill = tablaDeDatos.getRowCount();
  println(fill);
  

for (int i = 0; i < fill; i++) 
  {
    
    columna3 = tablaDeDatos.getFloat(i, 3); 
    
    if (columna3 > maxDatoColumna3) 
    {
      maxDatoColumna3 = columna3;
    }
    if (columna3 < minDatoColumna3) 
    {
      minDatoColumna3 = columna3;
    }
  }
  }
  

void draw() 
{  
  image(Image, 0, 0);
for (int i = 0; i < fill; i++) 
  {
    nombreDepartamento = tablaDeDatos.getString (i,3);
    x = tablaDeDatos.getFloat(i, 1);  
    y = tablaDeDatos.getFloat(i, 2);  
    
    columna3 = tablaDeDatos.getFloat(i, 3);  
    diametroCircunferencia = map(columna3, minDatoColumna3, maxDatoColumna3, 20, 45);
     
     
            
    stroke(#000000);
    fill(#ffffff);
    ellipse(x, y, diametroCircunferencia, diametroCircunferencia);
    fill(#000000);
    println(nombreDepartamento);
    if(dist(x,y, mouseX,mouseY)< diametroCircunferencia){
    text(nombreDepartamento +","+ columna3,x,y);
    
    }
    
  }
}
