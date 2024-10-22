program ej1;
type
	
	str = string [20];
	archivo = file of integer;
	
	procedure agregarNumeros (var n:archivo);
	var
		x : integer;
	begin
		write('Ingrese un numero para agregar al archivo: '); readln(x);
		while (x <> 3000) do begin
			write(n,x);
			write('Ingrese un numero para agregar al archivo: '); readln(x);
		end;
	end;
	
	procedure recorrerArchivo (var n:archivo);
	var
		x : integer;
	begin
		reset(n);
		while (not eof(n)) do begin
			read(n,x);
			writeln(x)
		end;
		close(n);
	end;
	
	
var
	numeros : archivo;
	nom : str;
begin

	write('Ingrese el nombre del archivo: '); readln(nom);
	assign(numeros,nom);
	rewrite(numeros);
	agregarNumeros(numeros);
	close(numeros);
	recorrerArchivo(numeros);
end.
