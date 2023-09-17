{
4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de
igual a -1. Se pide:




}
program ej4;

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
		cantidadReclamos:integer;
	end;

	arbol = ^nodoP;
	nodoP = record
		data:persona;
		hi:arbol;
		hd:arbol;
	end;

	codigoReclamo = record
		cod:integer;
	end;

	listaCodigos = ^nodoC;
	nodoC = record
		data:codigoReclamo;
		sig:listaCodigos;
	end;

{
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
}

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

		procedure agregarPersona (var a:arbol; r:reclamo);
		begin
			if (a = nil) then begin
				new(a);
				a^.data.dni := r.dni;
				a^.data.listaReclamos := nil;
				agregarReclamo(a^.data.listaReclamos, r);
				a^.data.cantidadReclamos := 1;
				a^.hi :=nil; a^.hd:= nil;
			end
			else if (a^.data.dni = r.dni) then begin
				agregarReclamo(a^.data.listaReclamos,r);
				a^.data.cantidadReclamos := a^.data.cantidadReclamos + 1;
			end
			else if (a^.data.dni > r.dni) then
				agregarPersona(a^.hi,r)
			else
				agregarPersona(a^.hd,r);
		end;

		procedure leerReclamo (var r:reclamo);
		begin
			write('Ingrese el  codigo: ');readln(r.cod);
			write('Ingrese el dni: ');readln(r.dni);
			if (r.dni <> -1 ) then begin
				write('Ingrese el anio: ');readln(r.anio);
				r.tipo:= 'a';
				writeln();
			end;
		end;
	var
		r:reclamo;
	begin
		leerReclamo(r);
		if (r.dni <> -1) then begin
			agregarPersona(a,r);
			cargarReclamosPorDNI	(a);
		end;
	end;

{
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
}	procedure retornarCant (a:arbol);
		function recorrer (a:arbol; dni:integer):integer;
		begin
		if (a<> nil) then begin
			if (a^.data.dni = dni) then
				recorrer :=  a^.data.cantidadReclamos
			else if (a^.data.dni > dni) then
				recorrer := recorrer(a^.hi,dni)
			else
				recorrer:= recorrer(a^.hd,dni);
		end
		else
			recorrer:= 0;
		end;
	var
		dni:integer;
		cant:integer;
	begin
		write('Ingrese un dni para obtener su cantidad de reclamos: ');readln(dni);
		if (a = nil) then
			writeln('El arbol esta vacio')
		else begin
			cant:= recorrer(a,dni);
			writeln('La cantidad de reclamos realizados por ese dni es: ',cant);
		end;
	end;

{
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
}	procedure retornarCantEntre (a:arbol);
		function retornar2 (a:arbol; dni1,dni2:integer):integer;
		begin
			if (a <> nil) then begin
				if (a^.data.dni >= dni1) then begin
					if (a^.data.dni <= dni2) then
						retornar2 := retornar2(a^.hi,dni1,dni2) + retornar2(a^.hd,dni1,dni2) + a^.data.cantidadReclamos
					else
						retornar2:= retornar2(a^.hi,dni1,dni2);
				end
				else
					retornar2 := retornar2(a^.hd,dni1,dni2);
			end
			else
				retornar2 := 0;
		end;
	var
		cant:integer;
		dni1,dni2:integer;
	begin
		write('Ingrese un dni base: ');readln(dni1);
		write('Ingrese un dni tope: ');readln(dni2);
		if ( a = nil ) then
			writeln('Arbol vacio.')
		else begin
			cant:= retornar2(a,dni1,dni2);
			writeln('La cantidad de reclamos comprendidos entre los dni ingresados es: ', cant);
		end;
	end;

{
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.
}	procedure retornarCodigos (a:arbol; var lc:listaCodigos);

		procedure agregarReclamoFiltrado (var lc:listaCodigos; cr:codigoReclamo);
		var
			ant,act,nue:listaCodigos;
		begin
			new(nue);
			nue^.data:= cr;
			nue^.sig:=nil;
			if (lc= nil) then
				lc:= nue
			else begin
				ant:= lc; act:= lc;
				while (act <> nil) and (act^.data.cod < nue^.data.cod) do begin
					ant := act;
					act := act^.sig;
				end;
				if (ant = act) then begin
					nue^.sig:= lc;
					lc:= nue;
				end
				else begin
					ant^.sig:= nue;
					nue^.sig:= act;
				end;
			end;
		end;

		procedure filtrarReclamos (l:lista; var lc:listaCodigos; var cr:codigoReclamo; anio:integer);
		begin
			if (l<> nil ) then begin
				if (l^.data.anio = anio) then begin
					cr.cod := l^.data.cod;
					agregarReclamoFiltrado (lc, cr);
				end;
				filtrarReclamos(l^.sig,lc,cr,anio);
			end;
		end;

		procedure retornarLista (a:arbol; var lc:listaCodigos; anio:integer; var cr:codigoReclamo);
		begin
			if (a <> nil) then begin
				retornarLista (a^.hi, lc,anio,cr);
				filtrarReclamos(a^.data.listaReclamos, lc, cr,anio);
				retornarLista (a^.hd,lc,anio,cr);
			end;
		end;

	var
		anio:integer;
		cr:codigoReclamo;
	begin
		write('Ingrese el anio que desea filtrar: ');readln(anio);
		retornarLista(a,lc,anio,cr);
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
			writeln('DNI: ', a^.data.dni, ' | ', 'Cantidad de reclamos: ',a^.data.cantidadReclamos);
			writeln('Lista de los reclamos realizados: ');
			mostrarListaReclamos(a^.data.listaReclamos);
			writeln();
			mostrarArbol(a^.hd);
		end;
	end;

	procedure mostrarListaFiltrados (lc:listaCodigos);
	begin
		if (lc <> nil)  then begin
			writeln('Codigo: ', lc^.data.cod);
			mostrarListaFiltrados(lc^.sig);
		end;
	end;

var
	a:arbol;
	lc:listaCodigos;
begin
	a:= nil;
	lc:= nil;
	cargarReclamosPorDNI(a);
	mostrarArbol(a);
	retornarCant(a);
	retornarCantEntre(a);
	retornarCodigos(a,lc);
	mostrarListaFiltrados(lc);
end.
