{
Una empresa desea procesa la info de las hs trabajadas por sus
empleados durante 2021. Para ello, la empresa posee registros
de las horas trabajadas por cada por cada empleado. Cada registro
consta del numero de empleado, dia, mes y cantidad de horas trabajadas
(a lo sumo 8) para dicho dia y mes.

a) Realizar un modulo que lea la informacion de los empleados y retorne una estrura de datos
con todos los registros leidos., La estructura debe ser eficiente para la busqueda por numero de empleado.
La lectura finaliza cuando se ingresa un registro con dia 0. Se sugiiere utilizar el modulo leerRegistro()

c) Realizar un modulo recursivo que reciba la estructura generada en b) y retorne la cantidad total de horas trabajadas.
}

program rep1;

type

	horas = record
		num:integer;
		dia:integer;
		mes:integer;
		cant:integer;
	end;

	lista = ^nodoH;
	nodoH = record
		data:horas;
		sig:lista;
	end;

	registros = record
		num:integer;
		listaRegistros:lista;
	end;

	arbol = ^nodoR;
	nodoR = record
		data:registros;
		hi:arbol;
		hd:arbol;
	end;

	arbolEntreValores = ^nodoE;
	nodoE = record
		data:registros;
		hi:arbolEntreValores;
		hd:arbolEntreValores;
	end;

	procedure cargarRegistros (var a:arbol);
		procedure agregarRegistro (var l:lista; h:horas);
		var
			ant,act,nue:lista;
		begin
			new(nue);
			nue^.data:= h;
			nue^.sig:= nil;
			if (l = nil) then
				l:= nue
			else begin
				ant:= l; act:= l;
			while (act <> nil) and (act^.data.num < nue^.data.num) do begin
				ant:= act;
				act:= act^.sig;
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

		procedure agregarEmpleado (var a:arbol; h:horas);
		begin
			if (a = nil) then begin
				new(a);
				a^.data.num := h.num;
				a^.data.listaRegistros := nil;
				agregarRegistro(a^.data.listaRegistros, h);
				a^.hi := nil ; a^.hd := nil;
			end
			else if (a^.data.num = h.num) then
				agregarRegistro(a^.data.listaRegistros,h)
			else if (a^.data.num > h.num) then
				agregarEmpleado(a^.hi, h)
			else
				agregarEmpleado(a^.hd,h);
		end;

		procedure leerRegistros (var h:horas);
		begin
			write('Ingrese el numero de empleado: ');readln(h.num);
			write('Ingrese la cantidad de horas trabajadas: ');readln(h.cant);
			write('Ingrese el dia: ');readln(h.dia);
			write('Ingrese el mes: ');readln(h.mes);
		end;
	var
		h:horas;
	begin
		leerRegistros(h);
		if (h.dia <> 0 ) then begin
			agregarEmpleado(a,h);
			cargarRegistros(a);
		end;
	end;
{
b) Realizar un modulo que reciba la estructura generada en a) y dos numeros de empleados x e y, retorne
todos los registros de horas trabajadas por empleados cuyos numeros esten entre x e y incluidos.
}	procedure devolverEntreValores (a:arbol; var aev:arbolEntreValores);

		procedure agregarRegistroEntre (var aev:arbolEntreValores; a:arbol);
		begin
			if (aev = nil) then begin
				new(aev);
				aev^.data.num := a^.data.num;
				aev^.data.listaRegistros := nil;
				aev^.data.listaRegistros := a^.data.listaRegistros;
				aev^.hi := nil; aev^.hd:= nil;
			end
			else if (aev^.data.num > a^.data.num) then
				agregarRegistroEntre(aev^.hi, a)
			else
				agregarRegistroEntre(aev^.hd, a);
		end;

		procedure recorrerArbol (a:arbol; var aev:arbolEntreValores; cod1,cod2:integer);
		begin
			if (a <> nil) then begin
				if (a^.data.num >= cod1) then begin
					if (a^.data.num <= cod2) then begin
						recorrerArbol(a^.hi,aev,cod1,cod2);
						recorrerArbol(a^.hd,aev,cod1,cod2);
						agregarRegistroEntre(aev, a);
					end
					else
						recorrerArbol (a^.hi, aev,cod1,cod2)
				end
				else
					recorrerArbol(a^.hd,aev,cod1,cod2);
			end;`
		end;
	var
		cod1,cod2:integer;
	begin
		write('Ingrese un codigo base: ');readln(cod1);
		write('Ingrese un codigo tope: ');readln(cod2);
		if (a <> nil) then
			recorrerArbol(a,aev,cod1,cod2)
		else
			writeln('Arbol vacio.');
	end;

{
c) Realizar un modulo recursivo que reciba la estructura generada en b) y retorne la cantidad total de horas trabajadas.
}	procedure totalEntreValores (aev:ArbolEntreValores);
		function devolverTotal (l:lista):integer;
		begin
			if (l<> nil) then
				devolverTotal := devolverTotal(l^.sig) + l^.data.cant
			else
				devolverTotal := 0
		end;

		function buscarTotales (aev:arbolEntreValores):integer;
		begin
			if (aev <> nil ) then 
				buscarTotales := buscarTotales(aev^.hi) + buscarTotales(aev^.hd) + devolverTotal(aev^.data.listaRegistros)
			else
				buscarTotales:= 0;
		end;
	var
		total:integer;
	begin
		total:= 0;
		if (aev <> nil) then begin
			total := buscarTotales(aev);
			write('El total de horas trabajadas por los empleados de la estructura dos es: ',total);
		end
		else
			writeln('Estructura vacia.');
	end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure mostrarArbol (a:arbol);
	procedure mostrarLista (l:lista);
	begin
		if (l<>nil) then begin
			writeln('Numero de empleado: ', l^.data.num, ' | ', 'Horas Trabajadas: ', l^.data.cant, ' | ', 'Dia : ', l^.data.dia, ' | ', 'Mes: ', l^.data.mes);
			mostrarLista(l^.sig);
		end;
	end;

begin
	if (a<> nil) then begin
		mostrarArbol(a^.hi);
		writeln('Numero de empleado: ', a^.data.num);
		mostrarLista(a^.data.listaRegistros);
		writeln();
		mostrarArbol(a^.hd);
	end;
end;

procedure mostrarArbol2 (aev:arbolEntreValores);
	procedure mostrarLista (l:lista);
	begin
		if (l<>nil) then begin
			writeln('Numero de empleado: ', l^.data.num, ' | ', 'Horas Trabajadas: ', l^.data.cant, ' | ', 'Dia : ', l^.data.dia, ' | ', 'Mes: ', l^.data.mes);
			mostrarLista(l^.sig);
		end;
	end;

begin
	if (aev <> nil) then begin
		mostrarArbol2(aev^.hi);
		writeln('Numero de empleado: ', aev^.data.num);
		mostrarLista(aev^.data.listaRegistros);
		writeln();
		mostrarArbol2(aev^.hd);
	end;
end;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var
	a:arbol;
	aev:arbolEntreValores;
begin
	a:= nil; aev:= nil;
	cargarRegistros(a);
	mostrarArbol(a);
	devolverEntreValores (a,aev);
	mostrarArbol2(aev);
	totalEntreValores(aev);
end.
