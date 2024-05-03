package TP2.Ej4;
import TP2.ayed2024.src.tp2.ejercicio1.BinaryTree;
public class RedBinariaLlena {
	
	public RedBinariaLlena (){
	}
	
    public int retardoReenvio(BinaryTree<Integer> red) {
        int retHI = 0;
        int retHD = 0;
        if(red.hasLeftChild())
            retHI = retardoReenvio(red.getLeftChild());
        if(red.hasRightChild())
            retHD = retardoReenvio(red.getRightChild());
        return (Math.max(retHI, retHD) + red.getData());
    }
	
}
