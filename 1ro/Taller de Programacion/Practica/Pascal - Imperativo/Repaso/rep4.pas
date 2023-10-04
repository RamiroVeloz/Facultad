{
3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:

a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.

b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.

c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.

d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
}
program rep4;

const
	rubros = 10;

type
	rango = 1..rubros;
	
	prod = record
		cod:integer;
		rubro:rango;
		stock:integer;
		precioU:integer;
	end;

	arbol = ^nodo;
	nodo = record
		data:prod;
		hi:arbol;
		hd:arbol;
	end;

	vector=  array [rango] of arbol;
	
	prodMax = record
		cod:integer;
		stock:integer;
	end;
	vectorMaximos = array [rubro] of prod

	contador = array[rubro] of integer;

	procedure inicializarVector (var v:vector);
	var
		i:rubro;
	begin
		for i:= 1 to rubros do
			v[i] := nil;
	end;

	procedure cargarProductosPorRubro (var v:vector);
		procedure leerProducto (var p:prod);
		begin
			write('Ingrese el codigo: ');readln(p.cod);
			if ()p.cod <> -1) then begin
				write('Ingrese el rubro: ');readln(p.rubro);
				write('Ingrese el stock: ');readln(p.stock);
				write('Ingrese el precio unitario: ');readln(p.precioU);
				writeln();
			end;
		end;

		procedure cargarProductos(var a:arbol; p:prod);
		begin
			if (a = nil) then begin
				new(a);
				a^.data := p;
				a^.hi := nil ; a^.hd := nil;
			end;
			else if (a^.data.cod >= p.cod) then
				cargarProductos(a^.hi,p)
			else
				cargarProductos(a^.hd,p);
		end;
	var
		p:prod;
	begin
		leerProducto(p);
		if (p.cod <> -1) then begin
			cargarProductos(v[p.rubro], p);
			cargarProductosPorRubro(v);
		end;
	end;

	procedure existeCodigoEnRubro (v:vector);
		function devolverTF (a:arbol; cod:integer):boolean;
		begin
			if (a <> nil) then begin
				if (a^.data.cod = cod) then
					devolverTF := true
				else if (a^.data.cod > cod) then
					devolverTF:= devolverTF(a^.hi,cod)
				else
					devolverTF := devolverTF(a^.hd,cod);
			end
			else
				devolverTF:= false;
		end;
	var
		cod:integer;
		rubro:rango;
		aux:boolean;
	begin
		write('Ingrese el rubro en el que desea buscar el codigo: ');readln(rubro);
		if (rubro >= 1) and (rubro <= 10) then begin
			write('Ingrese un codigo para buscar en el rubro: ');readln(cod);
			aux := devolverTF (v[rubro],cod);
			if (aux = true) then
				writeln('El codigo existe dentro del rubro')
			else
				writeln('El codigo no existe en dicho rubro.')
		end
		else
			writeln('Rubro inexistente');
	end;

	procedure retornarMaximos (v:vector; var vm:vectorMax);
		function devolverMax (a:arbol):arbol;
		begin
			if (a^.hd <> nil) then begin
				devolverMax := devolverMax(a^.hd);
				devolverMax := a;
			end
			else
				devolverMax := nil;
		end;
	var
		i:rango;
		aux:arbol;
	begin
		aux:= nil
		for i:= 1 to rubros do begin
			if (v[i] <> nil) then begin
				aux := devolverMax (a);
				if (aux <> nil) then begin
					vm[i].cod:= aux^.data.cod;
					vm[i].stock := aux^.data.stock;
				end
				else begin
					vm[i].cod:= 0;
					vm[i].stock := 0;
				end
			end;
		end;		
	end;

	procedure contarEntreValoresPorRubro (v:vector; var c:contador);
		function contarEntre (a:arbol;cod1,cod2:integer):integer;
		begin 
			if (a <> nil) then begin
				if (a^.data.cod >= cod1) then begin
					if(a^.data.cod <= cod2) then
						contarEntre := contarEntre(a^.hi,cod1,cod2) + contarEntre(a^.hd,cod1,cod2) + 1
					else
						contarEntre:= contarEntre(a^.hd,cod1,cod2);
				end
				else
					contarEntre:= contarEntre(a^.hd,cod1,cod2);
			end
			else
				contarEntre:= 0;
		end;
	var
		cod1,cod2:integer;
		i:rubro;
	begin
		write('Ingrese un codigo base: ');readln(cod1);
		write('Ingrese un codigo tope: ');readln(cod2);
		for i:= 1 to rubros do begin
			if (v[i] <> nil) then
				c[i] := contarEntre(v[i],cod1,cod2);
		end;
			
	end;

var
	v:vector;
begin
	inicializarVector(v);
	cargarProductosPorRubro(v);
end.



