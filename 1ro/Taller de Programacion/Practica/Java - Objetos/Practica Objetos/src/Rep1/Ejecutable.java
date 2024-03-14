package Rep1;
public class Ejecutable {
public static void main(String[] args) {
        Agenda a = new Agenda ();
        
        Paciente p1 = new Paciente ("Jorge", true, 1200);
        Paciente p2 = new Paciente ("Pablo", false, 2200);
        Paciente p3 = new Paciente ("Sandra", true, 3200);
        Paciente p4 = new Paciente ("Marta", false, 4200);
        Paciente p5 = new Paciente ("Pablo", true, 5200);
        Paciente p6 = new Paciente ("Ana", false, 6200);
        
        a.agendarPaciente(p1, 1, 1);
        a.agendarPaciente(p2, 2, 2);
        a.agendarPaciente(p3, 5, 1);
        a.agendarPaciente(p4, 4, 4);
        a.agendarPaciente(p5, 1, 2);
        a.agendarPaciente(p6, 2, 3);
        
        System.out.println(a.toString());
        a.liberarTurnosPaciente("Pablo");
        System.out.println(a.toString());
        System.out.println(a.consultarTurno(3, "Sandra"));
        System.out.println(a.consultarTurno(1, "Jorge"));
    }
    
}
