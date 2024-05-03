program ej5;

const

	valorAlto = 9999;
	dimf = 3;
	
type
	rango = 1..dimf;
	str = string[50];
	
	regMaestro = record
		codigo : integer;
		nombre : str;
		descripcion : str;
		stockDisponible : integer;
		stockMinimo : integer;
		precio:real;
	end;
	
	regDetalle = record
		codigo : integer;
		cantVendida : integer;
	end;
	
	maestro = file of regMaestro;
	
	vectorDetalles = array [rango] of Text;
	vectorRegistrosDetalle = array [rango] of regDetalle;
	
		
	procedure leer (var txt:Text; var rd:regDetalle);
	
		procedure leerTxtDetalle (var txt:Text; var rd:regDetalle);
		begin
			readln(txt,rd.codigo);
			readln(txt,rd.cantVendida);
		end;
	
	begin
		if (not eof (txt)) then leerTxtDetalle(txt,rd)
		else rd.codigo := valorAlto;
	end;
	
	procedure establecerDetalles (var vd : vectorDetalles);
	var
		det1,det2,det3:Text;
	begin
		assign (det1, 'detalle1.txt');
		assign (det2, 'detalle2.txt');
		assign(det3,'detalle3.txt');
		vd[1] := det1;
		vd[2] := det2 ;
		vd[3] := det3 ;
	end;
	
	procedure transformarTxtMaestro (var txt:Text; var mae:maestro);
	
		procedure leerTxtMaestro (var txt:Text; var rm : regMaestro);
		begin
			readln(txt,rm.codigo, rm.nombre);
			readln(txt, rm.descripcion);
			readln(txt, rm.stockDisponible, rm.stockMinimo);
			readln(txt, rm.precio);
		end;
		
	var
		rm:regMaestro;
	begin
		reset (txt);
		assign (mae,'maestro');
		rewrite(mae);
		while (not eof(txt)) do begin
			leerTxtMaestro(txt,rm);
			write(mae,rm);
		end;
		close(txt);
		close(mae);
	end;
	
	procedure mostrarMaestro (var mae:maestro);
		
		procedure mostrarRM (rm:regMaestro);
		begin
			writeln('----------------------------------------------------------------');
			writeln('Codigo de producto: ', rm.codigo);
			writeln('Nombre: ', rm.nombre);
			writeln('Descripcion: ', rm.descripcion);
			writeln('Stock disponible: ', rm.stockDisponible);
			writeln('Stock minimo: ', rm.stockMinimo);
			writeln('Precio: ', rm.precio:4:2);
			writeln('----------------------------------------------------------------');
		end;
	
	var
		rm:regMaestro;
	begin
		reset(mae);
		while (not eof(mae)) do begin
			read(mae,rm);
			mostrarRM (rm);
		end;
		close(mae);
	end;
	
	procedure actualizarMaestro (var vd : vectorDetalles; var mae:maestro; var sm:Text);
	
		procedure minimo (var vd:vectorDetalles; var min : regDetalle );
		var
			i : integer ;
			act:regDetalle;
		begin
			for i:= 1 to dimf do begin
				leer (vd[i],act);
				if (act.codigo < min.codigo) then
					min := act;
			end;
		end;
		
		procedure generarStockMenos (var sm:Text; var rm:regMaestro);
		begin
			writeln('Codigo de producto: ', rm.codigo);
			writeln('Nombre : ', rm.nombre);
			writeln('Descripcion: ', rm.descripcion);
			writeln('Stock Disponible: ', rm.stockDisponible);
			writeln('Stock Minimo: ', rm.stockMinimo);
			writeln('Precio: ', rm.precio);
		end;
	
	var
		rm : regMaestro;
		min:regDetalle;
		act,i,totalVendido : integer;
	begin
		for i := 1 to dimf do begin
			reset(vd[i]);
		end;
		reset (mae);
		read(mae,rm);
		minimo (vd, min);
		assign (sm, 'stockMinimo.txt');
		rewrite(sm);
		while (min.codigo <> valorAlto) do begin
			act := min.codigo;
			totalVendido := 0;
			while (act = min.codigo) do begin
				totalVendido := totalVendido + min.cantVendida;
				minimo(vd,min);
			end;
			rm.stockDisponible := rm.stockDisponible - totalVendido;
			if (rm.stockDisponible < rm.stockMinimo) then
				generarStockMenos(sm,rm);
			seek (mae,filepos(mae)-1);
			write(mae,rm);
			if (not eof (mae)) then
				read(mae,rm);
		end;
		for i := 1 to dimf do
			close(vd[i]);
		close(mae);
		close(sm);
	end;
	
	
var
	txt :Text;
	mae : maestro;
	vd : vectorDetalles;
	stockMinimo: Text;
begin
	assign (txt, 'maestro.txt');
	transformarTxtMaestro(txt,mae);
	mostrarMaestro(mae);
	establecerDetalles(vd);
	actualizarMaestro (vd,mae,stockMinimo);
	mostrarMaestro(mae);
end.
