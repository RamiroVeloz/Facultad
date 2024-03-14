package Rep2022;
public class Alumno {
    private int dni;
    private String nombre;
    private int asistencias = 0;
    private int aprobadas = 0;
    
    public Alumno (int unDni, String unNom){
        this.dni = unDni;
        this.nombre = unNom;
    }

    public int getDni() {
        return this.dni;
    }

    public String getNombre() {
        return this.nombre;
    }

    public int getAsistencias() {
        return this.asistencias;
    }

    public int getAprobadas() {
        return this.aprobadas;
    }

    public void setAsistencias(int asistencias) {
        this.asistencias = asistencias;
    }

    public void setAprobadas(int aprobadas) {
        this.aprobadas = aprobadas;
    }
    
    
    
}
