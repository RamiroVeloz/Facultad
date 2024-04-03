program ej3;

type
	
	str = string[20];

	empleado = record
		num : integer;
		ap: str;
		nom : str;
		edad : integer;
		dni:integer;
	end;
	
	archivo = file of empleado;

	procedure lectura (var e:empleado);
	begin
		write('Ingrese el numero de empleado: '); readln(e.num);
		write('Ingrese el apellido del empleado o "fin" para terminar el programa: ');readln(e.ap);
		if (e.ap <> 'fin') then begin
			write('Ingrese el nombre: '); readln(e.nom);
			write('Ingrese la edad: '); readln(e.edad);
			write('Ingrese el dni: '); readln(e.dni);
		end;
	end;
	
	procedure cargarEmpleados (var a:archivo);
	var
		e:empleado;
	begin
		lectura(e);
		while (e.ap <> 'fin') do begin
			write(a,e);
			lectura(e);
		end;
	end;
	
	procedure mostrarDatos (e:empleado);
	begin
		writeln('-----------------------------------------');
		writeln('Numero de empleado: ',e.num);
		writeln('Apellido: ',e.ap);
		writeln('Nombre: ',e.nom);
		writeln('Edad: ',e.edad);
		writeln('DNI: ',e.dni);
		writeln('-----------------------------------------');
		writeln();
	end;
	
	procedure buscarNA (var a:archivo);
	var
		esta : boolean;
		e: empleado;
		bus : str;
	begin
		esta := false;
		write('Ingrese el nombre o apellido de los empleados que desea buscar: '); readln(bus);
		reset(a);
		while (not eof(a)) do begin
			read(a,e);
			if ((e.nom = bus) or (e.ap = bus)) then begin
				mostrarDatos(e);
				esta := true;
			end;
		end;
		if (not esta) then
			writeln('El nombre o apellido que busca no se encuentra en la lista.');
 	end;
	
	procedure mostrarMayores (var a:archivo);
	var
		e:empleado;
	begin
		while (not eof(a)) do begin
			read(a,e);
			if (e.edad > 70) then
				mostrarDatos(e);
		end;
	end;
	
	procedure mostrarEmpleados (var a:archivo);
	var
		e:empleado;
	begin
		reset(a);
		while (not eof(a)) do begin
			read (a,e);
			mostrarDatos(e);
		end;
	end;
	
	procedure menu (var a:archivo);
	var
		op: integer;
	begin
	
		writeln('Ingrese 1 para agregar empleados al archivo: ');
		writeln('Ingrese 2 para mostrar a todos los empleados: ');
		writeln('Ingrese 3 para buscar por nombre o apellido a empleados con tales datos: ');
		writeln('Ingrese 4 para listar a los empleados mayores de 70 :');
		writeln('Ingrese 5 para salir: ');
		write('Ingrese su opcion: '); readln(op);
		while (op <> 5) do begin
			if (op = 1) then
				cargarEmpleados(a)
			else if (op = 2) then
				mostrarEmpleados(a)
			else if (op = 3) then
				buscarNA(a)
			else if (op = 4) then
				mostrarMayores(a);
			writeln('Ingrese 1 para agregar empleados al archivo: ');
			writeln('Ingrese 2 para mostrar a todos los empleados: ');
			writeln('Ingrese 3 para buscar por nombre o apellido a empleados con tales datos: ');
			writeln('Ingrese 4 para listar a los empleados mayores de 70 :');
			writeln('Ingrese 5 para salir: ');
			write('Ingrese su opcion: '); readln(op);
		end;
		
	end;

var
	archivoEmpleados : archivo;
	nom : str;
begin
	write('Ingrese el nombre del archivo: '); readln(nom);
	assign (archivoEmpleados, nom);
	rewrite (archivoEmpleados);
	menu(archivoEmpleados);
	close(archivoEmpleados);
end.
