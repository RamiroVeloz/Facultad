package TP1.ej9;
import java.util.Stack;

public class TestBalanceo {
	
	public static boolean validar (String exp) {
		Stack <Character> stack = new Stack<Character> ();
		for (int i = 0; i < exp.length(); i++) {
			char c = exp.charAt(i);
			if ((c == '{') || (c == '[') || (c == '(')) {
				stack.push(c);
			}
			else if ((c == '}') || (c == ']')||(c == ')')) {
				if (stack.isEmpty()) {
					return false;
				}
			char ap = stack.pop();
			if ((c == ')' && ap != '(') || (c == ']' && ap != '[') ||(c == '}' && ap != '{')) {
				return false;
			}
		}
	}
	return stack.isEmpty();
}
	
	public static void main (String [] args) {
		
		String s = "{([]})";
		if (validar(s)) {
			System.out.println("La cadena esta balanceada");
		} else {
			System.out.print("La cadena no esta balanceada");
		}
		
	}
		
		
		
}
