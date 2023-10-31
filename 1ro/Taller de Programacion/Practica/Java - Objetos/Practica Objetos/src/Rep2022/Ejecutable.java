package Rep2022;
public class Ejecutable {
public static void main(String[] args) {
        CursoPresencial cp = new CursoPresencial (2023,10,1);
        CursoVirtual cv = new CursoVirtual (2020,10,"Locura.com");
        
        Alumno a1 = new Alumno (1,"Lucas");
        Alumno a2 = new Alumno (2,"Mara");
        Alumno a3 = new Alumno (3,"Sofia");
        Alumno a4 = new Alumno (4,"Rodrigo");
        Alumno a5 = new Alumno (5,"Sandro");
        Alumno a6 = new Alumno (6,"Pedro");
        Alumno a7 = new Alumno (7,"Paula");
        Alumno a8 = new Alumno (8,"Lorena");
        
        cp.agregarAlumno(a1);
        cp.agregarAlumno(a2);
        cp.agregarAlumno(a3);
        cp.agregarAlumno(a4);
        
        
        cv.agregarAlumno(a5);
        cv.agregarAlumno(a6);
        cv.agregarAlumno(a7);
        cv.agregarAlumno(a8);
        

        cp.incrementarAsistencia(1);
        cp.incrementarAsistencia(1);
        cp.incrementarAsistencia(1);
        cp.incrementarAsistencia(1);
        cp.incrementarAsistencia(2);
        cp.incrementarAsistencia(2);
        cp.incrementarAsistencia(2);
        cp.incrementarAsistencia(2);
        
        cv.incrementarAprobadas(5);
        cv.incrementarAprobadas(5);
        cv.incrementarAprobadas(5);

        cv.incrementarAprobadas(7);
        cv.incrementarAprobadas(7);
        cv.incrementarAprobadas(7);

        cv.incrementarAsistencia(5);
        cv.incrementarAsistencia(5);

        cv.incrementarAsistencia(7);
        cv.incrementarAsistencia(7);

        
        System.out.println("La cantidad de alumnos que pueden rendir en el curso virtual es: " + cv.cantQueRinden());
        System.out.println("La cantidad de alumnos que pueden rendir en el curso presencial es: " + cp.cantQueRinden());
    }
}
