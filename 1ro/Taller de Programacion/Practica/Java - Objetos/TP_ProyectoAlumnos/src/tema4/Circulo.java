/*
5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio 
(double), el color de relleno (String) y el color de línea (String). 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para: 

- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
 */
package tema4;


public class Circulo extends Figura{
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo (double unRadio, String unColorRelleno, String unColorLinea){
        super(unColorRelleno,unColorLinea);
        this.radio = unRadio;
        this.colorRelleno = unColorRelleno;
        this.colorLinea = unColorLinea;
    }
    
    public Circulo(){
        
    }

    public double getRadio() {
        return radio;
    }


    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularPerimetro (){
        return (2*Math.PI*this.radio);
    }
    
    public double calcularArea(){
        return (Math.PI * (this.radio * this.radio));
    }
    
    @Override
    public String toString(){
        return super.toString() + "Radio: " + this.getRadio();
    }
    
}
