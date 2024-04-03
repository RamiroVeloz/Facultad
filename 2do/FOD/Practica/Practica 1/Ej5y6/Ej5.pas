program ej5;

type
	
	str = string[20];
	
	celular = record
		cod : integer;
		precio : real;
		marca : str;
		sd : integer;
		sm : integer;
		des: str;
		nom:str;
	end;
	
	archivoCelulares = file of celular;

	procedure leerTexto (var at:Text; var c:celular);
	begin
		readln(at, c.cod, c.precio, c.marca);
		readln(at, c.sd, c.sm, c.des);
		readln( at, c.nom);
	end;
	
	procedure cargarRegistros (var at:Text; var ac:archivoCelulares);
	var
		c:celular;
	begin
		reset(at);
		while not eof(at) do begin
			leerTexto(at,c);
			write(ac,c)
		end;
		close(at);
		close(ac);
	end;
	
	procedure mostrarDatos (c:celular);
	begin
		writeln('------------------------------------');
		writeln('Codigo: ', c.cod);
		writeln('Precio: ',c.precio:4:2);
		writeln('Marca: ',c.marca);
		writeln('Stock disponible: ',c.sd);
		writeln('Stock minimo: ',c.sm);
		writeln('Descripcion: ',c.des);
		writeln('Nombre: ',c.nom);
		writeln('------------------------------------');
	end;
	
	procedure mostrarRegistros (var ac:archivoCelulares);
	var
		c:celular;
	begin
		reset(ac);
		while not eof(ac) do begin
			read(ac,c);
			mostrarDatos(c);
		end;
		close(ac);
	end;
	
	procedure mostrarStockMinimo (var ac:archivoCelulares);
	var
		c:celular;
	begin
		reset(ac);
		while not eof(ac) do begin
			read(ac,c);
			if (c.sd < c.sm) then
				mostrarDatos(c);
		end;
	end;


	procedure mostrarPorDescripcion (var ac:ArchivoCelulares);
	var
		c:celular;
		dab : str;
	begin
		reset(ac);
		write('Ingrese una descripcion para buscar en el archivo: ');readln(dab);
		while not eof(ac) do begin
			read(ac,c);
			if (c.des = dab) then
				mostrarDatos(c);
		end;
	end;

	procedure exportarArchivo (var ac:archivoCelulares);
	var
		c:celular;
		txt : Text;
	begin
		assign(txt, 'celulares.txt');
		rewrite(txt);
		reset(ac);
		while (not eof(ac)) do begin
			read(ac,c);
			writeln(txt, c.cod,' ', c.precio:4:2,' ', c.marca);
			writeln(txt, c.sd,' ', c.sm,' ', c.des);
			writeln(txt, c.nom);
		end;
		close(ac);
		close(txt);
	end;

var
	ac : archivoCelulares;
	at : Text;

begin

	assign(at,'celulares.txt');
	assign(ac,'celulares.dat');
	rewrite(ac);
	cargarRegistros(at,ac);
	mostrarRegistros(ac);
	mostrarStockMinimo(ac);
	exportarArchivo(ac);
end.
