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
public class Triangulo extends Figura {
    private double ladoA;
    private double ladoB;
    private double ladoC;
    
    public Triangulo(){

    }
    
    public Triangulo(double unLadoA, double unLadoB, double unLadoC, String unColorR, String unColorL){
        super(unColorR,unColorL);
        this.ladoA = unLadoA;
        this.ladoB = unLadoB;
        this.ladoC = unLadoC;
    }

    public double getLadoA() {
        return ladoA;
    }

    public double getLadoB() {
        return ladoB;
    }

    public double getLadoC() {
        return ladoC;
    }

    public void setLadoA(double ladoA) {
        this.ladoA = ladoA;
    }

    public void setLadoB(double ladoB) {
        this.ladoB = ladoB;
    }

    public void setLadoC(double ladoC) {
        this.ladoC = ladoC;
    }
    
    private double calcularSuperficie(){
        return((this.ladoA + this.ladoB + this.ladoC) /2);
    }
    
    public double calcularArea(){
        double s = this.calcularSuperficie();
        return (Math.sqrt(s* (s - this.ladoA)*(s-this.ladoB)*(s-this.ladoC)));
    }
    
    public double calcularPerimetro(){
        return (this.ladoA + this.ladoB + this.ladoC);
    }
    
    public String toString(){
        return super.toString() + "Lado A: "+ this.ladoA + " Lado B: " + this.ladoB + " Lado C:" + this.ladoC;
    }
    
}
