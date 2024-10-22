package Rep2;
public class Libro {
    private String titulo;
    private String nombrePrimerAutor;
    private double peso;
    
    
    public Libro(){
        
    }
    
    public Libro (String unTitulo, String unNPA, double unPeso){
        this.titulo =  unTitulo;
        this.nombrePrimerAutor = unNPA;
        this.peso = unPeso;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getNombrePrimerAutor() {
        return nombrePrimerAutor;
    }

    public double getPeso() {
        return peso;
    }
    
    public String toString (){
        return ("Titulo: " + this.getTitulo() + " Nombre del 1er autor: " + this.getNombrePrimerAutor() + " Peso: " + this.getPeso() );
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setNombrePrimerAutor(String nombrePrimerAutor) {
        this.nombrePrimerAutor = nombrePrimerAutor;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }
    
    
    
}
