package Rep2023;
public class Estudiante {
    private String nombreEstudiante;
    private String apellido;
    private int dni;
    
    
    public Estudiante (String unNE,String unAP, int unDni){
        this.nombreEstudiante = unNE;
        this.apellido = unAP;
        this.dni = unDni;

    }

    public String getNombreEstudiante() {
        return this.nombreEstudiante;
    }

    public int getDni() {
        return this.dni;
    }

    public String getApellido() {
        return this.apellido;
    }
    
    public String toString (){
        String aux="Nombre: " + this.getNombreEstudiante() + " | Apellido: " + this.getApellido() +" | DNI: " + this.getDni()  ;
        return aux;
    }
    
}
