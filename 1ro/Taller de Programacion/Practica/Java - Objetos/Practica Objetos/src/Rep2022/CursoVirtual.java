package Rep2022;
public class CursoVirtual extends Curso {
    private String link;
    
    public CursoVirtual (int unAnio, int unaCant, String unLink){
        super(unAnio,unaCant);
        this.link = unLink;
    }
    
    public boolean puedeRendir (Alumno a){
        return (a.getAprobadas() >=3 && a.getAsistencias() >= 1);
    }
}
