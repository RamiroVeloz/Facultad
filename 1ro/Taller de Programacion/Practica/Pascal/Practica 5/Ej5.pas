{

Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de
igual a -1. Se pide:


a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
* 5. Realizar el punto a) del ejercicio anterior, pero sabiendo que todos los reclamos de un
mismo DNI se leen de forma consecutiva (no significa que vengan ordenados los DNI).


b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.


c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.

d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.
}
program ej5;

type
	str = string[20];
	reclamo = record
		cod:integer;
		dni:integer;
		anio:integer;
		tipo:str;
	end;

	lista = ^nodoR;
	nodoR = record
		data:reclamo;
		sig:lista;
	end;

	persona = record
		dni:integer;
		listaReclamos:lista;
		cant:integer;
	end;

	arbol = ^nodoP;
	nodoP = record
		data:persona;
		hi:arbol;
		hd:arbol;
	end;

	procedure cargarReclamosPorDNI (var a:arbol);
		procedure agregarReclamo ( var l:lista; r:reclamo );
		var
			ant,act,nue:lista;
		begin
			new(nue);
			nue^.data:= r;
			nue^.sig:=nil;
			if (l = nil) then
				l:= nue
			else begin
				ant:= l; act:= l;
				while (act <> nil) and (act^.data.cod < nue^.data.cod) do begin
					ant := act;
					act := act^.sig;
				end;
				if (ant = act) then begin
					nue^.sig:= l;
					l:= nue;
				end
				else begin
					ant^.sig:= nue;
					nue^.sig:= act;
				end;
			end;
		end;

		procedure agregarPersona (var a:arbol; p:persona);
		begin
			if (a = nil) then begin
				new(a);
				a^.data.dni := p.dni;
				a^.data.listaReclamos := nil;
				a^.data.listaReclamos := p.listaReclamos;
				a^.data.cant := p.cant;
				a^.hi :=nil; a^.hd:= nil;
			end
			else if (a^.data.dni  >= p.dni) then
				agregarPersona(a^.hi,p)
			else
				agregarPersona(a^.hd,p);
		end;

		procedure leerReclamo (var r:reclamo);
		begin
			write('Ingrese el  codigo: ');readln(r.cod);
			write('Ingrese el dni: ');readln(r.dni);
			if (r.cod <> -1 ) then begin
				write('Ingrese el anio: ');readln(r.anio);
				r.tipo:= 'a';
				writeln();
			end;
		end;

	var
		p:persona; r:reclamo;
	begin
		leerReclamo(r);
			while (r.cod <> -1 ) do begin
				p.dni := r.dni;
				p.listaReclamos := nil;
				p.cant:= 0;
				while (r.cod <> -1) and (p.dni = r.dni) do begin
					agregarReclamo(p.listaReclamos, r);
					p.cant:= p.cant +1;
					leerReclamo(r);
				end;
				agregarPersona(a,p);
			end;
	end;

	procedure mostrarArbol (a:arbol);
		procedure mostrarListaReclamos (l:lista);
		begin
			if (l <> nil)  then begin
				writeln('Codigo: ', l^.data.cod, '| ', 'Anio: ', l^.data.anio, ' | ', 'Tipo de reclamo: ', l^.data.tipo);
				writeln();
				mostrarListaReclamos(l^.sig);
			end;
		end;
	begin
		if (a <> nil) then begin
			mostrarArbol (a^.hi);
			writeln('DNI: ', a^.data.dni, ' | ', 'Cantidad de reclamos: ',a^.data.cant);
			writeln('Lista de los reclamos realizados: ');
			mostrarListaReclamos(a^.data.listaReclamos);
			writeln();
			mostrarArbol(a^.hd);
		end;
	end;

var
	a:arbol;
begin
	a:=nil;
	cargarReclamosPorDNI(a);
	mostrarArbol(a);
end.
