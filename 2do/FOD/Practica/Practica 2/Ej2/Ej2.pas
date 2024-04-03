program ej2;

const
	
	valorAlto = 9999;
	
type

	str = string [20];

	alumno = record
		cod : integer;
		apellido : str;
		nombre : str;
		cursadas : integer;
		finales : integer;
	end;
	
	detalle = record
		cod : integer;
		tipo : str;
	end;
	
	archivoAlumnos = file of alumno;
	
	procedure leertxt (var txt: text; var a:alumno);
	begin
		readln (txt, a.cod);
		readln (txt, a.apellido, a.nombre);
		readln (txt, a.cursadas, a.finales);
	end;

	procedure leerMaestro (var mae:archivoAlumnos; var dato:alumno);
	begin
		if (not eof(mae)) then
			read(mae,dato)
		else
			dato.cod := valorAlto;
	end;
	
	procedure transformarDatos (var txt: Text; var mae : archivoAlumnos );
	var
		a:alumno;
	begin
		reset(txt);
		while (not eof (txt)) do begin
			leertxt(txt,a);
			write(mae,a);
		end;
		close(txt); close(mae);
	end;
	
	procedure mostrarDatos (a:alumno);
	begin
		writeln('-----------------------------------------');
		writeln('Codigo: ', a.cod);
		writeln('Apellido y nombre: ', a.apellido, a.nombre);
		writeln('Cantidad de cursadas aprobadas: ', a.cursadas);
		writeln('Cantidad de finales aprobados: ', a.finales);
		writeln('-----------------------------------------');
	end;
	
	procedure mostrarRegistrosAlumnos (var mae : archivoAlumnos);
	var
		a:alumno;
	begin
		reset(mae);
		leerMaestro(mae,a);
		while (a.cod <> valorAlto) do begin
			mostrarDatos(a);
			leerMaestro(mae,a);
		end;
		close(mae);
	end;
	
	procedure leerTxtD (var d:Text; var dato:detalle);
	begin
		readln(d, dato.cod);
		readln (d, dato.tipo);
	end;
	
	procedure leerDetalle (var d:Text; var dato:detalle);
	begin
		if (not eof (d)) then
			leerTxtD(d,dato)
		else
			dato.cod := valorAlto;
	end;
	
	procedure escribirReporte (var txt:Text; a:alumno);
	begin
		writeln (txt,'Codigo: ',a.cod , ' Apellido y Nombre: ',a.apellido,' ', a.nombre , ' Cantidad de cursadas aprobadas: ',a.cursadas , ' Cantidad de finales aprobados: ',a.finales);
	end;
	
	procedure actualizarMaestro (var mae:archivoAlumnos ; var det: Text);
	var
		a:alumno;
		d:detalle;
	begin
		reset (mae);
		reset (det);
		leerMaestro(mae,a);
		while (a.cod <> valorAlto) do begin
			leerDetalle(det,d);
			while (a.cod = d.cod ) do begin
				if (d.tipo = 'final') then begin
					a.finales := a.finales + 1;
					a.cursadas := a.cursadas - 1;
				end
				else
					a.cursadas := a.cursadas + 1;
				leerTxtD(det,d);
			end;
			seek (mae, filepos(mae) -1);
			write(mae,a);
			leerMaestro(mae,a);
		end;
		close(mae); close(det);
	end;
	
	procedure reporteFinales (var txt:Text; var mae:archivoAlumnos);
	var
		a:alumno;
	begin
		reset(mae);
		assign (txt,'reporteFinales.txt');
		rewrite(txt);
		while (not eof(mae)) do begin
			read(mae,a);
			if (a.finales > a.cursadas) then
				escribirReporte(txt,a);
		end;
		close(mae);
		close(txt);
	end;
	
var
	
	det : Text;
	txt: Text;
	repo : Text;
	mae : archivoAlumnos;
begin
	assign (txt , 'alumnos.txt');
	assign (det, 'detalle.txt');
	assign (mae, 'alumnos');
	rewrite(mae);
	transformarDatos (txt,mae);
	mostrarRegistrosAlumnos(mae);
	actualizarMaestro (mae,det);
	mostrarRegistrosAlumnos(mae);
	reporteFinales(repo,mae)
end.
