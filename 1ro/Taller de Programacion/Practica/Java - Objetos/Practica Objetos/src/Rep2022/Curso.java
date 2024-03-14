package Rep2022;
public abstract class Curso {
    private int anio;
    private int cantAlumnos;
    private int diml = 0;
    private Alumno [] alumnos;
    
    public Curso (int unAnio, int unaCantAlumnos){
        this.anio = unAnio;
        this.cantAlumnos = unaCantAlumnos;
        this.alumnos = new Alumno [this.cantAlumnos];
        for (int i = 0; i < this.cantAlumnos; i++){
            this.alumnos[i] = null;
        }
    }
    
    private boolean hayEspacio(){
        return (this.diml < this.cantAlumnos);
    }
    
    private Alumno devolverAlumno (int x){
        return this.alumnos[x];
    }
    
    public boolean agregarAlumno (Alumno a){
        if (this.hayEspacio()){
            this.alumnos[this.diml] = a;
            this.diml ++;
            return true;
        }else{
            return false;
        }
    }
    
    public void incrementarAsistencia (int dni){
        int aux = 0;
        boolean esta = false;
        while (aux < this.diml && !esta){
            if (this.devolverAlumno(aux).getDni() == dni ){
                this.devolverAlumno(aux).setAsistencias(this.devolverAlumno(aux).getAsistencias()+1);
                esta = true;
            }else{
                aux++;
            }
        }
    }
    
    public void incrementarAprobadas (int dni){
        int aux = 0; boolean esta = false;
        while (aux < this.diml && !esta){
            if (this.devolverAlumno(aux).getDni() == dni){
                this.devolverAlumno(aux).setAprobadas(this.devolverAlumno(aux).getAprobadas()+1);
                esta = true;
            }else{
                aux++;
            }
        }
    }
    
    public abstract boolean puedeRendir(Alumno a);
    
    public int cantQueRinden (){
        int aux = 0;
        for (int i = 0; i < this.diml; i++){
            if (this.puedeRendir(this.devolverAlumno(i))){
                aux++;
            }
        }
        return aux;
    }
    
}
