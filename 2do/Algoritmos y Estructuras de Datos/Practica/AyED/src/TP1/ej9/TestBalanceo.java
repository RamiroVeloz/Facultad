package TP1.ej9;
import java.util.ArrayList;

public class TestBalanceo {
	
	public static void main (String [] args) {
		//Usamos un ArrayList ya que es mejor a la hora de acceder a los datos
		ArrayList <String> caracteres = new ArrayList <String> ();
		Boolean c1 = false,c2 = false,c3 = false;
		caracteres.add("{");
		caracteres.add("[");
		caracteres.add("(");
		caracteres.add("");
		caracteres.add("]");
		caracteres.add("}");
		caracteres.add("}");
		
		if (caracteres.size() == 0) {
			System.out.print("El string es de longitud cero, por ende esta balanceado.");
		} else {
			for (String c:caracteres) {
				if (c == "{") {
					c1 = caracteres.contains("}");
				} else if  (c == "["){
					c2 = caracteres.contains("]");
				} else if (c == "(") {
					c3 = caracteres.contains(")");
				}
			}
			if (c1 && c2 && c3) {
				System.out.println("El string esta balanceado");
			}else {
				System.out.println("El String no esta balancedo");
			}
		}
		
		
		
	}
}
