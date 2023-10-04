package tema4;
public class Ej06 {
    public static void main(String[] args) {
        Estacion e1 = new Estacion ("La plata",-34.921,57.955);
        ReporteAnual ra = new ReporteAnual (e1, 2021, 3);
        ra.mostrarTemps();
        System.out.println(ra.temperaturaMaxima());
        System.out.println(ra.toString());
        System.out.println();
        System.out.println();
        Estacion e2 = new Estacion ("Mar del plata",-38.002,-57.556);
        ReporteMensual rm = new ReporteMensual(e2,2020,4);
        rm.mostrarTemps();
        System.out.println(rm.temperaturaMaxima());
        System.out.println(rm.toString());
    }
    
}
