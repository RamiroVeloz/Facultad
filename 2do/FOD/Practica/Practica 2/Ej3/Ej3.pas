program ej3;

const
	
	valorAlto = 9999;
	
type

	str = string[30];

	producto = record
		codigo : integer;
		nombre : str;
		precio: real;
		stockActual : integer;
		stockMinimo : integer;
	end;
	
	archivo = file of producto;

	venta = record
		codigo:integer;
		cantVendida: integer;
	end;

	procedure leerDetalle (var det:Text; var v:venta);
	begin
		readln (det, v.codigo, v.cantVendida);
	end;
	
	procedure procesarDetalle (var det:Text; var v:venta);
	begin
		if (not eof(det)) then 
			leerDetalle(det,v)
		else
			v.codigo := valorAlto;
	end;

	procedure mostrarProducto (p:producto);
	begin
		writeln('----------------------------------------');
		writeln('Codigo: ',p.codigo);
		writeln('Nombre: ',p.nombre);
		writeln('Precio: ',p.precio:4:2);
		writeln('Stock Actual: ',p.stockActual);
		writeln('Stock Minimo: ',p.stockMinimo);
		writeln('----------------------------------------');
	end;

	procedure leerTxt (var txt:Text ; var p:producto);
	begin
		readln (txt, p.codigo, p.nombre);
		readln(txt, p.precio);
		readln(txt, p.stockActual, p.stockMinimo);
	end;

	procedure procesarTxt (var txt: Text; var p : producto);
	begin
		if (not eof (txt)) then
			leerTxt(txt,p)
		else
			p.codigo := valorAlto;
	end;

	procedure transformarDatos (var mae : archivo; var txt: Text);
	var
		p:producto;
	begin
		assign (mae, 'productos');
		rewrite(mae);
		reset(txt);
		procesarTxt(txt,p);
		while (p.codigo <> valorAlto) do begin
			write(mae,p);
			procesarTxt(txt,p);
		end;
		close(txt);
		close(mae);
	end;
	
	procedure leerMaestro (var mae:archivo; var p:producto);
	begin
		if (not eof(mae)) then
			read(mae,p)
		else
			p.codigo := valorAlto;
	end;
	
	procedure mostrarDatosMaestros (var mae:archivo);
	var
		p:producto;
	begin
		reset(mae);
		while (not eof (mae)) do begin
			read(mae,p);
			mostrarProducto(p);
		end;
		close(mae);
	end;

	procedure actualizarMaestro (var mae:archivo; var det:Text);
	var
		v:venta; p:producto;
	begin
		reset(mae);
		reset(det);
		leerMaestro(mae,p);
		while (p.codigo <> valorAlto) do begin
			procesarDetalle(det,v);
			while (v.codigo = p.codigo) do begin
				p.stockActual := p.stockActual - v.cantVendida;
				procesarDetalle(det,v);
			end;
			seek(mae, filepos(mae)-1);
			write(mae,p);
			leerMaestro(mae,p);
		end;
		close(det);
		close(mae);
	end;

var
	mae:archivo;
	det,txt: Text;
begin
	assign(det, 'detalle.txt');
	assign (txt, 'productos.txt');
	transformarDatos (mae,txt);
	mostrarDatosMaestros(mae);
	actualizarMaestro(mae,det);
	mostrarDatosMaestros(mae);
end.
