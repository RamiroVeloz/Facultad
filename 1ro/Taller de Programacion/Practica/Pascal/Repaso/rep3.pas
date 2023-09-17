// Una pizzeria recibe pedidos telefonicos de sus clientes. De cada pedido interesa conocer: 
// DNI del cliente, nombre, fecha y monto a abonar del pedido

// 1- Lea la informacion de los pedidos telefonicos hasta ingresar uno con monto 0. A partir de 
// esto, genere una estructura que almacene para cada DNI de cliente, su nombre y una lista con
// informacion de la fecha y monto de los pedidos realizados. La estructura debe estar ordenada
// por DNI y ser eficiente para la busqueda por dicho criterio.

program rep3;

type
	str = string [20];

	pedido = record
		dni:integer;
		nom:str;
		fecha:integer;
		monto:real;
	end;

	
	infoPedido = record
		fecha:integer;
		monto:real;
	end;
	

	lista = ^nodoP;
	nodoP= record
		data:infoPedido;
		sig:lista;
	end;

	cliente = record
		dni:integer;
		nom:str;
		listaPedidos:lista;
	end;

	arbol = ^nodoC;
	nodoC = record
		data:cliente;
		hi:arbol;
		hd:arbol;
	end;

	procedure cargarPedidos (var a:arbol);
		procedure agregarPedidosEnLista (var l:lista; p:pedido);
		var
			ant,act,nue:lista;
		begin
			new(nue);
			nue^.data.fecha := p.fecha;
			nue^.data.monto := p.monto;
			nue^.sig:= nil;
			if (l = nil) then
				l:= nue
			else begin
				ant:= l; act:= l;
				while (act<> nil) and (act^.data.fecha < nue^.data.fecha) do begin
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

		procedure agregarCliente (var a:arbol; p:pedido);
		begin
			if (a = nil) then begin
				new(a);
				a^.data.dni:= p.dni;
				a^.data.nom := p.nom;
				a^.data.listaPedidos := nil;
				agregarPedidosEnLista(a^.data.listaPedidos,p);
				a^.hi := nil; a^.hd := nil;
			end
			else if (a^.data.dni = p.dni) then
				agregarPedidosEnLista(a^.data.listaPedidos,p)
			else if (a^.data.dni > p.dni) then
				agregarCliente(a^.hi,p)
			else
				agregarCliente(a^.hd,p);
		end;

		procedure leerPedido (var p:pedido);
		begin
			write('Ingrese el dni: ');readln(p.dni);
			write('Ingrese el nombre: ');readln(p.nom);
			write('Ingrese la fecha: ');readln(p.fecha);
			write('Ingrese el monto: ');readln(p.monto);
			writeln();
		end;
	var
		p:pedido;
	begin
		leerPedido(p);
		if (p.monto <> 0) then begin
			agregarCliente(a,p);
			cargarPedidos(a);
		end;
	end;

	procedure mostrarClientesYPedidos (a:arbol);
		procedure mostrarPedidos (l:lista);
		begin
			if (l<> nil) then begin
				writeln('Fecha: ', l^.data.fecha, ' | ', 'Monto: ',l^.data.monto:4:2);
				mostrarPedidos(l^.sig);
			end;
		end;
	begin
		if (a <> nil) then begin
			mostrarClientesYPedidos(a^.hi);
			writeln('DNI:', a^.data.dni, ' | ', 'Nombre: ', a^.data.nom);
			writeln('Pedidos: ');
			mostrarPedidos(a^.data.listaPedidos);
			writeln();
			mostrarClientesYPedidos(a^.hd);
		end;
	end;
{
// 2- Informe la cantidad de clientes que realizaron pedidos en una fecha que se lee por teclado
}	procedure informarCantidad (a:arbol);
		function contarEnLista (l:lista; f:integer):integer;
		begin
			if (l <> nil) then begin
				if (l^.data.fecha = f) then
					contarEnLista := contarEnLista(l^.sig,f) + 1
				else
					contarEnLista:= contarEnLista(l^.sig,f);
			end
			else
				contarEnLista:= 0;
		end;

		function recorrerClientes (a:arbol; f:integer):integer;
		begin
			if (a <> nil) then begin
				recorrerClientes := recorrerClientes(a^.hi,f)  + recorrerClientes(a^.hd,f) +  contarEnLista(a^.data.listaPedidos,f)
			end
			else
				recorrerClientes:= 0;
		end;
	var
		f:integer;
		cant:integer;
	begin
		write('Ingrese una fecha para contar la cantidad de pedidos realizados en la misma: ');readln(f);
		if (a<> nil) then begin
			cant := recorrerClientes(a,f);
			writeln('La cantidad de pedidos realizados en la fecha es: ', cant);
		end
		else
			writeln('Arbol vacio.');
	end;

{
// 3- Informar el total abonado y el total de pedidos realizados por el cliente cuyo DNI coincide
// con uno ingresado.
}	procedure informarTotalCliente (a:arbol);
		function retornarMontoTotal (l:lista):real;
		begin
			if (l<> nil) then
				 retornarMontoTotal := retornarMontoTotal(l^.sig) + l^.data.monto
			else
				 retornarMontoTotal:= 0
		end;

		function retornarTotalPedidos (l:lista):integer;
		begin
			if (l<> nil) then
				retornarTotalPedidos  := retornarTotalPedidos (l^.sig) +1
			else
				retornarTotalPedidos := 0
		end;

		function retornarCliente (a:arbol;dni:integer):arbol;
		begin
			if (a <> nil) then begin
				if (a^.data.dni = dni) then
					retornarCliente := a
				else if (a^.data.dni > dni) then
					retornarCliente := retornarCliente(a^.hi,dni)
				else
					retornarCliente:=retornarCliente(a^.hd,dni);
			end
			else
				retornarCliente := nil;
		end;
	var
		dni,cant:integer;
		aux:arbol;
		total:real;
	begin
		cant:= 0;
		total:= 0;
		write('Ingrese un dni para buscar: ');readln(dni);
		if (a<> nil) then begin
			aux := retornarCliente(a,dni);
			if (aux <> nil) then begin
				cant := retornarTotalPedidos(aux^.data.listaPedidos);
				total := retornarMontoTotal(aux^.data.listaPedidos);
				writeln('El cliente de dni ', dni , ' realizo ', cant , ' , gastando un total de ', total:4:2);
			end
			else
				writeln('No se encontro un cliente con ese dni.')
		end
		else
			writeln('Arbol vacio.')
	end;
var
	a:arbol;
begin
	a:=nil;
	cargarPedidos(a);
	mostrarClientesYPedidos(a);
	informarCantidad(a);
	informarTotalCliente(a);
end.

