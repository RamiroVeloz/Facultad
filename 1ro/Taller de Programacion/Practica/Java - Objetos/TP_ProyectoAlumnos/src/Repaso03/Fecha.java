package Repaso03;
public class Fecha {
    private String ciudad;
    private int dia;
    
    public Fecha(){
        
    }
    
    public Fecha(String unaCiudad, int unDia){
        this.ciudad = unaCiudad;
        this.dia = unDia;
    }
    
    public String getCiudad() {
        return ciudad;
    }

    public int getDia() {
        return dia;
    }
    
    
    
    
}
