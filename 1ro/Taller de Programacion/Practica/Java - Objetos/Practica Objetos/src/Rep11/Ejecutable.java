package Rep11;
public class Ejecutable {
public static void main(String[] args) {
        Torneo t = new Torneo ("Copa Libertadores", 3,5);
        
        Goleador g1 = new Goleador ("Jorge","Boca",1);
        Goleador g2 = new Goleador ("Pablo","River",3);
        Goleador g3 = new Goleador ("Monica","Lanus",5);
        Goleador g4 = new Goleador ("Sofia","Racing",7);
        Goleador g5 = new Goleador ("Lucas","Independiente",9);
        Goleador g6 = new Goleador ("Laura","Chacarita",2);
        Goleador g7 = new Goleador ("Pedro","DyJ",4);
        Goleador g8 = new Goleador ("Juan","Newells",6);
        Goleador g9 = new Goleador ("Jazmin","Colon",8);
        
        t.agregarGoleadorEnFecha(1,g1);
        t.agregarGoleadorEnFecha(2,g2);
        t.agregarGoleadorEnFecha(1,g3);
        t.agregarGoleadorEnFecha(1,g4);
        t.agregarGoleadorEnFecha(3,g5);
        t.agregarGoleadorEnFecha(1,g6);
        t.agregarGoleadorEnFecha(2,g7);
        t.agregarGoleadorEnFecha(1,g8);
        t.agregarGoleadorEnFecha(3,g9);
        
        
        
        System.out.println(t.toString());
        
    }
    
}
