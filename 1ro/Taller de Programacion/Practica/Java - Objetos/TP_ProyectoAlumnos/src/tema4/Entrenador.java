package tema4;

public class Entrenador extends Empleado{
    private int campeonatos;
    
    public Entrenador(){   
    }
    
    public Entrenador(String unNombre, double unBasico, int unAnt, int cantCamp ){
        super(unNombre,unBasico,unAnt);
        this.campeonatos = cantCamp;
    } 

    public int getCampeonatos() {
        return campeonatos;
    }

    
    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    
    public double calcularEfectividad(){
        return (this.getAntiguedad() / this.campeonatos);
    }
    
    
    public double calcularSueldoACobrar(){
        double aux = this.getSueldoBasico() + this.plusSueldo();
        if (this.campeonatos >= 1 && this.campeonatos <= 4){
            return (aux + 5000);
        }
        else if (this.campeonatos >= 5 && this.campeonatos <=10){
            return (aux + 30000);
        }
        else if (this.campeonatos > 10){
            return (aux + 50000);
        }
        else{
            return aux;
        }
    }
    
    
    
}
