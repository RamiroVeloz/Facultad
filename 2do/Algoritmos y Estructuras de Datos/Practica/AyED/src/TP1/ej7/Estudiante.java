package TP1.ej7;

public class Estudiante {
	private String nom;
	private String ap;
	private int dni;
	private int legajo;
	
	public Estudiante (String n, String a, int d, int l ) {
		this.nom = n;
		this.ap = a;
		this.dni = d;
		this.legajo = l;
	}


	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getAp() {
		return ap;
	}

	public void setAp(String ap) {
		this.ap = ap;
	}

	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public int getLegajo() {
		return legajo;
	}

	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}

	@Override
	public String toString() {
		return "Estudiante [nom=" + nom + ", ap=" + ap + ", dni=" + dni + ", legajo=" + legajo + "]";
	}
	
	
	
}
