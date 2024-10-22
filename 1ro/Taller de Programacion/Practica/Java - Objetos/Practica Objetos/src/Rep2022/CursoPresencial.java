package Rep2022;
public class CursoPresencial extends Curso {
    private int numAula;
    
    public CursoPresencial (int unAnio, int unaCant, int num){
        super(unAnio,unaCant);
        this.numAula = num;
        
    }
    
    public boolean puedeRendir (Alumno a){
        return (a.getAsistencias() >= 3);
    }
    
}
