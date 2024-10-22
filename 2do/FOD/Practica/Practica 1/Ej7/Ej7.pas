program ej7;

type
	
	str = string [50];

	novela = record
		cod : integer;
		precio : real;
		genero : str;
		nombre : str;
	end;
	
	archivoNovelas = file of novela;
	
	procedure leerDatos (var n:novela);
	begin
		write('Ingrese el codigo del libro o -1 para salir: '); readln(n.cod);
		if (n.cod <> -1) then begin
			write('Ingrese el precio: '); readln(n.precio);
			write('Ingrese el genero: '); readln(n.genero);
			write('Ingrese el nombre: '); readln(n.nombre);
		end;
	end;
	
	procedure mostrarDatos (n:novela);
	begin
		writeln('-------------------------------------');
		writeln('Codigo: ',n.cod);
		writeln('Precio: ',n.precio:4:2);
		writeln('Genero: ',n.genero);
		writeln('Nombre: ',n.nombre);
		writeln('-------------------------------------');
	end;
	
	procedure leerTxt (var txtNovelas:Text; var n:novela);
	begin
		readln(txtNovelas, n.cod, n.precio, n.genero);
		readln(txtNovelas, n.nombre);
	end;
	
	procedure cargarDesdeTxt (var txtNovelas:Text; var an : archivoNovelas);
	var
		n:novela;
	begin
		reset(txtNovelas);
		while (not eof(txtNovelas)) do begin
			leerTxt(txtNovelas,n);
			write(an,n)
		end;
		close(an);
		close(txtNovelas);
	end;
	
	procedure mostrarRegistros (var an:archivoNovelas);
	var
		n:novela;
	begin
		reset(an);
		while (not eof(an)) do begin
			read(an,n);
			mostrarDatos(n);
		end;
		close(an);
	end;
	
	procedure modificarPrecio (var n:novela);
	var
		act:real;
	begin
		write('Ingrese un nuevo precio: '); readln(act);
		n.precio:= act;
	end;
	
	procedure modificarGenero (var n:novela);
	var
		ng : str;
	begin
		write('Ingrese un nuevo genero: '); readln(ng);
		n.genero := ng;
	end;
	
	procedure modificarNombre (var n:novela);
	var
		nn:str;
	begin
		write('Ingrese un nuevo nombre: ');readln(nn);
		n.nombre := nn;
	end;

	procedure modificarLibroExistente (var an:archivoNovelas);
	var
		n:novela;
		op : byte;
		cb:integer;
		flag:boolean;
	begin
		flag := false;
		reset(an);
		write('1 para modificar su precio, 2 para modificar su genero, 3 para modificar su nombre, 4 para terminar: '); readln(op);
		write('Ingrese el codigo de novela que desea buscar: '); readln(cb);
		while (op <> 4) do begin
			while (op <> 4) and (not eof(an)) do begin
				read(an,n);
				if (n.cod = cb) then begin
					mostrarDatos(n);
					case op of
						1 : modificarPrecio(n);
						2 : modificarGenero(n);
						3: modificarNombre(n);
					end;
					seek (an, filepos(an)-1);
					write(an,n);
					flag := true;
				end;
			end;
			if (flag) then begin
				write('El libro se modifico exitosamente');
				mostrarRegistros(an);
			end
			else
				write('No se encontro el libro que buscaba');
			flag := false;
			reset(an);
			write('1 para modificar su precio, 2 para modificar su genero, 3 para modificar su nombre, 4 para terminar: '); readln(op);
			write('Ingrese el codigo de novela que desea buscar: '); readln(cb);
		end;
		close(an);
	end;
	
	procedure agregarLibro (var an:archivoNovelas);
	var
		n:novela;
	begin
		leerDatos(n);
		while (n.cod <> -1) do begin
			reset(an);
			seek(an, filesize(an));
			write(an, n);
			leerDatos(n);
		end;
		close(an);
	end;
	
	procedure menu (var an:archivoNovelas);
	var
		op:integer;
	begin
		write ('1 para agregar un libro, 2 para modificar un libro existente, 3 para listar, 4 para salir: '); readln(op);
		while (op <> 4) do begin
			case op of
				1 : agregarLibro(an);
				2: modificarLibroExistente(an);
				3: mostrarRegistros(an);
			end;
			write ('1 para agregar un libro, 2 para modificar un libro existente, 3 para listar, 4 para salir: '); readln(op);
		end;
	end;

var
	txtNovelas : Text;
	an : archivoNovelas;
	na : str;
	
begin
	write('Ingrese el nombre del archivo: '); readln(na);
	assign(an, na);
	assign(txtNovelas, 'novelas.txt');
	rewrite(an);
	cargarDesdeTxt(txtNovelas,an);
	mostrarRegistros(an);
	menu(an);
end.
