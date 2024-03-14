/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author limbo
 */
public class Ej01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo tri = new Triangulo (1,2,3,"Amarillo","Rojo");
        Circulo cir = new Circulo (20,"Rojo","Negro");
        System.out.println(tri.toString());
        System.out.println(cir.toString());
        tri.Despintar();
        cir.Despintar();
        System.out.println(tri.toString());
        System.out.println(cir.toString());
    }
    
}
