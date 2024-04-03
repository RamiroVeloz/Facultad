package TP1.ej3;

public class test {
	
	public static void main (String [] args) {
		Estudiante [] ve = new Estudiante [2];
		Estudiante e1 = new Estudiante ("x",",",",",",",",");
		Estudiante e2 = new Estudiante ("y",",",",",",",",");
		ve[0] = e1;
		ve[1] = e2;
		
		Profesor [] vp = new Profesor [3];
		Profesor p1 = new Profesor ("a",",",",",",",",");
		Profesor p2 = new Profesor ("b",",",",",",",",");
		Profesor p3 = new Profesor ("c",",",",",",",",");
		vp[0] = p1;
		vp[1] = p2;
		vp[2] = p3;
		
		for (Estudiante e:ve) {
			System.out.println(e.toString());
			
		}
		
		for (Profesor p:vp) {
			System.out.println(p.toString());
		}
		
	}
	
}
