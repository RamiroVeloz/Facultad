package tema4;

public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;
    
    public Empleado(){
        
    }
    
    public Empleado (String unNombre, double unBasico, int unaAnt){
        this.nombre = unNombre;
        this.sueldoBasico = unBasico;
        this.antiguedad = unaAnt;
    }

    public String getNombre() {
        return nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public abstract double calcularSueldoACobrar();
    
    
    public double plusSueldo(){
        return ((this.sueldoBasico * 0.10)*this.antiguedad);
    }
    
    
    public String toString(){
        return ("Nombre: " + this.nombre + "Sueldo Basico: " + this.calcularSueldoACobrar() + " Efectividad:" + this.calcularEfectividad());
    }
}
