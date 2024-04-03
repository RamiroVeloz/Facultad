package TP1.ej5;

public class test {
	public static void main (String [] args) {
		int [] arr = new int [5];
		arr[0] = 1;
		arr[1] = 2;
		arr[2] = 3;
		arr[3] = 4;
		arr[4] = 5;
		
		
		metodos m = new metodos (arr);
		System.out.println(m.puntoA(arr));
		System.out.println(m.puntoB());
		m.puntoC();
	}
}
