package ej2;
import java.util.Scanner;
public class Ej2 {

	public static int [] arregloN (int n) {
		int [] arr = new int [n];
		
		for (int i = 0; i < n; i++) {
			arr[i] = (i + 1) * n ;
		}
		
		return arr;
	}
	
	public static void main(String[] args) {
		int n = 1;
		while (n != 0) {
			System.out.println("Ingrese un numero o 0 para terminar: ");
			Scanner x = new Scanner (System.in);
			n = x.nextInt();
			int [] arreglo = arregloN(n);
			for (int num : arreglo) {
				System.out.println(num);
			}
		}
		System.out.println("Fin");
	}

}
