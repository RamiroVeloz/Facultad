/*
 Definir una clase para representar triángulos. Un triángulo se caracteriza por el 
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String). 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para: 

- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)

 */
package tema3;


public class Triangulo {
    private double ladoA;
    private double ladoB;
    private double ladoC;
    private String colorR,colorL;
    
    public Triangulo(){
        
    }
    
    public Triangulo (double ladoA, double ladoB, double ladoC, String colorR, String colorL){
        this.ladoA = ladoA;
        this.ladoB = ladoB;
        this.ladoC = ladoC;
        this.colorR = colorR;
        this.colorL = colorL;
    }
    
    public double getLadoA(){
        return this.ladoA;
    }
    
    public double getLadoB(){
        return this.ladoB;
    }
    
    public double getLadoC(){
        return this.ladoC;
    }
    
    public String getColorR(){
        return this.colorR;
    }
    
    public String getColorL(){
        return this.colorL;
    }
    
    public void setLadoA(double ladoA){
        this.ladoA = ladoA;
    }
    
    public void setLadoB(double ladoB){
        this.ladoB = ladoB;
    }
    
    public void setLadoC(double ladoC){
        this.ladoC = ladoC;
    }
    
    public void setColorR(String colorR){
        this.colorR = colorR;
    }
    
    public void setColorL (String colorL){
        this.colorL = colorL;
    }
    
    public double devolverPerimetro (){
        return (this.ladoA + this.ladoB + this.ladoC);
    }
    
    private double calcularSuperficie(){
        return (this.devolverPerimetro() / 2);
    }
    
    public double calcularArea (){
        double s = this.calcularSuperficie();
        return Math.sqrt(s*(s - this.ladoA)*(s - this.ladoB)*(s - this.ladoC));
    }
    
}
