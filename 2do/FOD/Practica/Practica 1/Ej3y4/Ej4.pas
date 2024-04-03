program ej4;

type

		str = string[20];
	
		empleado = record
			num : integer;
			nom : str;
			ap : str;
			edad:integer;
			dni : integer;
		end;
		
		
		archivo = file of empleado;
		
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

		procedure mostrarEmpleados (var a:archivo);
		var
			e:empleado;
		begin
			reset(a);
			while (not eof(a)) do begin
				read (a,e);
				mostrarDatos(e);
			end;
			close(a);
		end;
		
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
		
		procedure agregarEmpleadosSinRepetir (var a:archivo);
		var
			e:empleado;
			act:empleado; flag:boolean;
		begin
			reset(a);
			lectura (e);
			while (e.ap <> 'fin') do begin
				while (not eof (a)) do begin
					flag := false;
					read(a,act);
					if (act.num = e.num) then
						flag := true;
				end;
				if (flag) then
					writeln('El numero de empleado que intenta registrar se encuentra en el archivo.')
				else
					write(a,e);
				lectura(e);
			end;
			close(a);	
		end;
		
		procedure cambiarEdad (var a:archivo);
		var
			e:empleado;
			flag : boolean;
			en,ne : integer;
		begin
			reset(a);
			flag := false;
			write('Ingrese el numero de empleado al que le desea modificar la edad: '); readln(ne);
			while (not eof(a)) and ( not flag ) do begin
				read(a,e);
				if (e.num = ne) then begin
					flag := true;
					writeln('Se encontro al empleado : ');
					mostrarDatos(e);
					write('A que numero le cambiara la edad?: '); readln(en);
					e.edad := en;
					seek (a, filepos(a)-1);
					write(a,e);
				end;
			end;
			if (flag) then
				writeln('La edad fue cambiada exitosamente.')
			else
				writeln('El empleado no fue encontrado');
			close(a);
		end;
		
		procedure exportarSinDni ( var a:archivo);
		var
			e:empleado;
			archivoTexto : Text;
		begin
			reset(a);
			assign(archivoTexto,'faltaDNIEmpleado.txt');
			rewrite(archivoTexto);
			while (not eof (a)) do begin
				read (a,e);
				if (e.dni = 00) then begin
					writeln(archivoTexto,'Numero de empleado: ',e.num);
					writeln(archivoTexto,'Apellido: ',e.ap);
					writeln(archivoTexto,'Nombre: ',e.nom);
					writeln(archivoTexto,'Edad: ',e.edad);
					writeln(archivoTexto,'DNI: ',e.dni);
				end;
			end;
			close(a);
		end;
	
var
	archivoEmpleados: archivo;
begin
	assign (archivoEmpleados, 'empleados');
	mostrarEmpleados(archivoEmpleados);
	agregarEmpleadosSinRepetir(archivoEmpleados);
	agregarEmpleadosSinRepetir(archivoEmpleados);
	cambiarEdad(archivoEmpleados);
	mostrarEmpleados(archivoEmpleados);
	exportarSinDni(archivoEmpleados);
end.
