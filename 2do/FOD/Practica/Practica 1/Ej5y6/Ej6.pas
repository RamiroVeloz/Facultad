program ej6;

type

	str = string [20];

	celular = record
		cod : integer;
		precio : real;
		marca : str;
		sd : integer;
		sm : integer;
		des : str;
		nom : str;
	end;
	
	archivoCelulares = file of celular;
	
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
		while (not eof(ac)) do begin
			read(ac,c);
			mostrarDatos(c);
		end;
		close(ac);
	end;
	
	procedure leerDatos (var c:celular);
	begin
		write('Ingrese el codigo del celular: ');readln(c.cod);
		if (c.cod <> -1) then begin
		write('Ingrese el precio: '); readln(c.precio);
		write('Ingrese la marca: '); readln(c. marca);
		write('Ingrese el stock disponible: '); readln(c.sd);
		write('Ingrese el stock minimo: '); readln(c.sm);
		write('Ingrese la descripcion: '); readln(c.des);
		write('Ingrese el nombre: '); readln(c.nom);
		end;
	end;
	
	procedure agregarRegistro (var ac:archivoCelulares);
	var
		c:celular;
	begin
		leerDatos(c);
		while (c.cod <> -1) do begin
			reset(ac);
			seek (ac, filepos(ac));
			write(ac,c);
			close(ac);
			leerDatos(c);
		end;
	end;
	
	procedure modificarStock (var ac:archivoCelulares);
	var
		c:celular;
		nab : str;
		esta : boolean;
		act :integer;
	begin
		esta := false;
		reset(ac);
		write('Ingrese el nombre de un celular para cambiarle el stock: '); readln(nab);
		while (not eof(ac)) and ( esta = false) do begin
			read(ac,c);
			if (c.nom = nab) then begin
				write('Este es el celular encontrado: ');
				mostrarDatos(c);
				write('Ingrese el stock nuevo: '); readln(act);
				c.sd := act;
				seek(ac,filepos(ac)-1);
				write(ac,c);
				esta := true;
			end;
		end;
		close(ac);
	end;
	
	procedure exportarSinStock (var ac: archivoCelulares);
	var
		c:celular;
		txt : Text;
	begin
		assign (txt, 'SinStock.txt');
		rewrite(txt);
		reset(ac);
		while (not eof(ac)) do begin
			read(ac,c);
			if (c.sd = 0) then begin
				writeln(txt,c.cod,' ',c.precio:4:2,' ', c.marca );
				writeln(txt, c.sd,' ', c.sm,' ', c.des);
				writeln(txt, c.nom);
			end;
		end;
		close(ac);
		close(txt);
	end;
	
	
	
var
	ac : archivoCelulares;

begin
	assign (ac, 'celulares.dat');
	reset(ac);
	mostrarRegistros(ac);
	agregarRegistro(ac);
	mostrarRegistros(ac);
	modificarStock(ac);
	mostrarRegistros(ac);
	exportarSinStock(ac);
end.
