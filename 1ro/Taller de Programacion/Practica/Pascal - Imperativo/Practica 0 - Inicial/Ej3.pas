{
3.- Implementar un programa que procese las ventas de un supermercado. El supermercado 
dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.

a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de las ventas. 
De cada venta se lee código de venta y los productos vendidos. Las ventas finalizan con el código de 
venta -1. De cada producto se lee código y cantidad de unidades solicitadas. Para cada venta, la lectura 
de los productos a vender finaliza con cantidad de unidades vendidas igual a 0. El ticket debe contener:
- Código de venta
- Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. En 
caso de no haber stock suficiente, se venderá la máxima cantidad posible.
- Monto total de la venta.
c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de 
producto y retorne la cantidad de unidades vendidas de ese código de producto.
}

program ej3;

const
    max = 1000;

type
    rango = 1..max;

    tabla = record
        precio : real;
        stock:integer;
    end;

    vector = array [rango] of tabla;

{
    una estructura de datos adecuada, los tickets de las ventas

    Detalle (código de producto, cantidad y precio unitario)
}

    detalle = record
        codP:integer;
        cant:integer;
        precioU:real;
    end;

    listaDetalle = ^nd;
    nd = record
        dato:detalle;
        sig:listaDetalle;
    end;

    ticket = record
        codV:integer;
        detalle:listaDetalle;
        montoTotal : real;
    end;

    listaTickets = ^nt;
    nt = record
        dato:ticket;
        sig:listaTickets;
    end;

    procedure tablaStock(var v:vector);
    var
        i:integer;
    begin
        Randomize();
        for i:= 1 to max do begin;
            v[i].precio := i * 3.14;
            v[i].stock := random(1000);
        end;
    end;

    procedure cargarTicket (var lt:listaTickets; var v:vector);
        procedure leerDetalle (var d:detalle; var v:vector;var total:real);
        begin
            write('Ingrese el codigo del producto: ');readln(d.codP);
            write('Ingrese la cantidad de unidades: ');readln(d.cant);
            if (d.cant <> 0) then begin
                if (v[d.codP].stock = 0) then begin
                    writeln ('No hay stock del producto.')
                end
                else if (v[d.codP].stock >= d.cant) then begin
                    v[d.codP].stock := v[d.codP].stock - d.cant
                end
                else if (v[d.codP].stock <= d.cant) then begin
                    d.cant := v[d.codP].stock
                end;
                d.precioU :=  v[d.codP].precio;
                writeln('Precio unitario del producto: ', d.precioU:4:2);
                total := total + (d.precioU * d.cant);
            end;
        end;

        procedure agregarDetalle (var ld:listaDetalle ; d:detalle);
        var
            ant, act,nue:listaDetalle;
        begin
            new(nue);
            nue^.dato:= d;
            nue^.sig:= nil;
            if (ld = nil) then
                ld:= nue
            else begin
                ant:= ld; act:= ld;
                while (act <> nil) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                ant^.sig:= nue;
            end;
        end;

        procedure agregarTicket (var lt: listaTickets; t:ticket);
        var
            ant, act,nue:listaTickets;
        begin
            new(nue);
            nue^.dato:= t;
            nue^.sig:= nil;
            if (lt = nil) then
                lt:= nue
            else begin
                ant:= lt; act:= lt;
                while (act <> nil) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                ant^.sig:= nue;
            end;
        end;

    var

        d:detalle;
        t:ticket;
        total: real;
    begin

        write('Ingrese el codigo de venta: ');readln(t.codV);
        while (t.codV <> -1) do begin
            total := 0;
            t.detalle := nil;
            leerDetalle(d,v,total);
            while (d.cant <> 0) do begin
                agregarDetalle(t.detalle, d);
                leerDetalle(d,v,total);
            end;
            t.montoTotal := total;
            agregarTicket(lt, t);
            write('Ingrese el codigo de venta: ');readln(t.codV);
        end;
    end;

    procedure mostrarListaTicket (lt:listaTickets);
        {
            código de producto, cantidad y precio unitario
        }
        procedure mostrarListaDetalles (ld : listaDetalle);
        begin
            while (ld <> nil) do begin
                writeln ('-------------------------------------------------');
                writeln('Codigo de Producto: ', ld^.dato.codP);
                writeln('Cantidad pedida: ', ld^.dato.cant);
                writeln('Precio Unitario: ', ld^.dato.precioU:4:2);
                writeln ('-------------------------------------------------');
                ld:= ld^.sig;
            end;
        end;
    begin
        {
            - Código de venta
            - Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. En 
                caso de no haber stock suficiente, se venderá la máxima cantidad posible.
            - Monto total de la venta.
        }
        while (lt <> nil ) do begin
            writeln ('-----------------------------------------------------------------------------------------------');
            writeln('Codigo de Venta: ', lt^.dato.codV);
            writeln('Detalle: ');
                mostrarListaDetalles (lt^.dato.detalle);
            writeln('Monto total: ', lt^.dato.montoTotal:4:2);
            writeln ('-----------------------------------------------------------------------------------------------');
            lt:= lt^.sig;
        end;
    end;

{
    c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de 
    producto y retorne la cantidad de unidades vendidas de ese código de producto.  
}

    procedure retornarUnidades ( lt:listaTickets);
        function recorrerProds (ld:listaDetalle; cod:integer):integer;
        var
            cant:integer;
        begin
            cant:= 0;
            while (ld <> nil ) do begin
                if (ld^.dato.codP = cod) then begin
                    cant:= cant + ld^.dato.cant;
                end;
                ld:= ld^.sig;
            end;
            recorrerProds := cant;
        end;

    var
        cod, cant:integer;
    begin
        writeln ('-----------------------------------------------------------------------------------------------');
        cant:= 0;
        write('Ingrese el codigo del producto para saber cuantas unidades vendio: ');readln(cod);
        while (lt <> nil) do begin
            cant:= cant + (recorrerProds(lt^.dato.detalle, cod));
            lt:= lt^.sig;
        end;
        writeln ('La cantidad de unidades vendidas del producto ', cod, ' es: ', cant);
        writeln ('-----------------------------------------------------------------------------------------------');
    end;

var
    v:vector;
    lt:listaTickets;

begin
    lt:= nil;
    tablaStock(v);
    cargarTicket(lt,v);
    mostrarListaTicket(lt);
    retornarUnidades(lt);
end.
