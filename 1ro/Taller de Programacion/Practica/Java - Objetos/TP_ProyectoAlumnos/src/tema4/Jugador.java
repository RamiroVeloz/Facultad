package tema4;

public class Jugador extends Empleado {
    private int jugados;
    private int goles;
    
    public Jugador (){ 
    }
    
    public Jugador (String unNombre, double unBasico, int unAnt, int cantJugados, int cantGoles){
        super(unNombre, unBasico,unAnt);
        this.jugados = cantJugados;
        this.goles = cantGoles;
    }

    public int getJugados() {
        return jugados;
    }

    public int getGoles() {
        return goles;
    }

    public void setJugados(int jugados) {
        this.jugados = jugados;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    public double calcularEfectividad(){
        return (this.goles / this.jugados);
    }
    
    public double calcularSueldoACobrar(){
        double aux = this.plusSueldo() + this.getSueldoBasico();
        if (this.calcularEfectividad() > 0.5){
            return (this.getSueldoBasico() + aux);
        }
        else{
            return this.getSueldoBasico();
        }
    }
    
}
