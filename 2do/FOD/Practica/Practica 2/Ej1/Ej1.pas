program ej;

const
	
	valorAlto = 9999;

type

	str = String [20];

	empleado = record
		codigo:integer;
		nombre: str;
		montoComision : real;
	end;
	
	archivo = file of empleado;

	procedure leerTxt (var txt : Text; var e:empleado);
	begin
		readln(txt, e.codigo, e.nombre);
		readln(txt,e.montoComision);
	end;
	
	procedure leer (var txt: Text; var dato: empleado);
	begin
		if (not eof(txt)) then
			leerTxt(txt,dato)
		else
			dato.codigo := valorAlto;
	end;
	
	procedure mostrarDatos (e:empleado);
	begin
		writeln('------------------------------------------------------');
		writeln ('Codigo de empleado: ', e.codigo);
		writeln ('Nombre: ', e.nombre);
		writeln ('Monto de comision: ', e.montoComision:4:2);
		writeln('------------------------------------------------------');
	end;
	
	procedure mostrarRegistrosTXT (var txt:Text);
	var
		e:empleado;
	begin
		reset(txt);
		while (not eof (txt)) do begin
			leerTxt(txt,e);
			mostrarDatos(e);
		end;
		close(txt);
	end;
	
	procedure mostrarRegistrosArchivo (var a:archivo);
	var
		e:empleado;
	begin
		reset(a);
		while (not eof (a)) do begin
			read(a,e);
			mostrarDatos(e);
		end;
		close(a);
	end;
	
	procedure procesarTxt (var txt:Text; var a:archivo);
	var
		e,aux:empleado;
		total : real;
		cod:integer;
	begin
		reset(txt);
		assign (a,'archivoEmpleados');
		rewrite(a);
		leer(txt,e);
		while (e.codigo <> valorAlto) do begin
			aux := e;
			cod := e.codigo;
			total:= 0;
			while (cod = e.codigo) do begin
				total := total + e.montoComision;
				leer(txt,e);
			end;
			aux.montoComision := total;
			write(a,aux);
		end;
		close(txt);
		close(a);
	end;

var
	txt: Text;
	a:archivo;
begin
	assign (txt, 'infoEmpleados.txt');
	mostrarRegistrosTXT(txt);
	procesarTxt(txt,a);
	writeln('Comisiones totalizadas, archivo resumido: ');
	mostrarRegistrosArchivo(a);
end.
