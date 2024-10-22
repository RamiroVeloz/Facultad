program ej2;

type
	
	archivo = file of integer;

	procedure calcularArchivo (var n:archivo);
	var
		act:integer;
		menores:integer;
		cant , total : integer;
		prom:real;
	begin
		cant := 0;
		total := 0;
		menores := 0;
		prom := 0.0;
		reset (n);
		while (not eof(n)) do begin
			read(n,act);
			if (act < 1500) then
				menores := menores + 1;
			cant :=  cant + 1;
			total := total + act;
		end;
		if (cant <> 0) then
			prom := total / cant;
		close(n);
		writeln('La cantidad de numeros menor a 1500 es : ', menores);
		writeln('La cantidad de numeros ingresados es : ', cant);
		writeln('La suma total de los numeros ingresados es: ', total);
		writeln('El promedio de los numeros es: ',prom:4:2);
	end;

var
	numeros : archivo;
begin
	assign (numeros, 'numeros.txt');
	calcularArchivo(numeros);
end.
