{
2. Escribir un programa que:

a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0. Un producto puede estar en más de una venta. Se pide:

i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.

ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.

b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.

c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
}

program ej2;

type

    venta = record
        cod:integer;
        fecha:integer;
        cant:integer;
    end;

    prod = record
        cod:integer;
        total:integer;
    end;

    arbolV = ^nodoV;
    nodoV = record
        data:venta;
        hi:arbolV;
        hd:arbolV;
    end;

    arbolP = ^nodoP;
    nodoP = record
        data :prod;
        hi:arbolP;
        hd:arbolP;
    end;

    procedure cargarVentas (var av:arbolV; var ap:arbolP);
        procedure leerVentas (var v:venta);
        begin
            write('Ingrese el codigo del producto: '); readln(v.cod);
            if (v.cod <> 0) then begin
                v.fecha := random (30)+1;
                write('Ingrese la cantidad vendida: ');readln(v.cant);
            end;
        end;

        procedure agregarVenta (var av:arbolV; v:venta);
        begin
            if (av = nil) then begin
                new(av);
                av^.data := v;
                av^.hi := nil; av^.hd:= nil;
            end
            else if (v.cod <= av^.data.cod) then
                agregarVenta (av^.hi, v)
            else 
                agregarVenta (av^.hd,v);
        end;

        procedure contarProd (var ap:arbolP; v:venta);
        begin
            if (ap = nil) then begin
                new(ap);
                ap^.data.cod := v.cod;
                ap^.data.total := v.cant;
                ap^.hi := nil; ap^.hd:= nil;
            end
            else if (v.cod = ap^.data.cod ) then
                ap^.data.total := ap^.data.total + v.cant
            else if (v.cod <= ap^.data.cod ) then
                contarProd (ap^.hi, v)
            else
                contarProd (ap^.hd,v);
        end;

    var
        v:venta;
    begin
        leerVentas(v);
        if (v.cod <> 0) then begin 
            agregarVenta(av,v);
            contarProd (ap,v);
            cargarVentas(av,ap);
        end;
    end;

    procedure mostrarVentas (av:arbolV);
    begin
        if (av <> nil) then begin
            mostrarVentas(av^.hi);
            writeln ('Codigo del producto: ', av^.data.cod , ' | ', 'Fecha: ', av^.data.fecha , ' | ', 'Cantidad pedida: ', av^.data.cant);
            mostrarVentas(av^.hd);
        end;
    end;

    procedure mostrarProductos (ap:arbolP);
    begin
        if (ap <> nil) then begin
            mostrarProductos(ap^.hi);
            writeln ('Codigo del producto: ', ap^.data.cod ,' | ', 'Total Vendido: ', ap^.data.total);
            mostrarProductos(ap^.hd);
        end;
    end;

    {
    b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
    la cantidad total de unidades vendidas de ese producto.
    }

    procedure buscarVenta (av:arbolV);
        function buscarA(av:arbolV; cod:integer):integer;
        begin
            if (av = nil) then
                buscarA := 0
            else begin
                if (cod = av^.data.cod ) then
                    buscarA := av^.data.cant + buscarA(av^.hi,cod) + buscarA(av^.hd,cod)
                else if (cod <= av^.data.cod) then
                    buscarA := buscarA (av^.hi,cod)
                else if (cod > av^.data.cod ) then
                    buscarA := buscarA(av^.hd,cod) ;
            end;
        end;
    var
        cod:integer;
        cant:integer;
    begin
        write('Ingrese un codigo para buscar : ');readln(cod);
        cant := buscarA(av,cod);
        if (av = nil) then
            writeln('Arbol vacio.')
        else if (cant = 0) then
            writeln('El producto no se encuentra en el arbol.')
        else
            writeln ('La cantidad vendida del producto ',cod, ' es: ', cant);
    end;

    {
    c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
    la cantidad total de unidades vendidas de ese producto. 
    }
    procedure buscarProd (ap:arbolP);
        function buscarB(ap:arbolP; cod:integer):integer;
        begin
            if (ap = nil) then 
                buscarB := 0
            else if (ap^.data.cod = cod) then
                buscarB := ap^.data.total
            else if (cod < ap^.data.cod) then
                buscarB := buscarB(ap^.hi,cod)
            else if (cod > ap^.data.cod ) then
                buscarB := buscarB(ap^.hd,cod);
        end;
    var
        cod:integer;
        cant :integer;
    begin
        write('Ingrese un codigo para buscar : ');readln(cod);
        cant := buscarB(ap,cod);
        if (ap = nil) then
            writeln('Arbol vacio.')
        else if (cant = 0) then
            writeln('El producto no se encuentra en el arbol.')
        else
            writeln ('La cantidad vendida del producto ',cod, ' es: ', cant);
    end;

    {
    c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
    la cantidad total de unidades vendidas de ese producto. 
    }



var
    av:arbolV;
    ap:arbolP;
begin
    av:= nil;
    ap:= nil;
    cargarVentas(av,ap);
    writeln('----------------------------------------------------');
    writeln('Ventas realizadas: ');
    mostrarVentas(av);
    writeln('----------------------------------------------------');
    writeln();
    writeln('----------------------------------------------------');
    writeln('Cantidades vendidas por producto: ');
    mostrarProductos(ap);
    writeln('----------------------------------------------------');
    buscarVenta(av);
    buscarProd(ap);
end.

