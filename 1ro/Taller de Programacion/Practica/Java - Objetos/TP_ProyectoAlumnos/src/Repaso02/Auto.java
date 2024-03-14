package Repaso02;
public class Auto {
    private String nombreDueno;
    private String patente;
    
    public Auto (){
        
    }
    
    public Auto (String unNom, String unaPat){
        this.nombreDueno = unNom;
        this.patente = unaPat;
    }

    public String getNombreDueno() {
        return this.nombreDueno;
    }

    public String getPatente() {
        return this.patente;
    }

    public void setNombreDueno(String nombreDueno) {
        this.nombreDueno = nombreDueno;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    
    @Override
    public String toString (){
        return ("Nombre del Dueno : "+ this.nombreDueno + " Patente: " + this.patente);
    }
    
}
