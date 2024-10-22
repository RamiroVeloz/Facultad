package tema4;

public class Ej02 {

    public static void main(String[] args) {
        Jugador j = new Jugador ("Ramon", 2000.00, 5, 5,10);
        Entrenador e = new Entrenador ("Jorge", 3000.00, 5, 4);
        System.out.println(j.toString());
        System.out.println(e.toString());
    }
    
}
