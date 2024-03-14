package Repaso01;

import PaqueteLectura.GeneradorAleatorio;

public class Ejecutable {

    /*Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos 
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima 
todos los datos del proyecto en pantalla.*/
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        Subsidio s11 = new Subsidio(GeneradorAleatorio.generarDouble(100), GeneradorAleatorio.generarString(10));
        Subsidio s12 = new Subsidio(GeneradorAleatorio.generarDouble(100), GeneradorAleatorio.generarString(10));

        Investigador inv1 = new Investigador("JorgePerez", 2, "Electricista");
        inv1.agregarSubsidio(s11);
        inv1.agregarSubsidio(s12);
        
        Subsidio s21 = new Subsidio(GeneradorAleatorio.generarDouble(100), GeneradorAleatorio.generarString(10));
        Subsidio s22 = new Subsidio(GeneradorAleatorio.generarDouble(100), GeneradorAleatorio.generarString(10));
        Investigador inv2 = new Investigador("PedroSosa", 3, "Mecanico");
        inv2.agregarSubsidio(s21);
        inv2.agregarSubsidio(s22);
        
        
        Subsidio s31 = new Subsidio(GeneradorAleatorio.generarDouble(100), GeneradorAleatorio.generarString(10));
        Subsidio s32 = new Subsidio(GeneradorAleatorio.generarDouble(100), GeneradorAleatorio.generarString(10));
        Investigador inv3 = new Investigador("JulioMendez", 1, "Matematico");
        inv3.agregarSubsidio(s31);
        inv3.agregarSubsidio(s32);
        
        
        Proyecto p = new Proyecto("Magia Descontrolada", 10, "Dombuldore");

        p.agregarInvestigador(inv1);
        p.agregarInvestigador(inv2);
        p.agregarInvestigador(inv3);
        
        
        p.otorgarSubsidiosAInvestigador("JulioMendez");

        System.out.println(p.toString());
    }

}
