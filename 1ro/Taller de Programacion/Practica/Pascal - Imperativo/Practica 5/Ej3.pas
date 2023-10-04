{
3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
 

}


program ej3;

{
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
}

const
	dimf = 10;

type
	rango = 1..dimf;
	
	prod = record
		cod:integer;
		rubro:rango;
		stock:integer;
		precioU:real;
	end;
	
	arbol = ^nodo;
	nodo = record
		data:prod;
		hi:arbol;
		hd:arbol;
	end;
	
	max = record
		cod:integer;
		stock:integer;
	end;
	
	vector = array [rango] of arbol;
	
	codMax = array [rango] of max;
	
	contador = array [rango] of integer;
	
	procedure inicializarRubros (var v:vector);
	var
		i:rango;
	begin
		for i:=1 to dimf do
			v[i]:= nil;
	end;
	
	procedure inicializarCodMax (var cm:codMax);
	var
		i:rango;
	begin
		for i:=1 to dimf do begin
			cm[i].cod:= 0;
			cm[i].stock := 0;
		end;
	end;
	
	 procedure cargarProductosPorRubro (var v:vector);
		procedure agregarProd (var a:arbol; p:prod);
		begin
			if (a = nil) then begin
				new(a);
				a^.data:= p;
				a^.hi := nil ; a^.hd:= nil;
			end
			else if (a^.data.cod >= p.cod) then
				agregarProd(a^.hi,p)
			else
				agregarProd(a^.hd,p);
		end;
		
		procedure leerProd (var p:prod);
		begin
			write('Ingrese el codigo del producto: '); readln(p.cod);
			if (p.cod <> -1) then begin
				write('Ingrese el rubro: ');readln(p.rubro);
				write('Ingrese el stock: '); readln(p.stock);
				write('Ingrese el precio unitario: ');readln(p.precioU);
				writeln();
			end;
		end;
	var
		p:prod;
	begin
		leerProd(p);
		if (p.cod <> -1) then begin
			agregarProd(v[p.rubro],p);
			cargarProductosPorRubro(v);
		end;
	end;
	
	procedure mostrarProductosPorRubro (v:vector);
		procedure mostrarProductos(a:arbol);
		begin
			if (a <> nil) then begin
				mostrarProductos(a^.hi);
				writeln('Codigo: ', a^.data.cod, ' | ' , 'Stock: ', a^.data.stock, ' | ', 'Precio unitario: ', a^.data.precioU:4:2);
				mostrarProductos(a^.hd);
			end;
		end;
	var
		i:rango;
	begin
		for i:=1 to dimf do begin
			if (v[i] <> nil) then begin
				writeln('Rubro: ', i);
				mostrarProductos(v[i]);
				writeln();
			end;
		end;
	end;
	
{
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
}

	procedure buscarCodigoEnRubro (v:vector);
		function encontrar (a:arbol; cod:integer):boolean;
		begin
			if (a <> nil) then begin
				if (a^.data.cod = cod) then
					encontrar := true
				else if  (a^.data.cod > cod) then
					encontrar := encontrar(a^.hi,cod)
				else
					encontrar := encontrar(a^.hd,cod);
			end
			else
				encontrar := false;
		end;
	var
		cod:integer;
		rubro:rango;
		seEncuentra:boolean;
	 begin
		write('Ingrese un rubro: '); readln(rubro);
		write('Ingrese un codigo de producto: ');readln(cod);
		if ( v[rubro] <> nil ) then begin
			seEncuentra := encontrar(v[rubro],cod);
			if (seEncuentra = true) then
				writeln('El producto se encuentra en el rubro')
			else
				writeln('El producto no se encuentra en el rubro');
		end
		else
			writeln('Arbol vacio.');
	 end;

{
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
}
	procedure retornarCodigosMayores (v:vector; var cm:codMax);
		function devolverMaximo (a:arbol):arbol;
		begin
			if  (a^.hd = nil) then 
				devolverMaximo := a
			else
				devolverMaximo := devolverMaximo(a^.hd);
		end;
	var
		i:rango;
		aux:arbol;
	begin
		for i:= 1 to dimf do begin
			aux:= nil;
			if (v[i]<>nil) then
				aux := devolverMaximo(v[i] );
			if (aux <> nil ) then begin
				cm[i].cod := aux^.data.cod;
				cm[i].stock := aux^.data.stock ;
			end
			else begin
				cm[i].cod := 0;
				cm[i].stock := 0;
			end;
		end;
	end;
	
	procedure mostrarCodigosMayores (cm:codMax);
	var
		i:rango;
	begin
		for i:=1 to dimf do
			writeln('Codigo: ', cm[i].cod, ' | ', 'Stock: ', cm[i].stock);
	end;

{
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
}
	procedure retornarCantidadPorRubro (v:vector; var c:contador);
		function contarEnRubro (a:arbol; cod1,cod2:integer):integer;
		begin
			if (a <> nil) then begin
				if (a^.data.cod >= cod1) then begin
					if (a^.data.cod <= cod2) then
						contarEnRubro:= contarEnRubro(a^.hi,cod1,cod2) + contarEnRubro(a^.hd,cod1,cod2) +1
					else
						contarEnRubro:= contarEnRubro(a^.hd,cod1,cod2);
				end
				else
					contarEnRubro := contarEnRubro(a^.hd,cod1,cod2);
			end
			else
				contarEnRubro := 0;
		end;
	var
		cod1,cod2:integer;
		i:rango;
	begin
		write('Ingrese un codigo base: ');readln(cod1);
		write('Ingrese el codigo tope: ');readln(cod2);
		for i:= 1 to dimf do begin
			if (v[i] <> nil) then
				c[i] := contarEnRubro (v[i],cod1,cod2);
		end;
	end;
	
	procedure mostrarVectorContador (c:contador);
	var
		i:rango;
	begin
		for i:=1 to dimf do begin
			writeln('Rubro: ',i);
			writeln('Cantidad de productos entre los dos codigos ingresados previamente: ',c[i]); 
		end;
	end;

var
	v:vector;
	c:contador;
	cm:codMax;
begin
	inicializarRubros(v);
	cargarProductosPorRubro(v);
	//mostrarProductosPorRubro(v);
	//buscarCodigoEnRubro(v);
	retornarCodigosMayores(v,cm);
	mostrarCodigosMayores(cm);
	writeln();
	retornarCantidadPorRubro(v,c);
	mostrarVectorContador(c);
end.
