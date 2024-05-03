program ej4;

const
	
	valorAlto = 'zzz';
	
type

	str = string [20];

	provincia = record
		nombre : str;
		cantAlfa : integer;
		totalEnc : integer;
	end;

	censo = record
		nombre: str;
		codLocalidad : integer;
		cantAlfa : integer;
		cantEnc : integer;
	end;
		
	maestro = file of provincia;
	detalle = file of censo;
	
	procedure leerTxtDetalle (var txt : Text ; var c : censo);
	begin
		readln (txt, c.nombre, c.codLocalidad);
		readln (txt, c.cantAlfa, c.cantEnc);
	end;
	
	procedure leer (var txt:Text; var c:censo);
	begin
		if (not eof (txt)) then leerTxtDetalle(txt,c)
		else c.nombre := valorAlto;
	end;
	
	procedure leerTxtMaestro (var txt: Text; var p:provincia);
	begin
		readln (txt, p.nombre);
		readln (txt, p.cantAlfa);
		readln (txt,p.totalEnc);
	end;	
	
	procedure transformarMaestro (var txt:Text; var mae:maestro);
	var
		p:provincia;
	begin
		reset(txt);
		assign (mae, 'maestro');
		rewrite(mae);
		while (not eof(txt)) do begin
			leerTxtMaestro(txt,p);
			write(mae,p);
		end;
		close(txt);
		close(mae);
	end;
	

	
	procedure mostrarDetalle (var det:Text);

		procedure mostrarCenso (c:censo);
		begin
			writeln('-----------------------------------------------------');
			writeln ('Nombre: ', c.nombre);
			writeln ('Codigo de localidad: ', c.codLocalidad);
			writeln ('Cantidad de alfabetizados: ', c.cantAlfa);
			writeln ('Total de encuestados: ', c.cantEnc);
			writeln('-----------------------------------------------------');
		end;
	
	var
		c:censo;
	begin
		reset(det);
		while (not eof(det)) do begin
			leerTxtDetalle(det,c);
			mostrarCenso(c);
		end;
		close(det);
	end;
	
	procedure mostrarMaestro (var mae:maestro);
	
		procedure mostrarProvincia (p:provincia);
		begin
			writeln('-----------------------------------------------------');
			writeln ('Nombre: ', p.nombre);
			writeln ('Cantidad de alfabetizados: ', p.cantAlfa);
			writeln ('Total de encuestados: ', p.totalEnc);
			writeln('-----------------------------------------------------');
		end;
	
	var
		p:provincia;
	begin
		reset(mae);
		while (not eof (mae)) do  begin
			read(mae,p);
			mostrarProvincia(p);
		end;
		close(mae);
	end;
	
	procedure actualizarMaestro (var mae:maestro; var det1,det2:Text);
	
		procedure minimo (var rd1,rd2,min:censo);
		begin
			if (rd1.codLocalidad <= rd2.codLocalidad) then begin
				min := rd1;
				leer(det1,rd1);
			end
			else begin
				min := rd2;
				leer(det2,rd2);
			end;
		end;
		
	var
		c1,c2,min:censo;
		totalAlfa, totalE : integer;
		p:provincia;
		act : str;
	begin
		reset(mae);
		reset (det1);
		reset (det2);
		read (mae,p);
		leer(det1,c1);
		leer (det2,c2);
		minimo (c1,c2,min);
		while (min.nombre <> valorAlto) do begin
			act := min.nombre;
			totalAlfa := 0;
			totalE := 0;
			while (act = min.nombre) do begin
				totalAlfa:= totalAlfa + min.cantAlfa;
				totalE := totalE + min.cantEnc;
				minimo (c1,c2,min);
			end;
			p.cantAlfa := p.cantAlfa + totalAlfa ;
			p.totalEnc := p.totalEnc + totalE;
			seek (mae, filepos(mae)-1);
			write(mae,p);
			if (not eof(mae)) then
				read(mae,p);
		end;
		close(mae);
		close(det1); close(det2);
	end;
	
	//Hacelo con el minimo de la teoria para sacarlo por codigo, las lecturas son iguales a los anteriores ejercicios	
	
var
	maeTxt:Text;
	mae : maestro;
	det1,det2 : Text;
begin
	assign (maeTxt, 'maestro.txt');
	assign (det1, 'detalle1.txt');
	assign(det2, 'detalle2.txt');
	transformarMaestro(maeTxt,mae);
	mostrarMaestro (mae);
	actualizarMaestro(mae,det1,det2);
	mostrarMaestro(mae);
end.
