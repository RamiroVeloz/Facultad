package tema4;

public class Ej03 {

    public static void main(String[] args) {
        Persona p = new Persona ("Jorge", 12345, 23);
        Trabajador t = new Trabajador ("Pedro", 6789, 34,"Electricista");
        System.out.println(p.toString());
        System.out.println(t.toString());
    }
    
}
