/*
5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio 
(double), el color de relleno (String) y el color de línea (String). 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para: 

- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
 */
package tema3;

public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo (double unRadio, String unColorRelleno, String unColorLinea){
        this.radio = unRadio;
        this.colorRelleno = unColorRelleno;
        this.colorLinea = unColorLinea;
    }
    
    public Circulo(){
        
    }

    public double getRadio() {
        return radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro (){
        return (2*Math.PI*this.radio);
    }
    
    public double calcularArea(){
        return (Math.PI * (this.radio * this.radio));
    }
    
}
