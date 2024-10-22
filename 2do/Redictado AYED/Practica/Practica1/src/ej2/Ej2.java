package ej2;
import java.util.Scanner;

public class Ej2 {

	public static void main(String[] args) {
		
		System.out.println("Ingrese un numero: ");
		Scanner s = new Scanner (System.in);
		int size = s.nextInt();
		int [] arr = new int [size];
		for (int i = 0; i < size; i++) {
			arr[i] = (i+1)*size;
		}
		System.out.println();
		for (int elem : arr) {
			System.out.println(elem);
		}
		
	}

}
