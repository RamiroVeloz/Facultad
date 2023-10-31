package RepasoHoy;
public class HoySeAprueba {
public static void main(String[] args) {
        Estacion e = new Estacion ("1 y 50");
        
        Surtidor s1 = new Surtidor ("1000 litros",10,5);
        Surtidor s2 = new Surtidor ("2000 litros",10,3);
        Surtidor s3 = new Surtidor ("3000 litros",10,4);


        e.agregarSurtidor(s1);
        e.agregarSurtidor(s2);
        e.agregarSurtidor(s3);
        
        e.agregarVentaEnSurtidor(1, 1, 10, "Credito");
        e.agregarVentaEnSurtidor(1, 2, 20, "Debito");
        e.agregarVentaEnSurtidor(2, 3, 30, "Efectivo");
        e.agregarVentaEnSurtidor(2, 4, 40, "Efectivo");
        e.agregarVentaEnSurtidor(3,5, 50, "Debito");
        e.agregarVentaEnSurtidor(3, 6, 60, "Credito");
        
        System.out.println(e.toString());
        
        System.out.println("Surtidor con mas monto vendido: ");
        System.out.println(e.devolverMax());
        

        
    }
    
}
